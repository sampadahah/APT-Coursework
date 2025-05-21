package com.aptcoursework.controller.servlet;



import com.aptcoursework.controller.dao.ManageProductDAO;

import com.aptcoursework.controller.database.DatabaseConnection;

import com.aptcoursework.model.Product;



import javax.servlet.*;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.*;

import java.io.IOException;

import java.sql.Connection;

import java.sql.SQLException;

import java.util.List;



@WebServlet("/ManageProductController")

public class ManageProductController extends HttpServlet {

private static final long serialVersionUID = 1L;



protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String editId = request.getParameter("editId");

String deleteId = request.getParameter("deleteId");



try (Connection conn = DatabaseConnection.getConnection()) {

ManageProductDAO dao = new ManageProductDAO();



if (deleteId != null) {

int id = Integer.parseInt(deleteId);

dao.deleteProduct(id);

response.sendRedirect(request.getContextPath() + "/ManageProductController?deletedId=" + id);

return;

}



if (editId != null) {

int id = Integer.parseInt(editId);

Product product = dao.getProductById(id);

request.setAttribute("editProduct", product);

}



List<Product> productList = dao.getAllProducts();

request.setAttribute("products", productList);



} catch (SQLException | ClassNotFoundException e) {

e.printStackTrace();

throw new ServletException(e);

}



if (request.getParameter("addedId") != null) {

request.setAttribute("addedId", request.getParameter("addedId"));

}

if (request.getParameter("updatedId") != null) {

request.setAttribute("updatedId", request.getParameter("updatedId"));

}

if (request.getParameter("deletedId") != null) {

request.setAttribute("deletedId", request.getParameter("deletedId"));

}



RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/manageProduct.jsp");

dispatcher.forward(request, response);

}



protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String action = request.getParameter("action");



if ("updateProduct".equals(action)) {

try (Connection conn = DatabaseConnection.getConnection()) {

int id = Integer.parseInt(request.getParameter("product_id"));

String name = request.getParameter("product_name");

String description = request.getParameter("product_description");

int quantity = Integer.parseInt(request.getParameter("stock_quantity"));

double price = Double.parseDouble(request.getParameter("price"));

String imagePath = request.getParameter("imagepath");



if (imagePath == null || imagePath.trim().isEmpty()) {

ManageProductDAO daoTemp = new ManageProductDAO();

Product existingProduct = daoTemp.getProductById(id);

if (existingProduct != null) {

imagePath = existingProduct.getImagePath();

}

}

Product product = new Product();

product.setId(id);

product.setName(name);

product.setDescription(description);

product.setStockQuantity(quantity);

product.setPrice(price);

product.setImagePath(imagePath);



ManageProductDAO dao = new ManageProductDAO();

dao.updateProduct(product);



response.sendRedirect(request.getContextPath() + "/ManageProductController?updatedId=" + id);



} catch (SQLException | ClassNotFoundException e) {

e.printStackTrace();

throw new ServletException(e);

}

}

}

}

