package com.aptcoursework.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aptcoursework.controller.dao.UserDAO;

/**
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/DeleteUserController")
public class DeleteUserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            UserDAO dao = new UserDAO();
            dao.deleteUser(id);
            response.sendRedirect("ViewUsersController");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/pages/ErrorPage.jsp");
        }
    }
}

