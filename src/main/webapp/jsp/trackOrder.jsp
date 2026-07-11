<%@ page import="com.foodorder.model.Order"%>

<%
Order order = (Order) request.getAttribute("order");
String status = order.getStatus();

int progress = 25;

if ("Preparing".equals(status)) {
    progress = 50;
} else if ("Out for Delivery".equals(status)) {
    progress = 75;
} else if ("Delivered".equals(status)) {
    progress = 100;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Track Order</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    background:#f5f5f5;
}

.track-box{
    max-width:800px;
    margin:40px auto;
    background:#fff;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,.12);
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.header h2{
    color:#ff6b35;
}

.status-badge{
    background:#ff6b35;
    color:#fff;
    padding:10px 20px;
    border-radius:25px;
    font-weight:bold;
}

.progress{
    width:100%;
    height:10px;
    background:#ddd;
    border-radius:20px;
    overflow:hidden;
    margin:30px 0;
}

.progress-fill{
    height:100%;
    background:linear-gradient(to right,#ff6b35,#ff9800);
    transition:1s;
}

.timeline{
    position:relative;
    margin-left:18px;
}

.timeline:before{
    content:"";
    position:absolute;
    left:19px;
    top:0;
    width:4px;
    height:100%;
    background:#ddd;
}

.timeline-item{
    position:relative;
    display:flex;
    align-items:flex-start;
    margin-bottom:35px;
    opacity:.45;
    transition:.5s;
}

.timeline-item.completed{
    opacity:1;
}

.circle{
    width:42px;
    height:42px;
    border-radius:50%;
    background:#ccc;
    display:flex;
    justify-content:center;
    align-items:center;
    color:#fff;
    z-index:10;
    transition:.5s;
}

.timeline-item.completed .circle{
    background:#2ecc71;
    animation:pop .5s;
}

.content{
    margin-left:20px;
}

.content h3{
    margin:0;
}

.content p{
    margin-top:6px;
    color:#666;
}

@keyframes pop{

0%{
transform:scale(.4);
}

70%{
transform:scale(1.2);
}

100%{
transform:scale(1);
}

}

</style>

</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="track-box">

<div class="header">

<h2>

<i class="fa-solid fa-truck-fast"></i>

Track Order #<%=order.getOrderId()%>

</h2>

<div class="status-badge">

<%=status%>

</div>

</div>

<div class="progress">

<div class="progress-fill"
style="width:<%=progress%>%;">
</div>

</div>

<div class="timeline">

<div class="timeline-item <%= !"Cancelled".equals(status) ? "completed" : "" %>">

<div class="circle">

<i class="fa-solid fa-check"></i>

</div>

<div class="content">

<h3>Order Placed</h3>

<p>Your order has been received.</p>

</div>

</div>

<div class="timeline-item <%= ("Preparing".equals(status)||"Out for Delivery".equals(status)||"Delivered".equals(status)) ? "completed" : "" %>">

<div class="circle">

<i class="fa-solid fa-utensils"></i>

</div>

<div class="content">

<h3>Preparing Food</h3>

<p>Restaurant is preparing your meal.</p>

</div>

</div>

<div class="timeline-item <%= ("Out for Delivery".equals(status)||"Delivered".equals(status)) ? "completed" : "" %>">

<div class="circle">

<i class="fa-solid fa-motorcycle"></i>

</div>

<div class="content">

<h3>Out for Delivery</h3>

<p>Your delivery partner is on the way.</p>

</div>

</div>

<div class="timeline-item <%= "Delivered".equals(status) ? "completed" : "" %>">

<div class="circle">

<i class="fa-solid fa-house"></i>

</div>

<div class="content">

<h3>Delivered</h3>

<p>Enjoy your meal.</p>

</div>

</div>

<% if("Cancelled".equals(status)){ %>

<div class="timeline-item completed">

<div class="circle" style="background:red;">

<i class="fa-solid fa-xmark"></i>

</div>

<div class="content">

<h3>Order Cancelled</h3>

<p>Your order has been cancelled.</p>

</div>

</div>

<% } %>

</div>

</div>

</body>

</html>