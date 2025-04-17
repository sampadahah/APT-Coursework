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

    public loginController() {
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
        String emailToCheck = request.getParameter("email");
        String passwordToCheck = request.getParameter("password");

        try {
            userDAO userdao = new userDAO();
            user user = userdao.login(emailToCheck, passwordToCheck);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userWithSession", user);
                session.setMaxInactiveInterval(600); // 10 minutes in seconds

                // Check user role and redirect accordingly
                if ("customer".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/pages/home.jsp"); // Redirect to home for customer
                } else if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/pages/Dashboard.jsp"); // Redirect to dashboard for admin
                } else {
                    // If role is not recognized, redirect to home or show error
                    response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                }
            } else {
                request.setAttribute("loginError", "Invalid email or password. Please try again.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            e.printStackTrace(); // Optional: log to file in production
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}



