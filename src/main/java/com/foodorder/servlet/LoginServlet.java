package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.Cart;
import com.foodorder.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userDAO.login(email, password);

        if (user != null) {

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("cart", new Cart());

            // Redirect based on role
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/admin");
            } else {
            	resp.sendRedirect(req.getContextPath() + "/jsp/home.jsp");
            }

        } else {
            req.setAttribute("error", "Invalid Email or Password");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
    }
}