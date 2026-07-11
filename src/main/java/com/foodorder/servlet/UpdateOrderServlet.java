package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {

    private OrderDAO dao = new OrderDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));

        String status = req.getParameter("status");

        dao.updateStatus(orderId, status);

        resp.sendRedirect(req.getContextPath() + "/admin/orders");
    }
}