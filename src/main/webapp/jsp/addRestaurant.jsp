<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Restaurant</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/style.css">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
</head>

<body>

<%@ include file="navbar.jspf" %>

<div class="container section">

    <div class="form-container">

        <h1 class="section-title">🍽️ Add Restaurant</h1>

        <form action="<%=request.getContextPath()%>/addRestaurant"
              method="post">

            <div class="form-group">
                <label>Restaurant Name</label>
                <input type="text"
                       name="name"
                       required>
            </div>

            <div class="form-group">
                <label>Cuisine Type</label>
                <input type="text"
                       name="cuisineType"
                       required>
            </div>

            <div class="form-group">
                <label>Delivery Time</label>
                <input type="text"
                       name="deliveryTime"
                       placeholder="30-40 min"
                       required>
            </div>

            <div class="form-group">
                <label>Rating</label>
                <input type="number"
                       name="rating"
                       min="0"
                       max="5"
                       step="0.1"
                       required>
            </div>

            <div class="form-group">
                <label>Image URL</label>
                <input type="text"
                       name="imageUrl"
                       placeholder="images/pizza.jpg"
                       required>
            </div>

            <button type="submit" class="btn">
                Save Restaurant
            </button>

        </form>

    </div>

</div>

</body>
</html>