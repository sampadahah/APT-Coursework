<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Add Product</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AddProduct.css" />
</head>
<body>

<div class="back-link">
  <a href="<%= request.getContextPath() %>/pages/adminDashboard.jsp" class="btn-back">← Back to Admin Dashboard</a>
</div>


<main>
    <h2>Create New Product</h2>

    <% 
        String message = request.getParameter("message");
        if (message == null) {
            message = (String) request.getAttribute("message");
        }

        if ("success".equals(message)) {
    %>
        <div class="message success">Product added successfully!</div>
    <% } else if ("error".equals(message)) { %>
        <div class="message error">Error occurred while adding the product. Please try again.</div>
    <% } %>

    <form id="productForm" action="<%= request.getContextPath() %>/ProductController" method="post" enctype="multipart/form-data">
        <label for="product_name">Product Name</label>
        <input type="text" id="product_name" name="product_name" required />

        <label for="product_description">Product Description</label>
        <textarea id="product_description" name="product_description" rows="5" required></textarea>

        <label for="price">Price (in RS)</label>
        <input type="number" id="price" name="price" step="0.01" required />

        <label for="quantity">Quantity</label>
        <input type="number" id="quantity" name="quantity" required />

        <label for="imagePath">Product Image</label>
        <input type="file" id="imagePath" name="imagePath" accept="image/*" required />

        <% if (message == null) { %>
        <!-- Show only if product is not submitted -->
        <div class="form-actions">
            <button type="reset">Clear</button>
            <button type="submit">Add</button>
        </div>
        <% } %>
    </form>

    <% 
        String uploadedImagePath = (String) request.getAttribute("uploadedImagePath");
        if (uploadedImagePath != null) {
    %>
        <div style="margin-top: 20px;">
            <p><b>Uploaded Image Preview:</b></p>
            <img src="<%= uploadedImagePath %>" alt="Uploaded Product Image" style="max-width: 300px; border-radius: 10px;" />
        </div>
    <% } %>

    <% if (message == null) { %>
    <div class="form-actions" style="margin-top: 20px;">
        <form action="<%= request.getContextPath() %>/ManageProductController" method="get">
            <button type="submit">Manage Products</button>
        </form>
    </div>
    <% } %>

</main>

</body>
</html>
