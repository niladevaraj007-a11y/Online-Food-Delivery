<%@ page import="java.util.*,com.foodorder.model.MenuItem,com.foodorder.model.Restaurant" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<MenuItem> items = (List<MenuItem>) request.getAttribute("menuItems");
    Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/app.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head">
        <h1 class="section-title"><%= restaurant != null ? restaurant.getName() : "Menu" %></h1>
        <p class="muted">Cart (<span class="cart-count"><%=cartCount%></span>)</p>
        <div id="toast"></div>
    </div>

    <div class="grid">
        <% if (items != null) for (MenuItem item : items) { %>
            <article class="card">
                <img class="food-img" src="<%=item.getImageUrl()%>" alt="<%=item.getItemName()%>">
                <div class="card-body">
                    <h2><%=item.getItemName()%></h2>
                    <p class="muted"><%=item.getDescription()%></p>
                    <div class="meta"><strong>Rs. <%=String.format("%.2f", item.getPrice())%></strong></div>

                    <form method="post" action="<%=request.getContextPath()%>/add-to-cart" onsubmit="return addToCart(this, event)">
                        <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
                        <input type="hidden" name="returnUrl" value="<%=request.getContextPath()%>/menu?restaurantId=<%=item.getRestaurantId()%>">
                        <div class="qty-control">
                            <button class="icon-btn" type="button" onclick="changeQty('qty-<%=item.getMenuId()%>', -1)">-</button>
                            <input id="qty-<%=item.getMenuId()%>" name="quantity" value="1" inputmode="numeric">
                            <button class="icon-btn" type="button" onclick="changeQty('qty-<%=item.getMenuId()%>', 1)">+</button>
                        </div>
                        <button class="btn" type="submit">Add To Cart</button>
                    </form>
                </div>
            </article>
        <% } %>
    </div>
</main>
<a class="floating-cart" href="<%=request.getContextPath()%>/cart">
    Cart: <span class="cart-count"><%=cartCount%></span> Items<br>View Cart
</a>
</body>
</html>
