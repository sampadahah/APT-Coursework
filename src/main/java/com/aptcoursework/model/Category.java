package com.aptcoursework.model;

public class Category {
	private int id;
	private String name;
	private int totalProducts;
	
	public Category() {}
	
	public Category(int id, String name, int totalProducts) {
		this.id = id;
		this.name = name;
		this.totalProducts = totalProducts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(int totalProducts) {
		this.totalProducts = totalProducts;
	}
	

}
