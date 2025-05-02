package com.aptcoursework.service;

import java.sql.SQLException;
import java.util.List;
import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

public class ProductService {
    private ProductDAO productDAO;

    public ProductService() throws ClassNotFoundException, SQLException {
        productDAO = new ProductDAO();
    }

    public void addProduct(Product p) throws Exception {
        productDAO.addProduct(p);
    }

    public void updateProduct(Product p) throws Exception {
        productDAO.updateProduct(p);
    }

    public Product getProductById(int id) throws Exception {
        return productDAO.getProductById(id);
    }

    public List<Product> getAllProducts() throws Exception {
        return productDAO.getAllProducts();
    }

    public void deleteProduct(int id) throws Exception {
        productDAO.deleteProduct(id);
    }
}
