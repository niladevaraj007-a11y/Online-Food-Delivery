package com.foodorder.servlet;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.daoimpl.RestaurantDAOImpl;
import com.foodorder.model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/restaurants")
public class AdminRestaurantServlet extends HttpServlet{

    RestaurantDAO dao=new RestaurantDAOImpl();

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException,IOException{

        List<Restaurant> list=dao.getAll();

        req.setAttribute("restaurants",list);

        req.getRequestDispatcher("/jsp/manageRestaurants.jsp")
                .forward(req,resp);

    }

}