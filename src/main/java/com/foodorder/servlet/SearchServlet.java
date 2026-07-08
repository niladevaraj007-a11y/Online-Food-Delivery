package com.foodorder.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;
import com.foodorder.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");

        try {

            Connection conn = DBConnection.getConnection();

            RestaurantDAO dao = new RestaurantDAOImpl();

            List<Restaurant> restaurants = dao.search(query);

            request.setAttribute("restaurants", restaurants);
            request.setAttribute("query", query);

            request.getRequestDispatcher("/jsp/search.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}