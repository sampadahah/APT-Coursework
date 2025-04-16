package com.aptcoursework.controller.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.user;

public class userDAO {
	private Connection conn;
	private PreparedStatement ps;
	// Constructor: Initializes the database connection when an object is created
	public userDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	// Registers a new user in the database
	public boolean register(user user) {
		boolean isUserRegistered = false;
		// SQL statement to insert user details
		String query = "INSERT INTO users (username, password, email, phone_no, address, role) VALUES (?, ?, ?, ?, ?, ?)";
		if (conn != null) {

			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, user.getName());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getEmail()); // TODO Passwords should be hashed in real-world apps
				ps.setInt(4, user.getPhone());
				ps.setString(5, user.getAddress());
				ps.setString(6, user.getRole());
				
				// Execute the insert query
				if (ps.executeUpdate() > 0) {
					isUserRegistered = true;
				}
			} catch (SQLException e) {
				// TODO Good for debugging; can be replaced with proper logging
				e.printStackTrace();
			}
		}
		return isUserRegistered;

	}

	// get all the users from database
	public ArrayList<user> getAllUsers() {
		ArrayList<user> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery(); //stores all the user information retrieved by running query in database
				
				// Iterate over result set and populate User objects
				while (userSet.next()) {
					user user = new user();
					user.setUserId(userSet.getInt("user_id"));
					user.setName(userSet.getString("name"));
					user.setEmail(userSet.getString("email"));
					user.setPassword(userSet.getString("password"));
					user.setPhone(userSet.getInt("phone_no"));
					user.setAddress(userSet.getString("address"));
					user.setRole(userSet.getString("role"));
					user.setCreatedAt(userSet.getTimestamp("registered_time"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Shows error if query fails
				e.printStackTrace();
			}
		}
		return users;
	}

	// Authenticates user by checking email and password
	public user login(String emailToCheck, String passwordToCheck) {
	    user user = null;
	    String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	    
	    if (conn != null) {
	        try {
	            ps = conn.prepareStatement(query);
	            ps.setString(1, emailToCheck);
	            ps.setString(2, passwordToCheck);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                user = new user(
	                    rs.getInt("user_id"),
	                    rs.getString("name"),
	                    rs.getString("password"),
	                    rs.getString("email"),
	                    rs.getInt("phone_no"),
	                    rs.getString("address"),
	                    rs.getString("role"),
	                    rs.getTimestamp("registered_time")
	                );
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return user;
	}

}
