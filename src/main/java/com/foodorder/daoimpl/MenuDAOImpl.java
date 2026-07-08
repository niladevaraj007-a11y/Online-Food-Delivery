package com.foodorder.daoimpl;

import com.foodorder.dao.MenuDAO;
import com.foodorder.model.MenuItem;
import com.foodorder.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImpl implements MenuDAO {
    private MenuItem map(ResultSet rs) throws SQLException {
        return new MenuItem(rs.getInt("menu_id"), rs.getInt("restaurant_id"), rs.getString("item_name"),
                rs.getString("description"), rs.getDouble("price"), rs.getString("image_url"), rs.getBoolean("is_available"));
    }
    public boolean add(MenuItem i) {
        String sql = "INSERT INTO menu(restaurant_id,item_name,description,price,image_url,is_available) VALUES(?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, i.getRestaurantId()); ps.setString(2, i.getItemName()); ps.setString(3, i.getDescription());
            ps.setDouble(4, i.getPrice()); ps.setString(5, i.getImageUrl()); ps.setBoolean(6, i.isAvailable());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    public MenuItem getById(int id) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM menu WHERE menu_id=?")) {
            ps.setInt(1, id); try (ResultSet rs = ps.executeQuery()) { return rs.next() ? map(rs) : null; }
        } catch (SQLException e) { e.printStackTrace(); return null; }
    }
    public List<MenuItem> getByRestaurant(int restaurantId) {
        List<MenuItem> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM menu WHERE restaurant_id=? AND is_available=TRUE")) {
            ps.setInt(1, restaurantId); try (ResultSet rs = ps.executeQuery()) { while (rs.next()) list.add(map(rs)); }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    public List<MenuItem> getAll() {
        List<MenuItem> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT * FROM menu")) {
            while (rs.next()) list.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    public boolean update(MenuItem i) {
        String sql = "UPDATE menu SET restaurant_id=?, item_name=?, description=?, price=?, image_url=?, is_available=? WHERE menu_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, i.getRestaurantId()); ps.setString(2, i.getItemName()); ps.setString(3, i.getDescription());
            ps.setDouble(4, i.getPrice()); ps.setString(5, i.getImageUrl()); ps.setBoolean(6, i.isAvailable()); ps.setInt(7, i.getMenuId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
    public boolean delete(int id) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM menu WHERE menu_id=?")) {
            ps.setInt(1, id); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}
