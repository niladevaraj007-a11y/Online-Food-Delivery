<%@ page import="java.util.*,com.foodorder.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Collection<CartItem> cartItems = (Collection<CartItem>) request.getAttribute("cartItems");
    Double grandTotal = (Double) request.getAttribute("grandTotal");
    if (grandTotal == null) grandTotal = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head">
        <h1 class="section-title">Shopping Cart</h1>
        <p class="muted">Review your items before checkout.</p>
    </div>

    <div class="cart-layout">
        <div>
            <% if (cartItems == null || cartItems.isEmpty()) { %>
                <div class="dashboard-card">
                    <h2>Your cart is empty</h2>
                    <p class="muted">Add items from a restaurant menu to see them here.</p>
                    <a class="btn" href="<%=request.getContextPath()%>/restaurants">Continue Shopping</a>
                </div>
            <% } else { for (CartItem c : cartItems) { %>
                <div class="cart-row">
                    <img src="<%=c.getImageUrl()%>" alt="<%=c.getItemName()%>">
                    <div>
                        <h3><%=c.getItemName()%></h3>
                        <p>Rs. <%=String.format("%.2f", c.getPrice())%></p>
                        <form class="qty-control" method="post" action="<%=request.getContextPath()%>/cart">
                            <input type="hidden" name="menuId" value="<%=c.getMenuId()%>">
                            <button class="icon-btn" name="action" value="decrease" type="submit">-</button>
                            <input name="quantity" value="<%=c.getQuantity()%>" inputmode="numeric">
                            <button class="icon-btn" name="action" value="increase" type="submit">+</button>
                            <button class="btn secondary" name="action" value="update" type="submit">Update</button>
                            <button class="btn secondary" name="action" value="remove" type="submit">Remove</button>
                        </form>
                    </div>
                    <strong class="line-total">Rs. <%=String.format("%.2f", c.getSubtotal())%></strong>
                </div>
            <% } } %>
        </div>

        <aside class="summary">
            <h2>Grand Total</h2>
            <h1>Rs. <%=String.format("%.2f", grandTotal)%></h1>
            <a class="btn secondary" href="<%=request.getContextPath()%>/restaurants">Continue Shopping</a>
            <% if (cartItems != null && !cartItems.isEmpty()) { %>
                <a class="btn" href="<%=request.getContextPath()%>/checkout">Proceed To Checkout</a>
                <a class="btn ghost" style="color:#ff5200;border-color:#ffd1bc;" href="<%=request.getContextPath()%>/checkout">Place Order</a>
            <% } %>
        </aside>
    </div>
</main>
</body>
</html>
