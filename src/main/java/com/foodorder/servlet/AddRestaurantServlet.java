package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

    RestaurantDAO dao = new RestaurantDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        Restaurant restaurant = new Restaurant();

        restaurant.setName(req.getParameter("name"));
        restaurant.setCuisineType(req.getParameter("cuisineType"));
        restaurant.setDeliveryTime(req.getParameter("deliveryTime"));
        restaurant.setRating(Double.parseDouble(req.getParameter("rating")));
        restaurant.setImageUrl(req.getParameter("imageUrl"));

        dao.add(restaurant);

        resp.sendRedirect(req.getContextPath() + "/admin/restaurants");
    }
}