package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {
    private final RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("restaurants", restaurantDAO.getAll());
        req.getRequestDispatcher("/jsp/restaurants.jsp").forward(req, resp);
    }
}
