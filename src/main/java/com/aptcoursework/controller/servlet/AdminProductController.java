package com.aptcoursework.controller.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.aptcoursework.controller.dao.ProductDAO;
import com.aptcoursework.model.Product;

@WebServlet("/ProductController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB
    maxFileSize = 5 * 1024 * 1024,       // 5MB
    maxRequestSize = 10 * 1024 * 1024    // 10MB
)
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Product p = new Product();

        try {
            // Get form fields
            p.setName(req.getParameter("product_name"));
            p.setDescription(req.getParameter("product_description"));
            p.setStockQuantity(Integer.parseInt(req.getParameter("quantity")));
            p.setPrice(Double.parseDouble(req.getParameter("price")));

            // Handle image upload
            Part filePart = req.getPart("imagePath");

            if (filePart != null && filePart.getSize() > 0) {
                // Get filename and sanitize
                String fileName = extractFileName(filePart);
                if (fileName == null || fileName.trim().isEmpty()) {
                    throw new ServletException("Invalid file.");
                }

                fileName = fileName.replaceAll("[\\\\/:*?\"<>|]", "_");

                // Generate unique filename to prevent duplicates
                String extension = fileName.substring(fileName.lastIndexOf("."));
                String uniqueFileName = UUID.randomUUID().toString() + extension;

                // Create /img directory if it doesn't exist
                String uploadPath = req.getServletContext().getRealPath("/img");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Save the file
                String savePath = uploadPath + File.separator + uniqueFileName;
                filePart.write(savePath);

                // Set relative path in product
                p.setImagePath("/img/" + uniqueFileName);
            } else {
                throw new ServletException("Image upload failed or empty.");
            }

            // Save product to database
            ProductDAO dao = new ProductDAO();
            dao.addProduct(p);

            // Redirect with success message
            res.sendRedirect(req.getContextPath() + "/ManageProductController?message=success");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect(req.getContextPath() + "/pages/AddProduct.jsp?message=error");
        }
    }

    // Extract file name from HTTP header
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return null;
    }
}

