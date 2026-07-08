package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setAddress(request.getParameter("address"));

        boolean success = userDAO.updateProfile(user);

        if (success) {

            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath()
                    + "/profile?success=Profile Updated");

        } else {

            response.sendRedirect(request.getContextPath()
                    + "/profile?error=Update Failed");
        }

    }
}