package com.aptcoursework.controller.servlet;

import com.aptcoursework.controller.dao.CartDAO;
import com.aptcoursework.model.CartItem;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            CartDAO dao = new CartDAO();
            dao.addToCart(userId, productId, quantity);
            response.sendRedirect("cart");
        } catch (Exception e) {
            throw new ServletException("Error adding item to cart", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            CartDAO dao = new CartDAO();
            List<CartItem> cartItems = dao.getCartItems(userId);
            if (cartItems == null || cartItems.isEmpty()) {
                request.setAttribute("message", "Your cart is empty.");
            } else {
                request.setAttribute("cartItems", cartItems);
            }
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving cart items", e);
        }
    }
}
