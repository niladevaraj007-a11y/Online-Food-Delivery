package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.daoimpl.MenuDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

    private MenuDAO dao = new MenuDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(req.getParameter("id"));

        dao.delete(menuId);

        resp.sendRedirect(req.getContextPath() + "/admin/menu");
    }
}