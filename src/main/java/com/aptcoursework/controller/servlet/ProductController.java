package com.aptcoursework.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

@WebServlet("/ProductController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1MB
    maxFileSize = 5 * 1024 * 1024,    // 5MB
    maxRequestSize = 10 * 1024 * 1024 // 10MB
)
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Product p = new Product();

        try {
            // Set product details from the form
        	p.setName(req.getParameter("product_name"));
            p.setDescription(req.getParameter("product_description")); 
            p.setStockQuantity(Integer.parseInt(req.getParameter("quantity"))); 
            p.setPrice(Double.parseDouble(req.getParameter("price"))); 

            // File upload
            Part filePart = req.getPart("imagePath");
            String fileName = extractFileName(filePart);
            String savePath = req.getServletContext().getRealPath("/img") + "/" + fileName;
            filePart.write(savePath);

            p.setImagePath("img/" + fileName); // Save relative path

            // Use DAO to insert the product
            ProductDAO dao = new ProductDAO();
            dao.addProduct(p);

            // Send success message back to the client
            res.setContentType("text/html;charset=UTF-8");
            res.getWriter().write("<h3>Product added successfully.</h3>");

        } catch (Exception e) {
            e.printStackTrace();
            res.setContentType("text/html;charset=UTF-8");
            res.getWriter().write("<h3>Error occurred while adding the product: " + e.getMessage() + "</h3>");
        }
    }

    // Extract the file name from the file part of the multipart form data
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return "";
    }
}