package com.foodorder.servlet;

import com.foodorder.dao.MenuDAO;
import com.foodorder.daoimpl.MenuDAOImpl;
import com.foodorder.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

    private MenuDAO dao = new MenuDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        MenuItem item = new MenuItem();

        item.setMenuId(Integer.parseInt(req.getParameter("menuId")));
        item.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));
        item.setItemName(req.getParameter("itemName"));
        item.setDescription(req.getParameter("description"));
        item.setPrice(Double.parseDouble(req.getParameter("price")));
        item.setImageUrl(req.getParameter("imageUrl"));
        item.setAvailable(req.getParameter("available") != null);

        dao.update(item);

        resp.sendRedirect(req.getContextPath() + "/admin/menu");
    }
}