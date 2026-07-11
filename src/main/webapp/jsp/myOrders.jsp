<%@ page import="java.util.*,com.foodorder.model.Order"%>

<%
List<Order> orders = (List<Order>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<h1 class="section-title">My Orders</h1>

<%
if(orders == null || orders.isEmpty()){
%>

<h3>No Orders Yet</h3>

<%
}else{

for(Order o : orders){
%>

<div class="card">

<div class="card-body">

<h2>Order #<%=o.getOrderId()%></h2>

<p>
Amount :
&#8377;<%=o.getTotalAmount()%>
</p>

<p>
Payment :
<%=o.getPaymentMethod()%>
</p>

<p>
Status :
<b><%=o.getStatus()%></b>
</p>

<p>
Date :
<%=o.getOrderDate()%>
</p>

<br>

<a class="btn"
   href="<%=request.getContextPath()%>/trackOrder?id=<%=o.getOrderId()%>">
    Track Order
</a>

</div>

</div>

<br>

<%
}
}
%>

</div>

</body>
</html>