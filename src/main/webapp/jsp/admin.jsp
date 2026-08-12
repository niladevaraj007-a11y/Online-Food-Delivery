<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>

<%@ include file="navbar.jspf" %>

<main class="container section">

    <!-- Header -->

    <header class="dashboard-header">

    <div>

        

        <h1>Admin Dashboard</h1>

        

    </div>

   

</header>

  

       

   

    <!-- Statistics -->
<br>
    <h2 class="section-title">Overview</h2>

    <div class="grid">

        <div class="admin-stat">
            <div class="stat-icon"></div>
            <h1><%=request.getAttribute("totalUsers")%></h1>
            <h3>Total Users</h3>
        </div>

        <div class="admin-stat">
            <div class="stat-icon"></div>
            <h1><%=request.getAttribute("totalRestaurants")%></h1>
            <h3>Restaurants</h3>
        </div>

        <div class="admin-stat">
            <div class="stat-icon"></div>
            <h1><%=request.getAttribute("totalOrders")%></h1>
            <h3>Total Orders</h3>
        </div>

        <div class="admin-stat">
            <div class="stat-icon"></div>
            <h1>₹<%=request.getAttribute("revenue")%></h1>
            <h3>Total Revenue</h3>
        </div>

    </div>

    <br>

  
    <!-- Quick Actions -->

    <h2 class="section-title">Quick Actions</h2>

    <div class="grid">

        <a href="<%=request.getContextPath()%>/admin/restaurants"
           class="dashboard-card">

            <h2>🍽 Manage Restaurants</h2>

            <p>Add, Edit and Delete Restaurants</p>

        </a>

        <a href="<%=request.getContextPath()%>/admin/menu"
           class="dashboard-card">

            <h2>🍔 Manage Menu</h2>

            <p>Manage Food Items & Prices</p>

        </a>

        <a href="<%=request.getContextPath()%>/admin/orders"
           class="dashboard-card">

            <h2>📦 Manage Orders</h2>

            <p>Update Customer Orders</p>

        </a>

        <a href="<%=request.getContextPath()%>/admin/users"
           class="dashboard-card">

            <h2>👥 Manage Users</h2>

            <p>Manage Registered Users</p>

        </a>

    </div>

</main>

<script>

new Chart(document.getElementById("revenueChart"),{

type:'bar',

data:{

labels:["Jan","Feb","Mar","Apr","May","Jun"],

datasets:[{

label:"Revenue",

data:[1200,1800,1400,2500,3000,4200],

backgroundColor:[
"#ff6b35",
"#ff914d",
"#ffb84d",
"#22c55e",
"#3b82f6",
"#8b5cf6"
],

borderRadius:10

}]

},

options:{

responsive:true,

plugins:{

legend:{

display:false

}

}

}

});

</script>

</body>

</html>