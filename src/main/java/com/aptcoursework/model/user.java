package com.aptcoursework.model;

import java.sql.Timestamp;

public class user {
	private int user_id;
	private String username;
	private String password;
	private String email;
	private int phone_no;
	private String address;
	private String role;
	private Timestamp registered_date;

	// Constructors
	public user() {
	}

	public user(int user_id, String username, String password, String email, int phone_no, String address, String role,
			Timestamp registered_date) {
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone_no = phone_no;
		this.address = address;
		this.role = role;
		this.registered_date = registered_date;
	}

	// Getters and Setters
	public int getUserId() {
		return user_id;
	}

	public void setUserId(int userId) {
		this.user_id = userId;
	}

	public String getName() {
		return username;
	}

	public void setName(String name) {
		this.username = name;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public int getPhone() {
		return phone_no;
	}

	public void setPhone(int phone) {
		this.phone_no = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Timestamp getRegisteredDate() {
		return registered_date;
	}

	public void setCreatedAt(Timestamp registered_date) {
		this.registered_date = registered_date;
	}
}
