<%@ page import="java.util.*,com.foodorder.model.Restaurant" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Menu Item</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body class="admin-bg">

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="menu-form-card">

<div class="menu-header">

<i class="fa-solid fa-burger"></i>

<a href="<%=request.getContextPath()%>/addMenu" class="btn">
    Add Menu
</a>

<p>Add delicious food items for your restaurant.</p>

</div>

<form action="<%=request.getContextPath()%>/addMenu"
method="post">

<div class="form-group">

<label>

<i class="fa-solid fa-store"></i>

Restaurant

</label>

<select name="restaurantId" required>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");

if(restaurants!=null){
for(Restaurant r:restaurants){
%>

<option value="<%=r.getRestaurantId()%>">

<%=r.getName()%>

</option>

<%
}
}
%>

</select>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-utensils"></i>

Food Name

</label>

<input
type="text"
name="itemName"
placeholder="Enter Food Name"
required>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-align-left"></i>

Description

</label>

<textarea
name="description"
rows="4"
placeholder="Enter Food Description"
required></textarea>

</div>

<div class="two-column">

<div class="form-group">

<label>

<i class="fa-solid fa-indian-rupee-sign"></i>

Price

</label>

<input
type="number"
step="0.01"
name="price"
placeholder="299"
required>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-image"></i>

Image URL

</label>

<input
type="text"
name="imageUrl"
placeholder="images/pizza.jpg"
required>

</div>

</div>

<div class="availability">

<label>

<input
type="checkbox"
name="available"
checked>

Available for Ordering

</label>

</div>

<button class="save-btn">

<i class="fa-solid fa-floppy-disk"></i>

Save Menu Item

</button>

</form>

</div>

</div>

</body>

</html>