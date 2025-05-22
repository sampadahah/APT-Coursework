package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.Product;
import com.aptcoursework.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminDashboardController") // This maps the servlet to the URL /adminDashboard
public class AdminDashboardController extends HttpServlet{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Create DAO instances
            UserDAO userDAO = new UserDAO();
            ProductDAO productDAO = new ProductDAO();

            // Get the total number of users and products
            int totalUsers = userDAO.getAllUsers().size();
            int totalProducts = productDAO.getAllProducts().size();

            // Set the attributes to be accessed in the JSP
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalProducts", totalProducts);

            // Forward to adminDashboard.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/pages/adminDashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving data.");
        }
    }
}
