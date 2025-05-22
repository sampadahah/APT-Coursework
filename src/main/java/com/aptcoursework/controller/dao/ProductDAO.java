package com.aptcoursework.controller.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.Product;

public class ProductDAO {

    private Connection conn;

    public ProductDAO() throws ClassNotFoundException, SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    // Method to add a product
    public void addProduct(Product p) throws Exception {
        String sql = "INSERT INTO product (product_name, product_description, stock_quantity, price, imagepath) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getStockQuantity());
            ps.setDouble(4, p.getPrice());
            ps.setString(5, p.getImagePath());
            ps.executeUpdate();
        }
    }

    // Method to update a product
    public void updateProduct(Product p) throws Exception {
        String sql = "UPDATE product SET product_name=?, product_description=?, stock_quantity=?, price=?, imagepath=? WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getStockQuantity());
            ps.setDouble(4, p.getPrice());
            ps.setString(5, p.getImagePath());
            ps.setInt(6, p.getId());
            ps.executeUpdate();
        }
    }

    // Method to get a product by its ID
    public Product getProductById(int id) throws SQLException {
        Product p = null;
        String query = "SELECT * FROM product WHERE product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("product_description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagepath"));
            }
        }
        return p;
    }

    // Method to get all products
    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("product_description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagepath"));
                list.add(p);
            }
        }
        return list;
    }

    // Method to delete a product by ID
    public void deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM product WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // Method to get total number of products
    public int getTotalProducts() {
        int totalProducts = 0;
        String query = "SELECT COUNT(*) FROM product";
        if (conn != null) {
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    totalProducts = rs.getInt(1);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalProducts;
    }
    public List<Product> getRandomProducts(int limit) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY RAND() LIMIT ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("product_description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagepath"));
                list.add(p);
            }
        }
        return list;
    }

}
