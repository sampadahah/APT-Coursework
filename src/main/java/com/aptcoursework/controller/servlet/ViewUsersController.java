package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.UserDAO;
import com.aptcoursework.model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ViewUsersController")
public class ViewUsersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserDAO dao = new UserDAO();
            ArrayList<user> userList = dao.getAllUsers();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("/pages/viewUsers.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching users.");
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        }
    }
}
