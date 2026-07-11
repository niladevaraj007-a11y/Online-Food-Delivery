package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/editOrder")
public class EditOrderServlet extends HttpServlet {

    private OrderDAO dao = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("id"));

        Order order = null;

        for (Order o : dao.getAll()) {
            if (o.getOrderId() == orderId) {
                order = o;
                break;
            }
        }

        req.setAttribute("order", order);

        req.getRequestDispatcher("/jsp/editOrder.jsp")
                .forward(req, resp);
    }
}