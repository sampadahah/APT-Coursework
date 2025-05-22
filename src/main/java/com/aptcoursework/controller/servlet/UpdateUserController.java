package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.User;

/*
 * @WebServlet("/UpdateUserController") public class UpdateUserController
 * extends HttpServlet { protected void doPost(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * int id = Integer.parseInt(request.getParameter("userId")); String name =
 * request.getParameter("name"); String email = request.getParameter("email");
 * String phone = request.getParameter("phone"); String address =
 * request.getParameter("address"); String role = request.getParameter("role");
 * 
 * long phoneLong = 0; try { phoneLong = Long.parseLong(phone); } catch
 * (NumberFormatException e) { e.printStackTrace(); // Handle invalid input
 * gracefully, maybe redirect with error }
 * 
 * try { UserDAO dao = new UserDAO(); user existingUser = dao.getUserById(id);
 * // You must implement this method
 * 
 * if (existingUser != null) { existingUser.setName(name);
 * existingUser.setEmail(email); existingUser.setPhone(phoneLong);
 * existingUser.setAddress(address); existingUser.setRole(role);
 * 
 * dao.updatedUserProfile(id, existingUser);
 * response.sendRedirect("ViewUsersController"); } else { // User not found,
 * redirect or show error response.sendRedirect("error.jsp"); }
 * 
 * } catch (Exception e) { e.printStackTrace();
 * response.sendRedirect("error.jsp"); } } }
 */

@WebServlet("/updateUserController")
public class UpdateUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            userDAO = new UserDAO();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneStr = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String registeredDateStr = request.getParameter("registeredDate");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (userIdStr == null || userIdStr.isEmpty()) {
            request.setAttribute("errorMessage", "Invalid user ID.");
            request.getRequestDispatcher("/pages/editUser.jsp").forward(request, response);
            return;
        }

        int userId = Integer.parseInt(userIdStr);

        if (!password.isEmpty() && !password.equals(confirmPassword)) {
            setAttributesAndForward(request, response, "Passwords do not match.");
            return;
        }

        long phone = 0L;
        try {
            phone = Long.parseLong(phoneStr);
        } catch (NumberFormatException e) {
            setAttributesAndForward(request, response, "Invalid phone number format.");
            return;
        }

        Timestamp registeredDate = null;
        try {
            // Convert datetime-local string to Timestamp
            // Input like "2025-05-18T13:45"
            registeredDate = Timestamp.valueOf(registeredDateStr.replace("T", " ") + ":00");
        } catch (Exception e) {
            setAttributesAndForward(request, response, "Invalid registered date format.");
            return;
        }

        try {
            User existingUser = userDAO.getUserById(userId);
            if (existingUser == null) {
                setAttributesAndForward(request, response, "User not found.");
                return;
            }

            // Update fields
            existingUser.setUserId(userId);
            existingUser.setUsername(username);
            existingUser.setEmail(email);
            existingUser.setPhone(phone);
            existingUser.setAddress(address);
            existingUser.setRole(role);
            existingUser.setRegisteredDate(registeredDate);

            if (password != null && !password.trim().isEmpty()) {
                existingUser.setPassword(password); // Add hashing if needed
            }

            boolean updated = userDAO.updateUser(existingUser);

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/pages/viewUsers.jsp?message=User updated successfully");
            } else {
                setAttributesAndForward(request, response, "Failed to update user.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            setAttributesAndForward(request, response, "An error occurred: " + e.getMessage());
        }
    }

    private void setAttributesAndForward(HttpServletRequest request, HttpServletResponse response, String errorMessage) throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);

        request.setAttribute("userId", request.getParameter("userId"));
        request.setAttribute("username", request.getParameter("username"));
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("phone", request.getParameter("phone"));
        request.setAttribute("address", request.getParameter("address"));
        request.setAttribute("role", request.getParameter("role"));
        request.setAttribute("registeredDate", request.getParameter("registeredDate"));

        request.getRequestDispatcher("/pages/editUser.jsp").forward(request, response);
    }
}