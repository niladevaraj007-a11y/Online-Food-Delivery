package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.dao.RestaurantDAO;
import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAOImpl();
    private final RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
    private final OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            System.out.println("===== AdminServlet Executed =====");

            User user = AuthUtil.requireUser(req, resp);
            System.out.println("User = " + user);

            if (user == null) {
                return;
            }

            System.out.println("Role = " + user.getRole());

            int users = userDAO.count();
            int restaurants = restaurantDAO.count();
            int orders = orderDAO.count();
            double revenue = orderDAO.revenue();

            System.out.println("Users = " + users);
            System.out.println("Restaurants = " + restaurants);
            System.out.println("Orders = " + orders);
            System.out.println("Revenue = " + revenue);

            req.setAttribute("totalUsers", users);
            req.setAttribute("totalRestaurants", restaurants);
            req.setAttribute("totalOrders", orders);
            req.setAttribute("revenue", String.format("%.2f", revenue));

            req.getRequestDispatcher("/jsp/admin.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}