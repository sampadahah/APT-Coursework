package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aptcoursework.controller.dao.CategoryDAO;
import com.aptcoursework.model.Category;

public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CategoryController() {
        super();
    }

    // Handle GET request (fetch and display categories)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Initialize session
        HttpSession session = request.getSession();

        
        CategoryDAO categoryDAO = null;
        try {
            categoryDAO = new CategoryDAO();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

       
        List<Category> categories = null;
        categories = categoryDAO.getAllCategories();

       
        if (categories == null || categories.isEmpty()) {
            request.setAttribute("message", "No categories available.");
        }
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        HttpSession session = request.getSession();

       
        String categoryName = request.getParameter("name");
        int totalProducts = Integer.parseInt(request.getParameter("totalProducts"));

        
        CategoryDAO categoryDAO = null;
        try {
            categoryDAO = new CategoryDAO();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        
        Category newCategory = new Category(0, categoryName, totalProducts);

        categoryDAO.addCategory(newCategory);

       
        session.setAttribute("message", "Category added successfully!");

       
        response.sendRedirect("CategoryController");
    }
}
