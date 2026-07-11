package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAOImpl();
    private RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        MenuItem item = menuDAO.getById(id);

        req.setAttribute("menuItem", item);
        req.setAttribute("restaurants", restaurantDAO.getAll());

        req.getRequestDispatcher("/jsp/editMenu.jsp")
                .forward(req, resp);
    }
}