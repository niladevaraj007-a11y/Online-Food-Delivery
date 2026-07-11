<%@ page import="java.util.*,com.foodorder.model.User"%>

<%
List<User> users=(List<User>)request.getAttribute("users");
%>

<!DOCTYPE html>
<html>

<head>

<title>Manage Users</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="page-head">

<h1 class="section-title">
&#128101; Manage Users
</h1>

</div>

<table class="admin-table">

<thead>

<tr>

<th>ID</th>

<th>Name</th>

<th>Email</th>

<th>Address</th>

<th>Role</th>

<th>Actions</th>

</tr>

</thead>

<tbody>

<%

for(User u:users){

%>

<tr>

<td><%=u.getUserId()%></td>

<td><%=u.getUsername()%></td>

<td><%=u.getEmail()%></td>

<td><%=u.getAddress()%></td>

<td><%=u.getRole()%></td>

<td>

<a class="btn"
href="<%=request.getContextPath()%>/admin/editUser?id=<%=u.getUserId()%>">

Edit

</a>

<a class="btn danger"
href="<%=request.getContextPath()%>/admin/deleteUser?id=<%=u.getUserId()%>"
onclick="return confirm('Are you sure you want to delete this user?');">

Delete

</a>
</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</body>

</html>