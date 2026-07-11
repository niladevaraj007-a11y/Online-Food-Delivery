<%@ page import="com.foodorder.model.Order" %>

<%
Order order = (Order)request.getAttribute("order");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Update Order Status</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

<div class="form-container">

<h2>Update Order Status</h2>

<form action="<%=request.getContextPath()%>/updateOrder"
method="post">

<input type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<label>Order Status</label>

<select name="status">

<option <%=order.getStatus().equals("Pending")?"selected":""%>>
Pending
</option>

<option <%=order.getStatus().equals("Preparing")?"selected":""%>>
Preparing
</option>

<option <%=order.getStatus().equals("Out for Delivery")?"selected":""%>>
Out for Delivery
</option>

<option <%=order.getStatus().equals("Delivered")?"selected":""%>>
Delivered
</option>

<option <%=order.getStatus().equals("Cancelled")?"selected":""%>>
Cancelled
</option>

</select>

<br><br>

<button class="btn">

Update Status

</button>

</form>

</div>

</div>

</body>
</html>