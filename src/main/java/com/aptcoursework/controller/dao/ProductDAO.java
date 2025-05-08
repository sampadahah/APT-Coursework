/*akritiproductDAOCode
 * package com.aptcoursework.controller.dao;
 * 
 * import java.sql.*; import java.util.ArrayList; import java.util.List;
 * 
 * import com.aptcoursework.controller.database.DatabaseConnection; import
 * com.aptcoursework.model.Product;
 * 
 * public class ProductDAO {
 * 
 * private Connection conn;
 * 
 * public ProductDAO() throws ClassNotFoundException, SQLException { this.conn =
 * DatabaseConnection.getConnection(); }
 * 
 * public void addProduct(Product p) throws Exception { String sql =
 * "INSERT INTO product (name, category, title1, title2, title3, text1, text2, text3, price, quantity, imagePath) "
 * + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; try (PreparedStatement ps =
 * conn.prepareStatement(sql)) { ps.setString(1, p.getName()); ps.setString(2,
 * p.getCategory()); ps.setString(3, p.getTitle1()); ps.setString(4,
 * p.getTitle2()); ps.setString(5, p.getTitle3()); ps.setString(6,
 * p.getText1()); ps.setString(7, p.getText2()); ps.setString(8, p.getText3());
 * ps.setDouble(9, p.getPrice()); ps.setInt(10, p.getQuantity());
 * ps.setString(11, p.getImagePath()); ps.executeUpdate(); } }
 * 
 * public void updateProduct(Product p) throws Exception { String sql =
 * "UPDATE product SET name=?, category=?, title1=?, title2=?, title3=?, text1=?, text2=?, text3=?, price=?, quantity=?, imagePath=? WHERE id=?"
 * ; try (PreparedStatement ps = conn.prepareStatement(sql)) { ps.setString(1,
 * p.getName()); ps.setString(2, p.getCategory()); ps.setString(3,
 * p.getTitle1()); ps.setString(4, p.getTitle2()); ps.setString(5,
 * p.getTitle3()); ps.setString(6, p.getText1()); ps.setString(7, p.getText2());
 * ps.setString(8, p.getText3()); ps.setDouble(9, p.getPrice()); ps.setInt(10,
 * p.getQuantity()); ps.setString(11, p.getImagePath()); ps.setInt(12,
 * p.getId()); ps.executeUpdate(); } }
 * 
 * public Product getProductById(int id) throws Exception { String sql =
 * "SELECT * FROM product WHERE id=?"; try (PreparedStatement ps =
 * conn.prepareStatement(sql)) { ps.setInt(1, id); ResultSet rs =
 * ps.executeQuery(); if (rs.next()) { Product p = new Product();
 * p.setId(rs.getInt("product_id")); p.setName(rs.getString("name"));
 * p.setCategory(rs.getString("category")); p.setTitle1(rs.getString("title1"));
 * p.setTitle2(rs.getString("title2")); p.setTitle3(rs.getString("title3"));
 * p.setText1(rs.getString("text1")); p.setText2(rs.getString("text2"));
 * p.setText3(rs.getString("text3")); p.setPrice(rs.getDouble("price"));
 * p.setQuantity(rs.getInt("quantity"));
 * p.setImagePath(rs.getString("imagePath")); return p; } } return null; }
 * 
 * public List<Product> getAllProducts() throws Exception { List<Product> list =
 * new ArrayList<>(); String sql = "SELECT * FROM product"; try
 * (PreparedStatement ps = conn.prepareStatement(sql)) { ResultSet rs =
 * ps.executeQuery(); while (rs.next()) { Product p = new Product();
 * p.setId(rs.getInt("id")); p.setName(rs.getString("name"));
 * p.setCategory(rs.getString("category")); p.setTitle1(rs.getString("title1"));
 * p.setTitle2(rs.getString("title2")); p.setTitle3(rs.getString("title3"));
 * p.setText1(rs.getString("text1")); p.setText2(rs.getString("text2"));
 * p.setText3(rs.getString("text3")); p.setPrice(rs.getDouble("price"));
 * p.setQuantity(rs.getInt("quantity"));
 * p.setImagePath(rs.getString("imagePath")); list.add(p); } } return list; }
 * 
 * public void deleteProduct(int id) throws Exception { String sql =
 * "DELETE FROM product WHERE id=?"; try (PreparedStatement ps =
 * conn.prepareStatement(sql)) { ps.setInt(1, id); ps.executeUpdate(); } }
 * 
 * // Method to get total number of products public int getTotalProducts() { int
 * totalProducts = 0; String query = "SELECT COUNT(*) FROM product"; if (conn !=
 * null) { try { PreparedStatement ps = conn.prepareStatement(query); ResultSet
 * rs = ps.executeQuery(); if (rs.next()) { totalProducts = rs.getInt(1); // Get
 * count from the result set } } catch (SQLException e) { e.printStackTrace(); }
 * } return totalProducts; }
 * 
 * 
 * 
 * 
 * 
 * }
 */

/*searchpageDAO*/
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
        String sql = "INSERT INTO product (product_name, product_description, stock_quantity, price) " +
                     "VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getProductDescription());
            ps.setInt(3, p.getStockQuantity());
            ps.setDouble(4, p.getPrice());
            ps.executeUpdate();
        }
    }

    public void updateProduct(Product p) throws Exception {
        String sql = "UPDATE product SET product_name=?, product_description=?, stock_quantity=?, price=? WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getProductDescription());
            ps.setInt(3, p.getStockQuantity());
            ps.setDouble(4, p.getPrice());
            ps.setInt(5, p.getProductId());
            ps.executeUpdate();
        }
    }

    public Product getProductById(int id) throws Exception {
        String sql = "SELECT * FROM product WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setProductDescription(rs.getString("product_description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setPrice(rs.getDouble("price"));
                return p;
            }
        }
        return null;
    }

    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setProductDescription(rs.getString("product_description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setPrice(rs.getDouble("price"));
                list.add(p);
            }
        }
        return list;
    }

    public void deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM product WHERE product_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public int getTotalProducts() {
        int totalProducts = 0;
        String query = "SELECT COUNT(*) FROM product";
        if (conn != null) {
            try {
                PreparedStatement ps = conn.prepareStatement(query);
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
}
