<%@ page import="java.util.*,com.foodorder.model.Order" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Orders</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<h1 class="section-title">
Manage Orders
</h1>

<table class="admin-table">

<thead>

<tr>

<th>Order ID</th>
<th>User ID</th>
<th>Total</th>
<th>Payment</th>
<th>Status</th>
<th>Date</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%

List<Order> orders =
(List<Order>)request.getAttribute("orders");

if(orders!=null){

for(Order o:orders){

%>

<tr>

<td><%=o.getOrderId()%></td>

<td><%=o.getUserId()%></td>

<td>&#8377;<%=o.getTotalAmount()%></td>

<td><%=o.getPaymentMethod()%></td>

<td><%=o.getStatus()%></td>

<td><%=o.getOrderDate()%></td>

<td>

<a class="btn"
   href="<%=request.getContextPath()%>/editOrder?id=<%=o.getOrderId()%>">

    Update Status

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