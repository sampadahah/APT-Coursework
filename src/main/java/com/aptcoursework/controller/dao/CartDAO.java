package com.aptcoursework.controller.dao;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    // Add to cart or update quantity
    public boolean addToCart(int userId, int productId, int quantity) throws SQLException, ClassNotFoundException {
        try (Connection conn = DatabaseConnection.getConnection()) {
            // Step 1: Check if cart exists
            int cartId = getOrCreateCartId(userId, conn);

            // Step 2: Check if product already exists in cart
            String checkSql = "SELECT quantity_in_cart FROM cart_item WHERE cart_id = ? AND product_id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, cartId);
            checkStmt.setInt(2, productId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Update existing quantity
                int existingQty = rs.getInt("quantity_in_cart");
                String updateSql = "UPDATE cart_item SET quantity_in_cart = ? WHERE cart_id = ? AND product_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, existingQty + quantity);
                updateStmt.setInt(2, cartId);
                updateStmt.setInt(3, productId);
                return updateStmt.executeUpdate() > 0;
            } else {
                // Insert new item
                String insertSql = "INSERT INTO cart_item (cart_id, product_id, quantity_in_cart) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setInt(1, cartId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, quantity);
                return insertStmt.executeUpdate() > 0;
            }
        }
    }

    // Get all cart items
    public List<CartItem> getCartItems(int userId) throws SQLException, ClassNotFoundException {
        List<CartItem> cartItems = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            int cartId = getCartId(userId, conn);
            if (cartId == -1) return cartItems;

            String sql = "SELECT p.product_id, p.name, p.description, p.price, ci.quantity_in_cart " +
                         "FROM cart_item ci JOIN product p ON ci.product_id = p.product_id " +
                         "WHERE ci.cart_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("name"));
                item.setProductDescription(rs.getString("description"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity_in_cart"));
                cartItems.add(item);
            }
        }

        return cartItems;
    }

    // Utility method: Get or create cart ID
    private int getOrCreateCartId(int userId, Connection conn) throws SQLException {
        int cartId = getCartId(userId, conn);
        if (cartId != -1) return cartId;

        String insertSql = "INSERT INTO cart (user_id) VALUES (?)";
        PreparedStatement insertStmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
        insertStmt.setInt(1, userId);
        insertStmt.executeUpdate();
        ResultSet rs = insertStmt.getGeneratedKeys();
        if (rs.next()) {
            return rs.getInt(1);
        }
        throw new SQLException("Failed to create cart");
    }

    // Utility method: Get existing cart ID
    private int getCartId(int userId, Connection conn) throws SQLException {
        String sql = "SELECT cart_id FROM cart WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("cart_id");
        }
        return -1;
    }
}
