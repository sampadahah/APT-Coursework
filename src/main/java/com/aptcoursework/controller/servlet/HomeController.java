package com.aptcoursework.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

/**
 * Servlet implementation class homeServlet
 */
@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ProductDAO productDAO = new ProductDAO();
			List<Product> featuredProducts = productDAO.getRandomProducts(4);
			System.out.println("Number of products fetched: " + featuredProducts.size());
			
			request.setAttribute("featuredProducts", featuredProducts);
			request.getRequestDispatcher("/pages/home.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading homepage");
		}
		
	}


}
