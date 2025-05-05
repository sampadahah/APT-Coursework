package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewUsersController")
public class ViewUsersController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserDAO userDAO = new UserDAO();
            ArrayList<user> users = userDAO.getAllUsers();
            request.setAttribute("usersList", users);
            request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve users.");
        }
    }
}
