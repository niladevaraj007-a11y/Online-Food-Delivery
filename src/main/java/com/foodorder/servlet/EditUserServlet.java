package com.foodorder.servlet;

import com.foodorder.dao.UserDAO;
import com.foodorder.daoimpl.UserDAOImpl;
import com.foodorder.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/editUser")
public class EditUserServlet extends HttpServlet {

    private UserDAO dao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        User user = dao.getById(id);

        req.setAttribute("user", user);

        req.getRequestDispatcher("/jsp/editUser.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        User user = new User();

        user.setUserId(Integer.parseInt(req.getParameter("userId")));
        user.setUsername(req.getParameter("username"));
        user.setEmail(req.getParameter("email"));
        user.setAddress(req.getParameter("address"));
        user.setRole(req.getParameter("role"));

        dao.update(user);

        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}