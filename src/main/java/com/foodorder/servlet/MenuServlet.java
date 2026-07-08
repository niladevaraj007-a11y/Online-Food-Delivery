package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private final MenuDAO menuDAO = new MenuDAOImpl();
    private final RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        req.setAttribute("restaurant", restaurantDAO.getById(restaurantId));
        req.setAttribute("menuItems", menuDAO.getByRestaurant(restaurantId));
        req.getRequestDispatcher("/jsp/menu.jsp").forward(req, resp);
    }
}
