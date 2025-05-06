package com.aptcoursework.model;

public class Product {
    private int id;  
    private String name;  
    private String description;  
    private int stockQuantity;  
    private double price;  
    private String imagePath;  

    // Getters and setters for all fields

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

    public String getDescription() {
        return description;  
    }

    public void setDescription(String description) {
        this.description = description;  
    }

    public int getStockQuantity() {
        return stockQuantity;  
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;  
    }

    public double getPrice() {
        return price;  
    }

    public void setPrice(double price) {
        this.price = price;  
    }

    public String getImagePath() {
        return imagePath;  
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath; 
    }
}
