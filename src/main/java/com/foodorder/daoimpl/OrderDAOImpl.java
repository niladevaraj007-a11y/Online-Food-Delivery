package com.foodorder.daoimpl;

import com.foodorder.dao.OrderDAO;
import com.foodorder.model.Cart;
import com.foodorder.model.CartItem;
import com.foodorder.model.Order;
import com.foodorder.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    private Order map(ResultSet rs) throws SQLException {
        Order o = new Order();
        o.setOrderId(rs.getInt("order_id"));
        o.setUserId(rs.getInt("user_id"));
        o.setTotalAmount(rs.getDouble("total_amount"));
        o.setPaymentMethod(rs.getString("payment_method"));
        o.setStatus(rs.getString("status"));
        o.setDeliveryAddress(rs.getString("delivery_address"));
        o.setOrderDate(rs.getTimestamp("order_date"));
        return o;
    }

    public int createOrder(int userId, String paymentMethod, String address) {
        String totalSql = "SELECT COALESCE(SUM(c.quantity*m.price),0) FROM cart c JOIN menu m ON c.menu_id=m.menu_id WHERE c.user_id=?";
        String orderSql = "INSERT INTO orders(user_id,total_amount,payment_method,delivery_address) VALUES(?,?,?,?)";
        String itemSql = "INSERT INTO order_items(order_id,menu_id,quantity,price) SELECT ?, c.menu_id, c.quantity, m.price FROM cart c JOIN menu m ON c.menu_id=m.menu_id WHERE c.user_id=?";
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            double total;
            try (PreparedStatement ps = con.prepareStatement(totalSql)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) { rs.next(); total = rs.getDouble(1); }
            }
            if (total <= 0) { con.rollback(); return 0; }
            int orderId;
            try (PreparedStatement ps = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, userId); ps.setDouble(2, total); ps.setString(3, paymentMethod); ps.setString(4, address);
                ps.executeUpdate();
                try (ResultSet keys = ps.getGeneratedKeys()) { keys.next(); orderId = keys.getInt(1); }
            }
            try (PreparedStatement ps = con.prepareStatement(itemSql)) {
                ps.setInt(1, orderId); ps.setInt(2, userId); ps.executeUpdate();
            }
            try (PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE user_id=?")) {
                ps.setInt(1, userId); ps.executeUpdate();
            }
            con.commit();
            return orderId;
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }

    public int createOrder(int userId, String paymentMethod, String address, Cart cart) {
        if (cart == null || cart.isEmpty()) {
            return 0;
        }

        String orderSql = "INSERT INTO orders(user_id,total_amount,payment_method,delivery_address) VALUES(?,?,?,?)";
        String itemSql = "INSERT INTO order_items(order_id,menu_id,quantity,price) VALUES(?,?,?,?)";
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            int orderId;
            try (PreparedStatement ps = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, userId);
                ps.setDouble(2, cart.getGrandTotal());
                ps.setString(3, paymentMethod);
                ps.setString(4, address);
                ps.executeUpdate();
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    keys.next();
                    orderId = keys.getInt(1);
                }
            }

            try (PreparedStatement ps = con.prepareStatement(itemSql)) {
                for (CartItem item : cart.getItems()) {
                    ps.setInt(1, orderId);
                    ps.setInt(2, item.getMenuId());
                    ps.setInt(3, item.getQuantity());
                    ps.setDouble(4, item.getPrice());
                    ps.addBatch();
                }
                ps.executeBatch();
            }

            con.commit();
            return orderId;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Order> getByUser(int userId) {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC")) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) { while (rs.next()) list.add(map(rs)); }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT * FROM orders ORDER BY order_date DESC")) {
            while (rs.next()) list.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean updateStatus(int orderId, String status) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("UPDATE orders SET status=? WHERE order_id=?")) {
            ps.setString(1, status); ps.setInt(2, orderId); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean delete(int orderId) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM orders WHERE order_id=?")) {
            ps.setInt(1, orderId); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public int count() {
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM orders")) {
            return rs.next() ? rs.getInt(1) : 0;
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }

    public double revenue() {
        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery("SELECT COALESCE(SUM(total_amount),0) FROM orders")) {
            return rs.next() ? rs.getDouble(1) : 0;
        } catch (SQLException e) { e.printStackTrace(); return 0; }
    }
    @Override
    public Order getById(int orderId) {

        String sql = "SELECT * FROM orders WHERE order_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return map(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    @Override
    public int getOrderCountByStatus(String status) {

        int count = 0;

        String sql = "SELECT COUNT(*) FROM orders WHERE status = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    count = rs.getInt(1);
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
}
