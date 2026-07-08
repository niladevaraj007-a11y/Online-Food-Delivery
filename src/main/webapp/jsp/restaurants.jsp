<%@ page import="java.util.*,com.foodorder.model.Restaurant" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants"); %>
<!DOCTYPE html>
<html>
<head><title>Restaurants</title><link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head"><h1 class="section-title">Restaurants</h1><p class="muted">Choose your favorite kitchen.</p></div>
    <div class="grid">
        <% if (restaurants != null) for (Restaurant r : restaurants) { %>
        <article class="card">
            <img class="food-img" src="<%=r.getImageUrl()%>" alt="<%=r.getName()%>">
            <div class="card-body">
                <h2><%=r.getName()%></h2>
                <div class="meta"><span><%=r.getCuisineType()%></span><span class="rating">★ <%=r.getRating()%></span></div>
                <p class="muted"><%=r.getDeliveryTime()%></p>
                <a class="btn" href="<%=request.getContextPath()%>/menu?restaurantId=<%=r.getRestaurantId()%>">View Menu</a>
            </div>
        </article>
        <% } %>
    </div>
</main>
</body>
</html>
