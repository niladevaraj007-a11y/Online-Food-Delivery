package com.foodorder.dao;

import com.foodorder.model.User;
import java.util.List;

public interface UserDAO {

    // Register User
    boolean register(User user);

    // Login
    User login(String email, String password);

    // Get User by ID
    User getById(int userId);

    // Get All Users
    List<User> getAll();

    // Admin Update (updates all fields)
    boolean update(User user);

    // User Profile Update
    boolean updateProfile(User user);

    // Change Password
    boolean changePassword(int userId, String newPassword);

    // Delete User
    boolean delete(int userId);

    // Count Users
    int count();
}