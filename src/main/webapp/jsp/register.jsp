<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/app.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="auth-bg">
<div class="auth-wrap">
    <form name="registerForm" class="auth-card" action="<%=request.getContextPath()%>/register" method="post" onsubmit="return validateRegister()">
        <h1>Create Account</h1>
        <% if (request.getAttribute("error") != null) { %><div class="alert error"><%=request.getAttribute("error")%></div><% } %>
        <div class="form-group"><label>Username</label><input name="username" required></div>
        <div class="form-group"><label>Email</label><input type="email" name="email" required></div>
        <div class="form-group"><label>Password</label><input type="password" name="password" minlength="6" required></div>
        <div class="form-group"><label>Address</label><textarea name="address" required></textarea></div>
        <button class="btn" type="submit" style="width:100%;">Register</button>
        <p>Already have account? <a class="welcome" href="<%=request.getContextPath()%>/jsp/login.jsp">Login</a></p>
    </form>
</div>
</body>
</html>
