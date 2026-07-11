package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.model.Order;
import com.foodorder.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

    private OrderDAO dao = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session==null || session.getAttribute("user")==null){
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }

        User user=(User)session.getAttribute("user");

        List<Order> orders=dao.getByUser(user.getUserId());

        req.setAttribute("orders",orders);

        req.getRequestDispatcher("/jsp/myOrders.jsp")
                .forward(req,resp);
    }
}