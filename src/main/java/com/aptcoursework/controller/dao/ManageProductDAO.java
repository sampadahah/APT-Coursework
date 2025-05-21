package com.aptcoursework.controller.dao;

import java.sql.*;
import java.util.*;
import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.Product;

public class ManageProductDAO {
    private Connection conn;

    public ManageProductDAO() throws ClassNotFoundException, SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("product_description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagepath"));
                productList.add(p);
            }
        }
        return productList;
    }

    public Product getProductById(int id) throws SQLException {
        Product product = null;
        String sql = "SELECT * FROM product WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("product_id"));
                    product.setName(rs.getString("product_name"));
                    product.setDescription(rs.getString("product_description"));
                    product.setStockQuantity(rs.getInt("stock_quantity"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImagePath(rs.getString("imagepath"));
                }
            }
        }
        return product;
    }

    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE product SET product_name=?, product_description=?, stock_quantity=?, price=?, image_path=? WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, product.getStockQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getImagePath());
            ps.setInt(6, product.getId());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
