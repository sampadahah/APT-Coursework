package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.aptcoursework.controller.dao.CartItemDAO;
import com.aptcoursework.model.CartItem;

public class cartController extends HttpServlet{
	private static final long serialVersionUID = 1L;


	public cartController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		CartItemDAO cartItemDAO = null;
		try {
			cartItemDAO = new CartItemDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<CartItem> cartItems =  cartItemDAO.getCartItemByUserID(userId);
		
		if(cartItems == null || cartItems.isEmpty()) {
			request.setAttribute("message", "No Product in the cart");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		CartItemDAO cartItemDAO = null;
		try {
			cartItemDAO = new CartItemDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<CartItem> cartItems = cartItemDAO.getCartItemByUserID(userId);
		
		if(cartItems == null || cartItems.isEmpty()) {
			request.setAttribute("message", "No Product in the cart");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			return;
		}
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String streetno = request.getParameter("streetno");
		String paymentMethod = request.getParameter("paymentMethod");
		
		String orderSummary = "Order placed sucessfully!\n";
		orderSummary += "Shipping Address:" + address+ "," + city + " "  + streetno + "\n";
		orderSummary += "Payment Method:" + paymentMethod + "\n";
		orderSummary += "Cart Items: \n";
		
		for (CartItem item : cartItems) {
		    String name = item.getName();
		    double price = item.getPrice();
		    int quantity = item.getQuantity();
		    orderSummary += "Product: " + name + ", Price: " + price + ", Quantity: " + quantity + "\n";
		}

		session.removeAttribute("cartItems");
		request.setAttribute("orderSummary", orderSummary);
		request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
	
	}
}
