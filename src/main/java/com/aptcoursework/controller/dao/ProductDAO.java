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

    public void addProduct(Product p) throws Exception {
        String sql = "INSERT INTO products (name, category, title1, title2, title3, text1, text2, text3, price, quantity, imagePath) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getCategory());
            ps.setString(3, p.getTitle1());
            ps.setString(4, p.getTitle2());
            ps.setString(5, p.getTitle3());
            ps.setString(6, p.getText1());
            ps.setString(7, p.getText2());
            ps.setString(8, p.getText3());
            ps.setDouble(9, p.getPrice());
            ps.setInt(10, p.getQuantity());
            ps.setString(11, p.getImagePath());
            ps.executeUpdate();
        }
    }

    public void updateProduct(Product p) throws Exception {
        String sql = "UPDATE products SET name=?, category=?, title1=?, title2=?, title3=?, text1=?, text2=?, text3=?, price=?, quantity=?, imagePath=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getCategory());
            ps.setString(3, p.getTitle1());
            ps.setString(4, p.getTitle2());
            ps.setString(5, p.getTitle3());
            ps.setString(6, p.getText1());
            ps.setString(7, p.getText2());
            ps.setString(8, p.getText3());
            ps.setDouble(9, p.getPrice());
            ps.setInt(10, p.getQuantity());
            ps.setString(11, p.getImagePath());
            ps.setInt(12, p.getId());
            ps.executeUpdate();
        }
    }

    public Product getProductById(int id) throws Exception {
        String sql = "SELECT * FROM products WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setTitle1(rs.getString("title1"));
                p.setTitle2(rs.getString("title2"));
                p.setTitle3(rs.getString("title3"));
                p.setText1(rs.getString("text1"));
                p.setText2(rs.getString("text2"));
                p.setText3(rs.getString("text3"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImagePath(rs.getString("imagePath"));
                return p;
            }
        }
        return null;
    }

    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setTitle1(rs.getString("title1"));
                p.setTitle2(rs.getString("title2"));
                p.setTitle3(rs.getString("title3"));
                p.setText1(rs.getString("text1"));
                p.setText2(rs.getString("text2"));
                p.setText3(rs.getString("text3"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImagePath(rs.getString("imagePath"));
                list.add(p);
            }
        }
        return list;
    }

    public void deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM products WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
