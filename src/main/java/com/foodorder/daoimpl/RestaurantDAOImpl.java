package com.foodorder.daoimpl;

import com.foodorder.dao.RestaurantDAO;
import com.foodorder.model.Restaurant;
import com.foodorder.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAOImpl implements RestaurantDAO {
    private Restaurant map(ResultSet rs) throws SQLException {
        return new Restaurant(rs.getInt("restaurant_id"), rs.getString("name"), rs.getString("cuisine_type"),
                rs.getString("delivery_time"), rs.getDouble("rating"), rs.getString("image_url"));
    }

    public boolean add(Restaurant r) {
        String sql = "INSERT INTO restaurants(name,cuisine_type,delivery_time,rating,image_url) VALUES(?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName()); ps.setString(2, r.getCuisineType()); ps.setString(3, r.getDeliveryTime());
            ps.setDouble(4, r.getRating()); ps.setString(5, r.getImageUrl());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public Restaurant getById(int id) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM restaurants WHERE restaurant_id=?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) { return rs.next() ? map(rs) : null; }
        } catch (SQLException e) { e.printStackTrace(); return null; }
    }

    public List<Restaurant> getAll() {
        List<Restaurant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT * FROM restaurants ORDER BY rating DESC")) {
            while (rs.next()) list.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean update(Restaurant r) {
        String sql = "UPDATE restaurants SET name=?, cuisine_type=?, delivery_time=?, rating=?, image_url=? WHERE restaurant_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getName()); ps.setString(2, r.getCuisineType()); ps.setString(3, r.getDeliveryTime());
            ps.setDouble(4, r.getRating()); ps.setString(5, r.getImageUrl()); ps.setInt(6, r.getRestaurantId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean delete(int id) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM restaurants WHERE restaurant_id=?")) {
            ps.setInt(1, id); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public int count() {
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM restaurants")) {
            return rs.next() ? rs.getInt(1) : 0;
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }
    public List<Restaurant> search(String keyword) {

        List<Restaurant> list = new ArrayList<>();

        String sql = "SELECT * FROM restaurants " +
                     "WHERE name LIKE ? OR cuisine_type LIKE ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String q = "%" + keyword + "%";

            ps.setString(1, q);
            ps.setString(2, q);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(map(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
