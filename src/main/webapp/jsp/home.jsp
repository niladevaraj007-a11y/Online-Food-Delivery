<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Food Delivery Platform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/style.css">
</head>

<body class="hero-bg">

    <%@ include file="navbar.jspf" %>

    <main class="container hero">
<form class="search-box" action="<%=request.getContextPath()%>/search" method="GET">
    <input type="text" name="query" placeholder="🔍 Search for restaurant, cuisine or dish..." required>
    <button type="submit" class="btn">Search</button>
</form>
     <h1>Discover The Best Food & Drinks Near You</h1>

        <p>
            Order from your favorite restaurants with fast delivery,
            live order tracking, and amazing offers every day.
        </p>

       
        <div class="hero-actions">
            <a href="<%=request.getContextPath()%>/restaurants"
               class="btn">
                Order Now
            </a>

            <a href="#categories"
               class="btn ghost">
                Explore Food
            </a>
        </div>

        <div class="glass-grid">

            <div class="glass-card">
                <strong>500+</strong>
                Restaurants
            </div>

            <div class="glass-card">
                <strong>15K+</strong>
                Happy Customers
            </div>

            <div class="glass-card">
                <strong>30 Min</strong>
                Average Delivery
            </div>

        </div>

    </main>

   
     <section id="categories" class="section" style="background:white;">

        <div class="container">

            <h2 class="section-title">
                Popular Categories
            </h2>

            <p class="muted">
                Explore delicious cuisines and dishes loved by thousands.
            </p>

            <div class="categories">

                <div class="category">🍕 Pizza</div>
                <div class="category">🍔 Burger</div>
                <div class="category">🍗 Chicken</div>
                <div class="category">🍜 Noodles</div>
                <div class="category">🥗 Healthy</div>
                <div class="category">🍰 Desserts</div>
                <div class="category">☕ Coffee</div>
                <div class="category">🍛 South Indian</div>

            </div>

        </div>

    </section>

    <section class="section" style="background:white;">

        <div class="container">

            <h2 class="section-title">
                Why Choose Us?
            </h2>

            <div class="grid">

                <div class="card">
                    <div class="card-body">
                        <h3>🚀 Fast Delivery</h3>
                        <p class="muted">
                            Get your favorite meals delivered in under 30 minutes.
                        </p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h3>🍽️ Best Restaurants</h3>
                        <p class="muted">
                            Access hundreds of top-rated restaurants.
                        </p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h3>💳 Secure Payments</h3>
                        <p class="muted">
                            Safe and secure online transactions every time.
                        </p>
                    </div>
                </div>

            </div>

        </div>

    </section>

    <footer class="footer">

        <div class="container">

            <h3>Food Delivery Platform</h3>

            <p>
                Bringing your favorite food right to your doorstep.
            </p>

            <p>
                © 2026 Food Delivery Platform. All Rights Reserved.
            </p>

        </div>

    </footer>

</body>
</html>