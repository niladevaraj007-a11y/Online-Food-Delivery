<%@ page import="com.foodorder.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("user");

    if(user == null){
        response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

</head>

<body class="profile-page">

<%@ include file="navbar.jspf" %>

<div class="container">

    <!-- Page Header -->

    <div class="profile-header">

        <div class="profile-info">

            <div class="profile-avatar">
                <%= user.getUsername().substring(0,1).toUpperCase() %>
            </div>

            <div class="profile-details">

                <h2><%= user.getUsername() %></h2>

                <p>
                    <i class="fa-solid fa-envelope"></i>
                    <%= user.getEmail() %>
                </p>

                <p>
                    <i class="fa-solid fa-location-dot"></i>
                    <%= user.getAddress() %>
                </p>

                <span class="role-badge">
                    <i class="fa-solid fa-user"></i>
                    <%= user.getRole() %>
                </span>

            </div>

        </div>

    </div>

    <!-- Success Message -->

    <% if(success != null){ %>

    <div class="alert success mt-3">

        <i class="fa-solid fa-circle-check"></i>

        <%= success %>

    </div>

    <% } %>

    <!-- Error Message -->

    <% if(error != null){ %>

    <div class="alert error mt-3">

        <i class="fa-solid fa-circle-exclamation"></i>

        <%= error %>

    </div>

    <% } %>

    <!-- Forms -->

    <div class="profile-grid mt-4">

        <!-- Edit Profile -->

        <div class="profile-card">

            <h3>

                <i class="fa-solid fa-user-pen"></i>

                Edit Profile

            </h3>

            <form action="<%=request.getContextPath()%>/updateProfile"
                  method="post">

                <label>Username</label>

                <input
                    type="text"
                    name="username"
                    value="<%=user.getUsername()%>"
                    required>

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    value="<%=user.getEmail()%>"
                    required>

                <label>Address</label>

                <textarea
                    name="address"
                    rows="4"><%=user.getAddress()%></textarea>

                <button
                    type="submit"
                    class="profile-btn">

                    <i class="fa-solid fa-floppy-disk"></i>

                    Update Profile

                </button>

            </form>

        </div>

        <!-- Password -->

        <div class="profile-card">

            <h3>

                <i class="fa-solid fa-lock"></i>

                Change Password

            </h3>

            <form action="<%=request.getContextPath()%>/changePassword"
                  method="post">

                <label>Current Password</label>

                <input
                    type="password"
                    name="currentPassword"
                    required>

                <label>New Password</label>

                <input
                    type="password"
                    name="newPassword"
                    required>

                <label>Confirm Password</label>

                <input
                    type="password"
                    name="confirmPassword"
                    required>

                <button
                    type="submit"
                    class="profile-btn">

                    <i class="fa-solid fa-key"></i>

                    Change Password

                </button>

            </form>

        </div>

    </div>

    <!-- Statistics -->

    <div class="profile-stats">

        <div class="stat-card">

            <h2>
                <i class="fa-solid fa-bag-shopping"></i>
            </h2>

            <h3>Orders</h3>

            <p>Track your food orders</p>

        </div>

        <div class="stat-card">

            <h2>
                <i class="fa-solid fa-heart"></i>
            </h2>

            <h3>Favorites</h3>

            <p>Your favourite restaurants</p>

        </div>

        <div class="stat-card">

            <h2>
                <i class="fa-solid fa-location-dot"></i>
            </h2>

            <h3>Addresses</h3>

            <p>Manage delivery locations</p>

        </div>

        <div class="stat-card">

            <h2>
                <i class="fa-solid fa-star"></i>
            </h2>

            <h3>Rewards</h3>

            <p>Earn loyalty points</p>

        </div>

    </div>

</div>

</body>

</html>