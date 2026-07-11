package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

    private RestaurantDAO dao = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        dao.delete(id);

        resp.sendRedirect(req.getContextPath() + "/admin/restaurants");
    }
}