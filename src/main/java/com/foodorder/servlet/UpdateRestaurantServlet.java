package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {

    RestaurantDAO dao = new RestaurantDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        Restaurant r = new Restaurant();

        r.setRestaurantId(
                Integer.parseInt(req.getParameter("restaurantId")));

        r.setName(req.getParameter("name"));
        r.setCuisineType(req.getParameter("cuisineType"));
        r.setDeliveryTime(req.getParameter("deliveryTime"));
        r.setRating(Double.parseDouble(req.getParameter("rating")));
        r.setImageUrl(req.getParameter("imageUrl"));

        dao.update(r);

        resp.sendRedirect(req.getContextPath()
                + "/admin/restaurants");

    }

}