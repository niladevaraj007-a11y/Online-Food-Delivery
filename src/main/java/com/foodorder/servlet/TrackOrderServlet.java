package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/trackOrder")
public class TrackOrderServlet extends HttpServlet {

    private OrderDAO dao = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("id"));

        Order order = dao.getById(orderId);

        req.setAttribute("order", order);

        req.getRequestDispatcher("/jsp/trackOrder.jsp")
           .forward(req, resp);
    }
}