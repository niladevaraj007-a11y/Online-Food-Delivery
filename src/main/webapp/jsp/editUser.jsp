<%@ page import="com.foodorder.model.User"%>

<%
User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit User</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body class="admin-bg">

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="edit-user-card">

<div class="edit-header">

<div class="user-avatar">

<%=user.getUsername().substring(0,1).toUpperCase()%>

</div>

<h1>Edit User</h1>

<p>Update user information and permissions.</p>

</div>

<form action="<%=request.getContextPath()%>/admin/editUser"
method="post">

<input
type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<div class="form-group">

<label>

<i class="fa-solid fa-user"></i>

Username

</label>

<input
type="text"
name="username"
value="<%=user.getUsername()%>"
required>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-envelope"></i>

Email Address

</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-location-dot"></i>

Address

</label>

<textarea
name="address"
rows="4"><%=user.getAddress()%></textarea>

</div>

<div class="form-group">

<label>

<i class="fa-solid fa-user-shield"></i>

Role

</label>

<select name="role">

<option value="CUSTOMER"
<%= "CUSTOMER".equals(user.getRole()) ? "selected" : "" %>>
Customer
</option>

<option value="ADMIN"
<%= "ADMIN".equals(user.getRole()) ? "selected" : "" %>>
Admin
</option>

</select>

</div>

<div class="button-group">

<button
type="submit"
class="save-btn">

<i class="fa-solid fa-floppy-disk"></i>

Update User

</button>

<a
href="<%=request.getContextPath()%>/admin/users"
class="cancel-btn">

<i class="fa-solid fa-xmark"></i>

Cancel

</a>

</div>

</form>

</div>

</div>

</body>

</html>