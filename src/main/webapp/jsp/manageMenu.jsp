<%@ page import="java.util.*,com.foodorder.model.MenuItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Menu</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="page-head">

<h1 class="section-title">
<i class="fa-solid fa-burger"></i>  Manage Menu
</h1>

<a href="<%=request.getContextPath()%>/jsp/addMenu.jsp"
class="btn">

+ Add Menu Item

</a>

</div>

<table class="admin-table">

<thead>

<tr>

<th>Image</th>
<th>Restaurant ID</th>
<th>Item</th>
<th>Price</th>
<th>Available</th>
<th>Actions</th>

</tr>

</thead>

<tbody>

<%

List<MenuItem> list =
(List<MenuItem>)request.getAttribute("menuItems");

if(list!=null){

for(MenuItem m:list){

%>

<tr>

<td>

<img src="<%=m.getImageUrl()%>"
width="70">

</td>

<td>

<%=m.getRestaurantId()%>

</td>

<td>

<%=m.getItemName()%>

</td>

<td>

&#8377;<%=m.getPrice()%>

</td>

<td>

<%=m.isAvailable()?"Yes":"No"%>

</td>

<td>

    <a href="<%=request.getContextPath()%>/editMenu?id=<%=m.getMenuId()%>"
       class="btn">
        Edit
    </a>

    <a href="<%=request.getContextPath()%>/deleteMenu?id=<%=m.getMenuId()%>"
       class="btn delete-btn"
       onclick="return confirm('Are you sure you want to delete this menu item?');">
        Delete
    </a>

</td>

</tr>

<%

}

}

%>

</tbody>

</table>

</div>

</body>
</html>