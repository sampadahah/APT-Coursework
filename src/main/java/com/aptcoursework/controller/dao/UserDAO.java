package com.aptcoursework.controller.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.aptcoursework.controller.database.DatabaseConnection;
import com.aptcoursework.model.user;


public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	// Constructor: Initializes the database connection when an object is created
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}


	// Registers a new user in the database 
	public boolean register(user user) {
		boolean isUserRegistered = false; // SQL statement to insert user details
		String query =
	     "INSERT INTO user (username, password, email, phone, address, role,registered) VALUES (?, ?, ?, ?, ?, ?,?)"; 
		if (conn != null) {
		 try { 
			 ps = conn.prepareStatement(query); 
		 	 ps.setString(1, user.getName());
			 ps.setString(2, user.getPassword()); 
			 ps.setString(3, user.getEmail()); //
			 ps.setLong(4, user.getPhone()); 
			 ps.setString(5, user.getAddress()); 
			 ps.setString(6, user.getRole());
			 ps.setTimestamp(7, user.getRegisteredDate());
	 // Execute the insert query 
			 if (ps.executeUpdate() > 0) { 
				 isUserRegistered =true; 
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
		String query = "SELECT * FROM user";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery(); //stores all the user information retrieved by running query in database
				
				// Iterate over result set and populate User objects
				while (userSet.next()) {
					user user = new user();
					user.setUserId(userSet.getInt("user_id"));
					user.setName(userSet.getString("username"));
					user.setPassword(userSet.getString("password"));
					user.setEmail(userSet.getString("email"));
					user.setPhone(userSet.getLong("phone"));
					user.setAddress(userSet.getString("address"));
					user.setRole(userSet.getString("role"));
					user.setRegisteredDate(userSet.getTimestamp("registered"));
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
	    String query = "SELECT * FROM user WHERE email = ? AND password = ?";
	    
	    if (conn != null) {
	        try {
	            ps = conn.prepareStatement(query);
	            ps.setString(1, emailToCheck);
	            ps.setString(2, passwordToCheck);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                user = new user(
	                    rs.getInt("user_id"),
	                    rs.getString("username"),
	                    rs.getString("password"),
	                    rs.getString("email"),
	                    rs.getLong("phone"),
	                    rs.getString("address"),
	                    rs.getString("role"),
	                    rs.getTimestamp("registered")
	                );
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return user;
	}
	public boolean updatedUserProfile(String oldUsername, user updatedUser) {
		boolean isUpdated = false;
		String query = "UPDATE user SET username=?, email=?, phone=?, address=? WHERE username=?";
		
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, updatedUser.getName());
				ps.setString(2, updatedUser.getEmail());
                ps.setLong(3, updatedUser.getPhone());
                ps.setString(4, updatedUser.getAddress());
                ps.setString(5, oldUsername);
                System.out.println("Updating profile for: " + oldUsername);
                System.out.println("New values: " + updatedUser.getName() + ", " + updatedUser.getEmail());

                if(ps.executeUpdate()>0) {
                	isUpdated = true;
                }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		return isUpdated;
	}

}
