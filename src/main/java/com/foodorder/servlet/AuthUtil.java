package com.foodorder.servlet;

import com.foodorder.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

class AuthUtil {
    static User requireUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) resp.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
        return user;
    }
}
