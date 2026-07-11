<%@ page import="java.util.*,com.foodorder.model.MenuItem,com.foodorder.model.Restaurant"%>

<%
MenuItem item = (MenuItem)request.getAttribute("menuItem");
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Menu</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="form-container">

<h2>Edit Menu Item</h2>

<form action="<%=request.getContextPath()%>/updateMenu"
method="post">

<input type="hidden"
name="menuId"
value="<%=item.getMenuId()%>">

<label>Restaurant</label>

<select name="restaurantId">

<%
for(Restaurant r:restaurants){
%>

<option value="<%=r.getRestaurantId()%>"
<%=item.getRestaurantId()==r.getRestaurantId()?"selected":""%>>

<%=r.getName()%>

</option>

<%
}
%>

</select>

<br><br>

<label>Food Name</label>

<input type="text"
name="itemName"
value="<%=item.getItemName()%>">

<br><br>

<label>Description</label>

<input type="text"
name="description"
value="<%=item.getDescription()%>">

<br><br>

<label>Price</label>

<input type="number"
step="0.01"
name="price"
value="<%=item.getPrice()%>">

<br><br>

<label>Image URL</label>

<input type="text"
name="imageUrl"
value="<%=item.getImageUrl()%>">

<br><br>

<label>

<input type="checkbox"
name="available"
<%=item.isAvailable()?"checked":""%>>

Available

</label>

<br><br>

<button class="btn">
Update Menu
</button>

</form>

</div>

</div>

</body>
</html>