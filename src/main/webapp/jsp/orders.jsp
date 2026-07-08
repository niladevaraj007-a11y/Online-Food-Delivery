<%@ page import="java.util.*,com.foodorder.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
<!DOCTYPE html>
<html>
<head><title>My Orders</title><link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head"><h1 class="section-title">My Orders</h1></div>
    <div class="grid">
        <% if (orders != null) for (Order o : orders) { %>
        <article class="dashboard-card">
            <h2>Order #<%=o.getOrderId()%></h2>
            <p><b>Total Amount:</b> ₹<%=o.getTotalAmount()%></p>
            <p><b>Order Date:</b> <%=o.getOrderDate()%></p>
            <p><b>Payment:</b> <%=o.getPaymentMethod()%></p>
            <p><b>Status:</b> <span class="welcome"><%=o.getStatus()%></span></p>
        </article>
        <% } %>
    </div>
</main>
</body>
</html>
