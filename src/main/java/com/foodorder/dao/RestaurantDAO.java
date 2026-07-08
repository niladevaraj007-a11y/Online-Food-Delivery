package com.foodorder.dao;

import com.foodorder.model.Restaurant;
import java.util.List;

public interface RestaurantDAO {

    boolean add(Restaurant r);

    Restaurant getById(int id);

    List<Restaurant> getAll();

    boolean update(Restaurant r);

    boolean delete(int id);

    int count();

    List<Restaurant> search(String keyword);
}