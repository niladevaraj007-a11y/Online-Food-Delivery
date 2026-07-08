package com.foodorder.dao;

import com.foodorder.model.Order;
import com.foodorder.model.Cart;
import java.util.List;

public interface OrderDAO {
    int createOrder(int userId, String paymentMethod, String address);
    int createOrder(int userId, String paymentMethod, String address, Cart cart);
    List<Order> getByUser(int userId);
    List<Order> getAll();
    boolean updateStatus(int orderId, String status);
    boolean delete(int orderId);
    int count();
    double revenue();
}
