<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="auth-bg">
<div class="auth-wrap">
    <form class="auth-card" action="<%=request.getContextPath()%>/login" method="post">
        <h1>Welcome back</h1>
        <p class="muted">Login to continue ordering.</p>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert error"><%=request.getAttribute("error")%></div>
        <% } %>
        <div class="form-group"><label>Email</label><input type="email" name="email" required></div>
        <div class="form-group"><label>Password</label><input type="password" name="password" required></div>
        <button class="btn" type="submit" style="width:100%;">Login</button>
        <p>New here? <a class="welcome" href="<%=request.getContextPath()%>/jsp/register.jsp">Create Account</a></p>
    </form>
</div>
</body>
</html>
