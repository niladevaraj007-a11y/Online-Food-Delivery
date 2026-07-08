package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAOImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        if (password == null || password.length() < 6) {
            req.setAttribute("error", "Password must be at least 6 characters.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
            return;
        }
        User user = new User(0, req.getParameter("username"), req.getParameter("email"), password, req.getParameter("address"), "CUSTOMER");
        if (userDAO.register(user)) resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
        else {
            req.setAttribute("error", "Email already exists or registration failed.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
        }
    }
}
