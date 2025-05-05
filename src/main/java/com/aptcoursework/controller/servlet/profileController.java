package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.user;

/**
 * Servlet implementation class profileController
 */
@WebServlet("/profileController")
public class profileController extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileController() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
	String methodOverride = request.getParameter("_method");
	if("PUT".equalsIgnoreCase(methodOverride)) {
		doPut(request, response);
		return;
	}
}
protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	HttpSession session = request.getSession();

	int userId = (int)session.getAttribute("user_id");

        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String PhoneString=request.getParameter("phone");
        long newPhone=Long.parseLong(PhoneString);
        String newAddress = request.getParameter("address");

        
        user updatedUser = new user();
        updatedUser.setName(newUsername);
        updatedUser.setEmail(newEmail);
        updatedUser.setPhone(newPhone);
        updatedUser.setAddress(newAddress);
        
        
        boolean success=false;
            
        try {
            UserDAO userDAO = new UserDAO();
            success = userDAO.updatedUserProfile(userId, updatedUser);

            if (success) {
                // Update session
                session.setAttribute("username", newUsername);
                session.setAttribute("email", newEmail);
                session.setAttribute("phone_no", newPhone);
                session.setAttribute("address", newAddress);

                request.setAttribute("successMessage", "Profile updated successfully.");
                request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "Failed to update profile.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database connection error.");
        }

       
    }

}
