package com.aptcoursework.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.Category;

public class CategoryDAO {
    private Connection conn;
    private PreparedStatement ps;

    public CategoryDAO() throws ClassNotFoundException, SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    public boolean addCategory(Category category) {
        boolean added = false;
        String query = "INSERT INTO categories (name, total_products) VALUES (?, ?)";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, category.getName());
            ps.setInt(2, category.getTotalProducts());

            if (ps.executeUpdate() > 0) {
                added = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return added;
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM categories";

        try {
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setTotalProducts(rs.getInt("total_products"));

                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
