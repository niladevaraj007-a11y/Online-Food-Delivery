<%@ page import="java.util.*,com.foodorder.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% User u = (User) session.getAttribute("user"); Double grandTotal = (Double) request.getAttribute("grandTotal"); if (grandTotal == null) grandTotal = 0.0; %>
<!DOCTYPE html>
<html>
<head><title>Checkout</title><link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body>
<%@ include file="navbar.jspf" %>
<main class="container section">
    <div class="page-head"><h1 class="section-title">Checkout</h1></div>
    <form class="checkout-layout" action="<%=request.getContextPath()%>/checkout" method="post">
        <div class="dashboard-card">
            <h2>Customer Details</h2>
            <p><b>Name:</b> <%=u != null ? u.getUsername() : ""%></p>
            <p><b>Email:</b> <%=u != null ? u.getEmail() : ""%></p>
            <div class="form-group"><label>Delivery Address</label><textarea name="address" required><%=u != null ? u.getAddress() : ""%></textarea></div>
            <div class="form-group"><label>Payment Method</label>
                <select name="paymentMethod">
                    <option>Cash On Delivery</option><option>UPI</option><option>Credit Card</option>
                </select>
            </div>
        </div>
        <aside class="summary">
            <h2>Order Summary</h2>
            <h1>₹<%=String.format("%.2f", grandTotal)%></h1>
            <button class="btn" type="submit" style="width:100%;">Confirm Order</button>
        </aside>
    </form>
</main>
</body>
</html>
