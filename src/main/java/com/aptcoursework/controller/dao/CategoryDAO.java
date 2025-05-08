package com.aptcoursework.controller.dao;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.AddCategory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private Connection conn;

    public CategoryDAO() throws ClassNotFoundException, SQLException {
        this.conn  = DatabaseConnection.getConnection(); 
    }

    public boolean addCategory(AddCategory category) throws SQLException {
        String sql = "INSERT INTO category (category_id, name, description, total_products) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, category.getCategoryId());
        stmt.setString(2, category.getCategoryName());
        stmt.setString(3, category.getDescription());
        stmt.setInt(4, category.getTotalProducts());
        return stmt.executeUpdate() > 0;
    }

    public List<AddCategory> getAllCategories() {
        List<AddCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                AddCategory category = new AddCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                category.setTotalProducts(rs.getInt("total_products"));
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
