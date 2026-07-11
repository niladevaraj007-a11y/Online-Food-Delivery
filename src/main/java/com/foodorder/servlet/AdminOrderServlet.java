package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO dao = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("orders", dao.getAll());

        req.getRequestDispatcher("/jsp/manageOrders.jsp")
                .forward(req, resp);
    }
}