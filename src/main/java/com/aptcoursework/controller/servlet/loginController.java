package com.aptcoursework.controller.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aptcoursework.controller.dao.userDAO;
import com.aptcoursework.model.user;

/**
 * Servlet implementation class LogInController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/loginController" })
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String emailToCheck = request.getParameter("email");
		String passwordToCheck = request.getParameter("password");
	    try {
	        userDAO userdao = new userDAO();
	        user user = userdao.login(emailToCheck, passwordToCheck);
	        
	        if (user != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("userWithSession", user);
	            session.setMaxInactiveInterval(600); // 10 minutes in seconds
	            response.sendRedirect(request.getContextPath() + "/pages/Dashboard.jsp");
	        } else {
	            request.setAttribute("loginError", "Invalid email or password. Please try again.");
	            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
	        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	        e.printStackTrace(); // Optional: log to file in production
	    }finally {
			if (out != null) {
				out.close();
			}
		}
	}
}


