package controller;

import com.aptcoursework.controller.dao.*;
import com.aptcoursework.model.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        try {
            categoryDAO = new CategoryDAO(); // Wrapped in try-catch for better error handling
        } catch (Exception e) {
            e.printStackTrace();  // Log or handle the error as needed
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("category.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving categories.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String totalProductsStr = request.getParameter("totalProducts");

            // Validate inputs
            if (name == null || name.trim().isEmpty() || totalProductsStr == null || totalProductsStr.trim().isEmpty()) {
                request.setAttribute("error", "Name and Total Products are required.");
                request.getRequestDispatcher("category.jsp").forward(request, response);
                return;
            }

            int totalProducts;
            try {
                totalProducts = Integer.parseInt(totalProductsStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Total Products must be a valid number.");
                request.getRequestDispatcher("category.jsp").forward(request, response);
                return;
            }

            Category newCategory = new Category();
            newCategory.setName(name);
            newCategory.setTotalProducts(totalProducts);

            boolean success = categoryDAO.Category(newCategory);
            if (success) {
                response.sendRedirect("CategoryController");  // Redirect to GET method to show updated list
            } else {
                request.setAttribute("error", "Error adding the category.");
                request.getRequestDispatcher("category.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Log the error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding category.");
        }
    }
}
