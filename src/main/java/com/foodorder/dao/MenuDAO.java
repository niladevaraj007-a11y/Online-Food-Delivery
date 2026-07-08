package com.foodorder.dao;

import com.foodorder.model.MenuItem;
import java.util.List;

public interface MenuDAO {
    boolean add(MenuItem item);
    MenuItem getById(int menuId);
    List<MenuItem> getByRestaurant(int restaurantId);
    List<MenuItem> getAll();
    boolean update(MenuItem item);
    boolean delete(int menuId);
}
