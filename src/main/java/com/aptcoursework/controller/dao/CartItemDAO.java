package com.aptcoursework.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.CartItem;

public class CartItemDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public CartItemDAO() throws ClassNotFoundException, SQLException{
		this.conn = DatabaseConnection.getConnection();
	}
	
	public boolean addCartItem(CartItem item, int userId) {
		boolean added = false;
		String query = "INSERT INTO cart (user_id, product_name, price, quantity,image) VALUES(?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1,userId);
			ps.setString(2, item.getName());
			ps.setDouble(3, item.getPrice());
			ps.setInt(4,item.getQuantity());
			ps.setString(5, item.getImage());
			
			if(ps.executeUpdate() > 0) {
				added = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return added;
	}
	
	public List<CartItem> getCartItemByUserID(int userId) {
		List<CartItem> cartItems = new ArrayList<>();
		String query = "SELECT * FROM cart WHERE user_id = ?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				CartItem item = new CartItem();
				item.setId(rs.getInt("user_id"));
				item.setName(rs.getString("product_name"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setImage(rs.getString("image"));
                cartItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartItems;
	}
	public boolean clearCart(int userId) {
		boolean cleared = false;
		String query = "DELETE FROM cart WHERE user_id = ?";
		
		try {
			ps= conn.prepareStatement(query);
			ps.setInt(1, userId);
			cleared = ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cleared;
	}
}
