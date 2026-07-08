package com.foodorder.dao;

import com.foodorder.model.CartItem;
import java.util.List;

public interface CartDAO {
    boolean addItem(int userId, int menuId, int quantity);
    List<CartItem> getByUser(int userId);
    boolean updateQuantity(int cartId, int quantity);
    boolean remove(int cartId);
    boolean clear(int userId);
    int countItems(int userId);
    double grandTotal(int userId);
}
