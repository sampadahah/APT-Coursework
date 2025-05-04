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
		HttpSession session = request.getSession();
		
		String oldUsername = (String) session.getAttribute("username");
		
        String newUsername = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneString=request.getParameter("phone");
        long phone=Long.parseLong(phoneString);
        String address = request.getParameter("address");

        
        user updatedUser = new user();
        updatedUser.setName(newUsername);
        updatedUser.setEmail(email);
        updatedUser.setPhone(phone);
        updatedUser.setAddress(address);

        
        
        boolean success=false;
        if (success) {
        	System.out.println("Profile updated successfully for: " + newUsername);
            session.setAttribute("username", newUsername);
            session.setAttribute("email", email);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
            request.setAttribute("successMessage", "Profile updated successfully.");
            response.sendRedirect(request.getContextPath()+"/pages/home.jsp");
            //request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);



        try {
            UserDAO userDAO = new UserDAO();
            success = userDAO.updatedUserProfile(oldUsername, updatedUser);

            if (success) {
                // Update session
                session.setAttribute("username", newUsername);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);

                request.setAttribute("successMessage", "Profile updated successfully.");
                response.sendRedirect(request.getContextPath()+"/pages/home.jsp");
                return;
            } else {
                request.setAttribute("errorMessage", "Failed to update profile.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database connection error.");
        }

        request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
    }
<<<<<<< HEAD
}
}



=======
}
}
>>>>>>> 4d5f1636117085633992654cbd2a54b5dd145a6e
