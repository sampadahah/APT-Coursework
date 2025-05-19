package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.CategoryDAO;
import com.aptcoursework.model.AddCategory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AddCategoryController")
public class AddCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDAO categoryDAO;

    @Override
   
    public void init() throws ServletException {
        try {
            categoryDAO = new CategoryDAO();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Optional: replace with logger
            throw new ServletException("Failed to initialize CategoryDAO", e); // Ensures servlet fails to start if DB is inaccessible
        }
    }


    // Handle POST request (when the form is submitted)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String categoryName = request.getParameter("categoryName");
            String description = request.getParameter("description");
            int totalProducts = Integer.parseInt(request.getParameter("totalProducts"));

            AddCategory category = new AddCategory();
            category.setCategoryId(categoryId);
            category.setCategoryName(categoryName);
            category.setDescription(description);
            category.setTotalProducts(totalProducts);

            boolean success = categoryDAO.addCategory(category);

            if (success) {
            	response.sendRedirect(request.getContextPath() + "/AddCategoryController");

            } else {
                response.sendRedirect("/pages/addCategory.jsp?error=true");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("/pages/addCategory.jsp?error=invalidInput");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/pages/addCategory.jsp?error=true");
        }
    }

    // Handle GET request (when the page is loaded or form is requested)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String showForm = request.getParameter("showForm");
		if ("true".equals(showForm)) {
		    request.setAttribute("showForm", true); // Set the showForm attribute to true
		} else {
		    request.setAttribute("showForm", false); // Hide the form if "showForm" is not true
		}

		// Fetch the list of categories from the DAO
		List<AddCategory> categories = categoryDAO.getAllCategories();
		request.setAttribute("categories", categories);


		request.getRequestDispatcher("/pages/addCategory.jsp").forward(request, response);
    }

}
