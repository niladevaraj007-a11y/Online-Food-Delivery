package com.foodorder.servlet;

import com.foodorder.model.Cart;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;

        Cart cart = getOrCreateCart(req.getSession());
        req.setAttribute("cartItems", cart.getItems());
        req.setAttribute("grandTotal", cart.getGrandTotal());
        req.getSession().setAttribute("cartCount", cart.getTotalItems());
        req.getRequestDispatcher("/jsp/cart.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;

        Cart cart = getOrCreateCart(req.getSession());
        int menuId = parseInt(req.getParameter("menuId"), 0);
        String action = req.getParameter("action");
        int quantity = parseInt(req.getParameter("quantity"), 1);

        if ("remove".equals(action)) {
            cart.removeItem(menuId);
        } else if ("increase".equals(action)) {
            cart.increaseQuantity(menuId);
        } else if ("decrease".equals(action)) {
            cart.decreaseQuantity(menuId);
        } else if ("update".equals(action)) {
            cart.updateQuantity(menuId, quantity);
        }

        req.getSession().setAttribute("cart", cart);
        req.getSession().setAttribute("cartCount", cart.getTotalItems());
        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private int parseInt(String value, int fallback) {
        try {
            return value == null ? fallback : Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
