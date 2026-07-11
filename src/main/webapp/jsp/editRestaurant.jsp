<%@ page import="com.foodorder.model.Restaurant" %>
<%
Restaurant r = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Restaurant</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="form-container">

<h1 class="section-title">
Edit Restaurant
</h1>

<form action="<%=request.getContextPath()%>/updateRestaurant"
method="post">

<input type="hidden"
name="restaurantId"
value="<%=r.getRestaurantId()%>">

<div class="form-group">

<label>Restaurant Name</label>

<input type="text"
name="name"
value="<%=r.getName()%>"
required>

</div>

<div class="form-group">

<label>Cuisine</label>

<input type="text"
name="cuisineType"
value="<%=r.getCuisineType()%>"
required>

</div>

<div class="form-group">

<label>Delivery Time</label>

<input type="text"
name="deliveryTime"
value="<%=r.getDeliveryTime()%>"
required>

</div>

<div class="form-group">

<label>Rating</label>

<input type="number"
step="0.1"
name="rating"
value="<%=r.getRating()%>"
required>

</div>

<div class="form-group">

<label>Image URL</label>

<input type="text"
name="imageUrl"
value="<%=r.getImageUrl()%>"
required>

</div>

<button class="btn">
Update Restaurant
</button>

</form>

</div>

</div>

</body>
</html>