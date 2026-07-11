package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/editRestaurant")
public class EditRestaurantServlet extends HttpServlet {

    RestaurantDAO dao = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Restaurant restaurant = dao.getById(id);

        req.setAttribute("restaurant", restaurant);

        req.getRequestDispatcher("/jsp/editRestaurant.jsp")
                .forward(req, resp);
    }
}