package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

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

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Verify current password
        if (!user.getPassword().equals(currentPassword)) {
            response.sendRedirect(request.getContextPath()
                    + "/profile?error=Current password is incorrect");
            return;
        }

        // Check confirmation
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath()
                    + "/profile?error=Passwords do not match");
            return;
        }

        boolean success = userDAO.changePassword(user.getUserId(), newPassword);

        if (success) {

            // Update session object
            user.setPassword(newPassword);
            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath()
                    + "/profile?success=Password changed successfully");

        } else {

            response.sendRedirect(request.getContextPath()
                    + "/profile?error=Unable to change password");
        }
    }
}