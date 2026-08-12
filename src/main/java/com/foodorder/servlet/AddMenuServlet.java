package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.MenuItem;
import com.foodorder.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

    MenuDAO menuDAO = new MenuDAOImpl();
    RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        List<Restaurant> restaurants = restaurantDAO.getAll();

        req.setAttribute("restaurants", restaurants);

        req.getRequestDispatcher("/jsp/addMenu.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        MenuItem item = new MenuItem();

        item.setRestaurantId(
                Integer.parseInt(req.getParameter("restaurantId")));

        item.setItemName(req.getParameter("itemName"));
        item.setDescription(req.getParameter("description"));
        item.setPrice(
                Double.parseDouble(req.getParameter("price")));
        item.setImageUrl(req.getParameter("imageUrl"));

        item.setAvailable(req.getParameter("available") != null);

        menuDAO.add(item);

        resp.sendRedirect(req.getContextPath() + "/admin/menu");
    }
}