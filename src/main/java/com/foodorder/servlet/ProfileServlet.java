package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAOImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;
        req.setAttribute("profileUser", userDAO.getById(user.getUserId()));
        req.getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
    }
}
