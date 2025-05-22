package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search") // This maps the Servlet to the URL /search
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        List<Product> matchedProducts = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            try {
                ProductDAO productDAO = new ProductDAO();
                List<Product> allProducts = productDAO.getAllProducts();

                for (Product product : allProducts) {
                    if (product.getName().toLowerCase().contains(query.toLowerCase())) {
                        matchedProducts.add(product);
                    }
                }

                request.setAttribute("query", query);
                request.setAttribute("matchedProducts", matchedProducts);

            } catch (Exception e) {
                request.setAttribute("errorMessage", "Error fetching products: " + e.getMessage());
            }

        } else {
            request.setAttribute("errorMessage", "Please enter a search term.");
        }

        request.getRequestDispatcher("/pages/searchResults.jsp").forward(request, response);
    }
}
