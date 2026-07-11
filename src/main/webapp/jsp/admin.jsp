<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Admin Dashboard</title><link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head"><h1 class="section-title">Admin Dashboard</h1><p class="muted">Operations overview and management.</p></div>
    <div class="grid">
        <div class="admin-stat"><h3>Total Users</h3><h1><%=request.getAttribute("totalUsers")%></h1></div>
        <div class="admin-stat"><h3>Total Restaurants</h3><h1><%=request.getAttribute("totalRestaurants")%></h1></div>
        <div class="admin-stat"><h3>Total Orders</h3><h1><%=request.getAttribute("totalOrders")%></h1></div>
        <div class="admin-stat"><h3>Revenue</h3><h1>₹<%=request.getAttribute("revenue")%></h1></div>
    </div>
    <div class="section grid">
        <a href="<%=request.getContextPath()%>/admin/restaurants" class="dashboard-card">
    <h2>🍽️ Manage Restaurants</h2>
    <p class="muted">Add, update, or remove restaurant listings.</p>
</a>
        <a href="<%=request.getContextPath()%>/admin/menu" class="dashboard-card">
    <h2>🍔 Manage Menu</h2>
    <p class="muted">Maintain food items, prices, and availability.</p>
</a>

<a href="<%=request.getContextPath()%>/admin/orders"
   class="dashboard-card">

    <h2>📦 Manage Orders</h2>

    <p class="muted">
        View and update customer orders.
    </p>

</a>
<a href="<%=request.getContextPath()%>/admin/users"
   class="dashboard-card">

    <h2>👥 Manage Users</h2>

    <p class="muted">
        View, manage and remove customer accounts.
    </p>

</a>
    </div>
</main>
</body>
</html>
