package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    UserDAO dao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("users", dao.getAll());

        req.getRequestDispatcher("/jsp/manageUsers.jsp")
                .forward(req, resp);
    }
}