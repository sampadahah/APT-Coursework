<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.aptcoursework.model.Product" %>
<%@ include file="header.jsp" %>

<%
    Product editProduct = (Product) request.getAttribute("editProduct");

    if (editProduct == null) {
%>
        <div class="message-box">Invalid Product ID or Product not found.</div>
<%
    } else {
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/manageProduct.css" />
    <style>

</style>
</head>

<body>

<div class="center-wrapper">
    <h1 class="page-title">Edit Product</h1>

    <div class="edit-product-container">
            <h2>Edit Product</h2>

            <!-- Form to update product -->
            <form action="<%= request.getContextPath() %>/ManageProductController" method="post">
                <!-- Hidden inputs for action and product ID -->
                <input type="hidden" name="action" value="updateProduct" />
                <input type="hidden" name="id" value="<%= editProduct.getId() %>" />

                <label>Name:</label><br/>
                <input type="text" name="name" value="<%= editProduct.getName() %>" required /><br/><br/>

                <label>Description:</label><br/>
                <input type="text" name="description" value="<%= editProduct.getDescription() %>" required /><br/><br/>

                <label>Quantity:</label><br/>
                <input type="number" name="stockQuantity" value="<%= editProduct.getStockQuantity() %>" required /><br/><br/>

                <label>Price:</label><br/>
                <input type="number" step="0.01" name="price" value="<%= editProduct.getPrice() %>" required /><br/><br/>

                <label>Current Image:</label><br/>
                <input type="text" name="imagepath" value="<%= editProduct.getImagePath() %>" required /><br/><br/>
                <img src="<%= request.getContextPath() %>/<%= editProduct.getImagePath() %>" width="120" height="120" alt="Current Product Image" /><br/><br/>

                <input type="submit" value="Update Product" />
            </form>
        </div>

    <div class="back-button-container">
        <a href="<%= request.getContextPath() %>/ManageProductController" class="back-button">Back to Product Management</a>
    </div>
</div>

</body>
</html>

<% } %>
