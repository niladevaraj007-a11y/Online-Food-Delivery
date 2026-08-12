package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get selected category
        String category = req.getParameter("category");

        // Fetch all restaurants
        List<Restaurant> restaurants = restaurantDAO.getAll();

        // Filter restaurants
        if (category != null && !category.equalsIgnoreCase("All")) {

            List<Restaurant> filtered = new ArrayList<>();

            for (Restaurant r : restaurants) {

                String name = r.getName().toLowerCase();

                switch (category.toLowerCase()) {

                    case "veg":

                        if (name.equals("a2b") ||
                            name.equals("spice street")) {

                            filtered.add(r);
                        }
                        break;

                    case "nonveg":

                        if (name.equals("urban tandoor") ||
                            name.equals("asif briyani") ||
                            name.equals("sushi central")) {

                            filtered.add(r);
                        }
                        break;

                    case "cafe":

                        if (name.equals("pasta palace")) {

                            filtered.add(r);
                        }
                        break;

                    default:
                        filtered.add(r);
                        break;
                }
            }

            restaurants = filtered;
        }

        req.setAttribute("restaurants", restaurants);
        req.getRequestDispatcher("/jsp/restaurants.jsp").forward(req, resp);
    }
}