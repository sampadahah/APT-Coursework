package com.aptcoursework.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Product p = new Product();

        // Set the product details from the form
        p.setProductName(req.getParameter("name"));  // updated field name
		/*
		 * p.setTitle1(req.getParameter("title1"));
		 * p.setTitle2(req.getParameter("title2"));
		 * p.setTitle3(req.getParameter("title3"));
		 * p.setText1(req.getParameter("text1")); p.setText2(req.getParameter("text2"));
		 * p.setText3(req.getParameter("text3"));
		 */
        p.setPrice(Double.parseDouble(req.getParameter("price")));
        p.setStockQuantity(Integer.parseInt(req.getParameter("quantity")));  // updated field name

        try {
            ProductDAO dao = new ProductDAO();
            dao.addProduct(p);
            res.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }
}
