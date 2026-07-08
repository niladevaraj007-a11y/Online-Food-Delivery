<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.foodorder.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

<%@ include file="navbar.jspf" %>

<main class="container section">

    <!-- SEARCH FORM -->
    <form action="<%=request.getContextPath()%>/search" method="get" class="search-box">

        <input type="text"
               name="query"
               placeholder="Search restaurant, cuisine or dish...">

        <button type="submit" class="btn">Search</button>

    </form>

    <h2 class="section-title">Search Results</h2>

    <p class="muted">
        Results for:
        <b>
            <%= request.getAttribute("query") == null ? "" : request.getAttribute("query") %>
        </b>
    </p>

    <div class="grid">

        <%
            List<Restaurant> list =
                (List<Restaurant>) request.getAttribute("restaurants");

            if (list == null || list.isEmpty()) {
        %>

            <div class="card">
                <div class="card-body">
                    <h3>No restaurants found 😔</h3>
                    <p class="muted">
                        Try keywords like "pizza", "sushi", "burger"
                    </p>
                </div>
            </div>

        <%
            } else {
                for (Restaurant r : list) {
        %>

            <div class="card">

                <img class="food-img"
                     src="<%= r.getImageUrl() %>"
                     alt="<%= r.getName() %>">

                <div class="card-body">

                    <h2><%= r.getName() %></h2>

                    <p class="muted">
                        <%= r.getCuisineType() %>
                    </p>

                    <div class="meta">
                        <span>⏱ <%= r.getDeliveryTime() %></span>
                        <span class="rating">⭐ <%= r.getRating() %></span>
                    </div>

                    <a href="<%=request.getContextPath()%>/restaurant?id=<%= r.getRestaurantId() %>"
                       class="btn">
                        View Menu
                    </a>

                </div>
            </div>

        <%
                }
            }
        %>

    </div>

</main>



</body>
</html>