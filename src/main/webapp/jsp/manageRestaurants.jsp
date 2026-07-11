<%@ page import="java.util.*,com.foodorder.model.Restaurant" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Restaurants</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/style.css">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

    <div class="page-head">
        <h1 class="section-title">🍽️ Manage Restaurants</h1>

        <a href="<%=request.getContextPath()%>/jsp/addRestaurant.jsp"
   class="btn">
    + Add Restaurant
</a>
    </div>

    <table class="admin-table">

        <thead>

        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Cuisine</th>
            <th>Delivery</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>

        </thead>

        <tbody>

        <%

        List<Restaurant> restaurants =
                (List<Restaurant>)request.getAttribute("restaurants");

        if(restaurants!=null){

            for(Restaurant r:restaurants){

        %>

        <tr>

            <td>

                <img src="<%=r.getImageUrl()%>"
                     width="80"
                     height="60"
                     style="border-radius:10px">

            </td>

            <td><%=r.getName()%></td>

            <td><%=r.getCuisineType()%></td>

            <td><%=r.getDeliveryTime()%></td>

            <td>⭐ <%=r.getRating()%></td>

            <td>

             <a href="<%=request.getContextPath()%>/editRestaurant?id=<%=r.getRestaurantId()%>"
   class="btn">
    Edit
</a>
               <a href="<%=request.getContextPath()%>/deleteRestaurant?id=<%=r.getRestaurantId()%>"
   class="btn btn-danger"
   onclick="return confirm('Are you sure you want to delete this restaurant?');">
    Delete
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