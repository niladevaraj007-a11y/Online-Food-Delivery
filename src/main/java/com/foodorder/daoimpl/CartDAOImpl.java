package com.foodorder.daoimpl;

import com.foodorder.dao.CartDAO;
import com.foodorder.model.CartItem;
import com.foodorder.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {
    private CartItem map(ResultSet rs) throws SQLException {
        CartItem c = new CartItem();
        c.setCartId(rs.getInt("cart_id"));
        c.setUserId(rs.getInt("user_id"));
        c.setMenuId(rs.getInt("menu_id"));
        c.setQuantity(rs.getInt("quantity"));
        c.setItemName(rs.getString("item_name"));
        c.setPrice(rs.getDouble("price"));
        c.setImageUrl(rs.getString("image_url"));
        return c;
    }

    public boolean addItem(int userId, int menuId, int quantity) {
        String sql = "INSERT INTO cart(user_id, menu_id, quantity) VALUES(?,?,?) ON DUPLICATE KEY UPDATE quantity=quantity+VALUES(quantity)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId); ps.setInt(2, menuId); ps.setInt(3, quantity);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public List<CartItem> getByUser(int userId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT c.*, m.item_name, m.price, m.image_url FROM cart c JOIN menu m ON c.menu_id=m.menu_id WHERE c.user_id=? ORDER BY c.added_at DESC";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) { while (rs.next()) items.add(map(rs)); }
        } catch (SQLException e) { e.printStackTrace(); }
        return items;
    }

    public boolean updateQuantity(int cartId, int quantity) {
        if (quantity <= 0) return remove(cartId);
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("UPDATE cart SET quantity=? WHERE cart_id=?")) {
            ps.setInt(1, quantity); ps.setInt(2, cartId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean remove(int cartId) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE cart_id=?")) {
            ps.setInt(1, cartId); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean clear(int userId) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE user_id=?")) {
            ps.setInt(1, userId); return ps.executeUpdate() >= 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public int countItems(int userId) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT COALESCE(SUM(quantity),0) FROM cart WHERE user_id=?")) {
            ps.setInt(1, userId); try (ResultSet rs = ps.executeQuery()) { return rs.next() ? rs.getInt(1) : 0; }
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }

    public double grandTotal(int userId) {
        String sql = "SELECT COALESCE(SUM(c.quantity*m.price),0) FROM cart c JOIN menu m ON c.menu_id=m.menu_id WHERE c.user_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId); try (ResultSet rs = ps.executeQuery()) { return rs.next() ? rs.getDouble(1) : 0; }
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }
}
