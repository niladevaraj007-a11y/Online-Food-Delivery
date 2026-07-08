package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAOImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;
        req.setAttribute("orders", orderDAO.getByUser(user.getUserId()));
        req.getRequestDispatcher("/jsp/orders.jsp").forward(req, resp);
    }
}
