package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/menu")
public class AdminMenuServlet extends HttpServlet {

    private MenuDAO dao = new MenuDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        List<MenuItem> menuItems = dao.getAll();

        req.setAttribute("menuItems", menuItems);

        req.getRequestDispatcher("/jsp/manageMenu.jsp")
           .forward(req, resp);
    }
}