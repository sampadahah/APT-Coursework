package com.aptcoursework.controller.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checkoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;


	public checkoutController() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException{
		String address = request.getParameter("address");
		String city = request.getParameter("towncity");
		String streetno = request.getParameter("streetno");
		String paymentMethod = request.getParameter("paymentMethod");
		
		
	}
}
