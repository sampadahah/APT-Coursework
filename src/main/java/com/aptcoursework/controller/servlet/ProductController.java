package com.aptcoursework.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aptcoursework.model.Product;
import com.aptcoursework.service.ProductService;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ProductService service = new ProductService();
        Product p = new Product();

        try {
           
            p.setName(req.getParameter("name"));
            p.setCategory(req.getParameter("category"));
            p.setTitle1(req.getParameter("title1"));
            p.setTitle2(req.getParameter("title2"));
            p.setTitle3(req.getParameter("title3"));
            p.setText1(req.getParameter("text1"));
            p.setText2(req.getParameter("text2"));
            p.setText3(req.getParameter("text3"));
            p.setPrice(Double.parseDouble(req.getParameter("price")));
            p.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            p.setImagePath(req.getParameter("imagePath"));

      
            service.addProduct(p);

            
            req.setAttribute("successMessage", "Product added successfully.");
            req.getRequestDispatcher("add_product.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Something went wrong while adding product: " + e.getMessage());
            req.getRequestDispatcher("add_product.jsp").forward(req, res);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("add_product.jsp");
    }
}
