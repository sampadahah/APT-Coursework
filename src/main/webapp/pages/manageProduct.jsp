<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aptcoursework.model.Product" %>
<%@ include file="header.jsp" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    Product editProduct = (Product) request.getAttribute("editProduct");

    String message = null;
    String color = "#cc0e74";

    String paramMessage = request.getParameter("message");

    if ("success".equals(paramMessage)) {
        message = "Product added successfully!";
    } else if (request.getAttribute("updatedId") != null) {
        message = "Product updated successfully!";
    } else if (request.getAttribute("deletedId") != null) {
        message = "Product deleted successfully!";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/manageProduct.css" />
</head>
<body>

<div class="back-link">
    <a href="<%= request.getContextPath() %>/pages/AddProduct.jsp" class="btn-back">← Add New Product</a>
</div>

<div class="center-wrapper">
    <h1 class="page-title">Manage Products</h1>

    <% if (message != null) { %>
        <div class="message-box" style="border-color:<%= color %>; color:<%= color %>;">
            <%= message %>
        </div>
    <% } %>

    <div class="table-container">
        <table class="styled-table" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price(Rs)</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (products != null && !products.isEmpty()) {
                        for (Product p : products) {
                %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getDescription() %></td>
                    <td><%= p.getStockQuantity() %></td>
                    <td><%= p.getPrice() %></td>
                    <td>
                        <img src="<%= request.getContextPath() %>/<%= p.getImagePath() %>" width="80" height="80" alt="Product Image" />
                    </td>
                    <td>
                        <a href="<%= request.getContextPath() %>/ManageProductController?editId=<%= p.getId() %>">✏️</a> |
                        <a href="<%= request.getContextPath() %>/ManageProductController?deleteId=<%= p.getId() %>"
                           onclick="return confirm('Are you sure you want to delete this product?');">🗑️</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr><td colspan="7">No products found.</td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <% if (editProduct != null) { %>
        <div class="edit-product-container">
            <h2>Edit Product</h2>
            <form action="<%= request.getContextPath() %>/ManageProductController" method="post">
                <input type="hidden" name="action" value="updateProduct" />
                <input type="hidden" name="productId" value="<%= editProduct.getId() %>" />

                <label>Name:</label><br/>
                <input type="text" name="productName" value="<%= editProduct.getName() %>" required /><br/><br/>

                <label>Description:</label><br/>
                <input type="text" name="productDescription" value="<%= editProduct.getDescription() %>" required /><br/><br/>

                <label>Quantity:</label><br/>
                <input type="number" name="stockQuantity" value="<%= editProduct.getStockQuantity() %>" required /><br/><br/>

                <label>Price:</label><br/>
                <input type="number" step="0.01" name="price" value="<%= editProduct.getPrice() %>" required /><br/><br/>

                <label>Current Image:</label><br/>
                <img src="<%= request.getContextPath() %>/<%= editProduct.getImagePath() %>" width="120" height="120" alt="Current Product Image" /><br/><br/>

                <input type="submit" value="Update Product" />
            </form>
        </div>
    <% } %>
</div>

</body>
</html>
