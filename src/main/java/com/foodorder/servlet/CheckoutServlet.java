package com.foodorder.servlet;

import com.foodorder.dao.OrderDAO;
import com.foodorder.daoimpl.OrderDAOImpl;
import com.foodorder.model.Cart;
import com.foodorder.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;

        Cart cart = getOrCreateCart(req.getSession());

        req.setAttribute("grandTotal", cart.getGrandTotal());

        req.getRequestDispatcher("/jsp/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        User user = AuthUtil.requireUser(req, resp);
        if (user == null) return;

        HttpSession session = req.getSession();
        Cart cart = getOrCreateCart(session);

        int orderId = orderDAO.createOrder(
                user.getUserId(),
                req.getParameter("paymentMethod"),
                req.getParameter("address"),
                cart
        );

        if (orderId > 0) {

            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);

            resp.sendRedirect(
                    req.getContextPath()
                            + "/jsp/order-success.jsp?orderId="
                            + orderId
            );

        } else {

            resp.sendRedirect(req.getContextPath() + "/cart");

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