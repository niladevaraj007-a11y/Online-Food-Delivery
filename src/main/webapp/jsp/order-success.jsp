<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Successful</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%@ include file="navbar.jspf" %>

<main class="container section">

    <div class="success-card">

        <div class="success-icon">✓</div>

        <h1>Order Placed Successfully!</h1>

        <p class="muted">
            Thank you for your order.
            Your food is being prepared and will be delivered soon.
        </p>

        <div class="order-status">
            <div class="status-step active">
                <span>✓</span>
                Order Confirmed
            </div>

            <div class="status-step">
                <span>🍳</span>
                Preparing Food
            </div>

            <div class="status-step">
                <span>🛵</span>
                Out For Delivery
            </div>

            <div class="status-step">
                <span>🏠</span>
                Delivered
            </div>
        </div>

        <div class="success-actions">
            <a href="<%=request.getContextPath()%>/orders" class="btn">
                View My Orders
            </a>

            <a href="<%=request.getContextPath()%>/restaurants" class="btn secondary">
                Order More Food
            </a>
        </div>

    </div>

</main>

</body>
</html>