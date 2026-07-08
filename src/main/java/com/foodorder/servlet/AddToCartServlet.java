package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.model.Cart;
import com.foodorder.model.MenuItem;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private final MenuDAO menuDAO = new MenuDAOImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean ajax = req.getHeader("Accept") != null && req.getHeader("Accept").contains("application/json");
        HttpSession session = req.getSession();
        int menuId = parseInt(req.getParameter("menuId"), 0);
        int quantity = Math.max(1, parseInt(req.getParameter("quantity"), 1));
        MenuItem menuItem = menuDAO.getById(menuId);
        Cart cart = getOrCreateCart(session);
        boolean success = menuItem != null;
        if (success) {
            cart.addItem(menuItem, quantity);
        }
        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.getTotalItems());
        if (ajax) {
            resp.setContentType("application/json");
            resp.getWriter().write("{\"success\":" + success + ",\"count\":" + cart.getTotalItems() + ",\"grandTotal\":" + cart.getGrandTotal() + "}");
        } else {
            String returnUrl = req.getParameter("returnUrl");
            resp.sendRedirect(returnUrl != null && !returnUrl.trim().isEmpty() ? returnUrl : req.getContextPath() + "/cart");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    private int parseInt(String value, int fallback) {
        try {
            return value == null ? fallback : Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return fallback;
        }
    }

    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
}

