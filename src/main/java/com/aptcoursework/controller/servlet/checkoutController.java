package com.aptcoursework.controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;


	public checkoutController() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException{
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
	}
}
