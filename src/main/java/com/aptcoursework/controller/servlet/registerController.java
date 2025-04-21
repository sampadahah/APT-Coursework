package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.user;
import com.aptcoursework.utility.EncryptDecrypt;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/registerController" })
public class registerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public registerController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String phoneString=request.getParameter("phone");
	        long phone;
	        try {
	        	phone = Long.parseLong(phoneString);
	        }catch (NumberFormatException e){
                request.setAttribute("errorMessage", "Invalid phone number format.");
                request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
                return;
            }
	        String address = request.getParameter("address");
	        String role = request.getParameter("role");
	        String registered = request.getParameter("registeredDate");
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("confirmPassword");
	        
	        //validating empty input fields
	        if (username.isEmpty() || email.isEmpty() || address.isEmpty() || role.isEmpty() || registered.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
	            request.setAttribute("errorMessage", "Please fill in all fields.");
	            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
	           return;
	        }
	        //checking passwords
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match.");
                request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
                return;
            }
            
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
	        LocalDateTime dateTime = LocalDateTime.parse(registered, formatter);
	        Timestamp timestamp = Timestamp.valueOf(dateTime);
	
	        UserDAO userdao = new UserDAO();
	            
	        // Create user object
	         user newUser = new user();
	         newUser.setName(username);
	         newUser.setEmail(email);
	         newUser.setPhone(phone);
	         newUser.setAddress(address);
	         newUser.setRole(role);
	         newUser.setPassword(EncryptDecrypt.encrypt(password));
	         newUser.setRegisteredDate(timestamp);
	         
	         boolean isRegistered = userdao.register(newUser);
	
	         if (isRegistered) {
	                // After successful registration, redirect to login page
	             response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	         } else {
	             request.setAttribute("errorMessage", "Registration failed. Please try again.");
	             request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
	         }
        } catch (ClassNotFoundException | SQLException e) {
        	e.printStackTrace();
            request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unexpected error occurred.");
            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
        }finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
