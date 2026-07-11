package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/addMenu")
public class AddMenuPageServlet extends HttpServlet {

    RestaurantDAO dao = new RestaurantDAOImpl();

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("restaurants", dao.getAll());

        req.getRequestDispatcher("/jsp/addMenu.jsp")
                .forward(req, resp);
    }
}