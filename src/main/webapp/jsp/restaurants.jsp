<%@ page import="java.util.*,com.foodorder.model.Restaurant" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Discover Restaurants</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/style.css">

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<style>

body{

background:#f8fafc;

font-family:'Poppins',sans-serif;

}

.restaurant-hero{
    position: relative;
    padding: 90px 0 70px;
    background:
        linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
        url("https://www.pixelstalk.net/wp-content/uploads/2016/08/Food-Wallpapers-HD-For-Desktop.jpg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden;
    color: #fff;
}

.restaurant-hero::before{

content:"";

position:absolute;

width:350px;
height:350px;

background:rgba(255,255,255,.12);

border-radius:50%;

top:-120px;
right:-80px;

}

.restaurant-hero::after{

content:"";

position:absolute;

width:220px;
height:220px;

background:rgba(255,255,255,.08);

border-radius:50%;

left:-80px;
bottom:-80px;

}

.hero-content{

position:relative;

z-index:2;

text-align:center;

}

.hero-content h1{

font-size:52px;

font-weight:800;

margin-bottom:15px;

}

.hero-content p{

font-size:18px;

opacity:.95;

margin-bottom:35px;

}

.search-wrapper{

max-width:720px;

margin:auto;

display:flex;

gap:15px;

background:#fff;

padding:12px;

border-radius:60px;

box-shadow:
0 20px 45px rgba(0,0,0,.18);

}

.search-wrapper input{

flex:1;

border:none;

outline:none;

font-size:16px;

padding:15px 20px;

}

.search-wrapper button{

border:none;

background:#ff6b35;

color:#fff;

padding:15px 35px;

border-radius:40px;

font-weight:600;

cursor:pointer;

transition:.3s;

}

.search-wrapper button:hover{

background:#ff4d00;

}

.filters{

    display:flex;
    gap:15px;
    justify-content:center;
    flex-wrap:wrap;
    margin-top:15px;

}

.filter-chip{

    display:inline-flex;
    align-items:center;
    justify-content:center;

    padding:12px 25px;

    background:#fff5f0;

    border-radius:30px;

    text-decoration:none;

    color:#333;

    font-weight:600;

    transition:all .3s ease;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.filter-chip:hover{

    background:#ff6b35;

    color:#fff;

    transform:translateY(-3px);

    box-shadow:0 10px 25px rgba(255,107,53,.3);

}
.restaurant-section{

padding:70px 0;

}

.section-heading{

display:flex;

justify-content:space-between;

align-items:center;

margin-bottom:40px;

flex-wrap:wrap;

gap:20px;

}

.section-heading h2{

font-size:34px;

font-weight:800;

color:#222;

}

.restaurant-count{

color:#777;

font-weight:500;

}

.restaurant-grid{

display:grid;

grid-template-columns:
repeat(auto-fit,minmax(300px,1fr));

gap:35px;

}

.restaurant-card{

background:#fff;

border-radius:24px;

overflow:hidden;

box-shadow:
0 12px 35px rgba(0,0,0,.08);

transition:.35s;

position:relative;

}

.restaurant-card:hover{

transform:translateY(-12px);

box-shadow:
0 25px 60px rgba(0,0,0,.15);

}

.restaurant-image{

position:relative;

overflow:hidden;

height:240px;

}

.restaurant-image img{

width:100%;
height:100%;

object-fit:cover;

transition:.5s;

}

.restaurant-card:hover img{

transform:scale(1.08);

}

.offer-badge{

position:absolute;

top:18px;
left:18px;

background:#ff6b35;

color:#fff;

padding:8px 16px;

border-radius:30px;

font-size:13px;

font-weight:700;

}

.rating-badge{

position:absolute;

top:18px;
right:18px;

background:#16a34a;

color:#fff;

padding:8px 14px;

border-radius:30px;

font-weight:700;

font-size:13px;

}

.restaurant-body{

padding:24px;

}

.restaurant-name{

font-size:24px;

font-weight:700;

margin-bottom:12px;

color:#222;

}

.restaurant-info{

display:flex;

justify-content:space-between;

margin-bottom:18px;

font-size:15px;

color:#666;

}

.delivery{

display:flex;

align-items:center;

gap:8px;

margin-bottom:22px;

font-weight:500;

}

.view-btn{

display:block;

text-align:center;

background:
linear-gradient(135deg,#ff6b35,#ff914d);

color:#fff;

padding:15px;

border-radius:14px;

text-decoration:none;

font-weight:700;

transition:.3s;

}

.view-btn:hover{

letter-spacing:1px;

}

</style>

</head>

<body>

<%@ include file="navbar.jspf" %>

<section class="restaurant-hero">

<div class="container hero-content">

<h1>Discover Amazing Restaurants</h1>



<div class="search-wrapper">

    <form action="<%=request.getContextPath()%>/search"
          method="GET"
          style="display:flex;width:100%;gap:15px;">

        <input
            type="text"
            name="query"
            placeholder="Search restaurants, cuisines or dishes..."
            required>

        <button type="submit">
            🔍 Search
        </button>

    </form>

</div>

</div>

</section>

<section class="filter-section">

<div class="container">



<div class="filters">

<div class="filters">

   <div class="filters">

    <a class="filter-chip"
       href="<%=request.getContextPath()%>/restaurants?category=All">
        🍽 All
    </a>

    <a class="filter-chip"
       href="<%=request.getContextPath()%>/restaurants?category=Veg">
        🥗 Veg
    </a>

    <a class="filter-chip"
       href="<%=request.getContextPath()%>/restaurants?category=NonVeg">
        🍗 Non-Veg
    </a>

    <a class="filter-chip"
       href="<%=request.getContextPath()%>/restaurants?category=Cafe">
        ☕ Cafe
    </a>

</div>

</div>
</div>

</section>

<section class="restaurant-section">

<div class="container">

<div class="section-heading">

<h2>Restaurants Near You</h2>

<div class="restaurant-count">

<%= restaurants==null?0:restaurants.size() %> Restaurants Available

</div>

</div>

<div class="restaurant-grid">
<%
if (restaurants != null && !restaurants.isEmpty()) {

    for (Restaurant r : restaurants) {
%>

<div class="restaurant-card">

    <div class="restaurant-image">

        <img src="<%=r.getImageUrl()%>"
             alt="<%=r.getName()%>">

        <div class="offer-badge">

            🔥 20% OFF

        </div>

        <div class="rating-badge">

            ⭐ <%=r.getRating()%>

        </div>

    </div>

    <div class="restaurant-body">

        <div class="restaurant-name">

            <%=r.getName()%>

        </div>

        <div class="restaurant-info">

            <span>

                🍽 <%=r.getCuisineType()%>

            </span>

        </div>

        <div class="delivery">

            🚚 Delivery in <%=r.getDeliveryTime()%>

        </div>

        <a class="view-btn"
           href="<%=request.getContextPath()%>/menu?restaurantId=<%=r.getRestaurantId()%>">

            🍽 View Menu →

        </a>

    </div>

</div>

<%
    }

} else {
%>

<div style="grid-column:1/-1;
            text-align:center;
            padding:80px 20px;
            background:#fff;
            border-radius:24px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);">

    <h2 style="font-size:34px;margin-bottom:15px;">
        🍽
    </h2>

    <h3>No Restaurants Available</h3>

    <p style="margin-top:10px;color:#777;">
        Please check back later.
    </p>

</div>

<%
}
%>

</div>

</div>

</section>

<section style="padding:80px 0;background:#fff7f3;">

    <div class="container">

        <div style="text-align:center;">

            <h2 style="font-size:38px;font-weight:800;margin-bottom:20px;">

                Why Choose Us?

            </h2>

            <p style="color:#666;font-size:18px;max-width:700px;margin:auto;">

                Experience lightning-fast delivery, premium restaurants,
                secure payments, and delicious food delivered right to your doorstep.

            </p>

        </div>

        <div style="display:grid;
                    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
                    gap:30px;
                    margin-top:60px;">

            <div style="background:#fff;
                        padding:35px;
                        border-radius:22px;
                        text-align:center;
                        box-shadow:0 10px 30px rgba(0,0,0,.08);">

                <h2>🚀</h2>

                <h3>Fast Delivery</h3>

                <p>Average delivery in under 30 minutes.</p>

            </div>

            <div style="background:#fff;
                        padding:35px;
                        border-radius:22px;
                        text-align:center;
                        box-shadow:0 10px 30px rgba(0,0,0,.08);">

                <h2>⭐</h2>

                <h3>Top Rated Restaurants</h3>

                <p>Only highly rated restaurants are listed.</p>

            </div>

            <div style="background:#fff;
                        padding:35px;
                        border-radius:22px;
                        text-align:center;
                        box-shadow:0 10px 30px rgba(0,0,0,.08);">

                <h2>🔒</h2>

                <h3>Secure Payments</h3>

                <p>100% safe and secure payment process.</p>

            </div>

        </div>

    </div>

</section>

<footer style="background:#111827;
               color:#fff;
               padding:50px 0;">

    <div class="container"
         style="display:flex;
                justify-content:space-between;
                align-items:center;
                flex-wrap:wrap;
                gap:20px;">

        <div>

            <h2 style="margin-bottom:10px;">

                🍔 Food Delivery Platform

            </h2>

            <p style="color:#cbd5e1;">

                Delicious food delivered with speed and care.

            </p>

        </div>

        <div style="text-align:right;">

            <p>

                © 2026 Food Delivery Platform

            </p>

            <p style="color:#cbd5e1;">

                All Rights Reserved

            </p>

        </div>

    </div>

</footer>

</body>

</html>