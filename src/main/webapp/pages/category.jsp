<%@ page language="java" import="com.aptcoursework.model.Category, java.util.List" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/CSS/category.css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="main-content-wrapper">
    <div class="page header">
        <h2>Welcome, Admin</h2>
        <!-- Updated link to include parameter -->
        <a href="category.jsp?showForm=true">
            <button class="add-category-btn">Add New Category</button>
        </a>
    </div>

    <h3>Total Categories</h3>

    <%
        List<Category> categories = (List<Category>) request.getAttribute("categories");
    %>

    <table class="category-table">
        <tr>
            <th>S.N.</th>
            <th>Category Name</th>
            <th>Category ID</th>
            <th>Total Products</th>
        </tr>
        <% if (categories == null || categories.isEmpty()) { %>
            <tr>
                <td colspan="4">No categories found.</td>
            </tr>
        <% } else {
            int sn = 1;
            for (Category c : categories) {
        %>
            <tr>
                <td><%= sn++ %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getId() %></td>
                <td><%= c.getTotalProducts() %></td>
            </tr>
        <% } } %>
    </table>

    <!-- Conditionally show form based on request parameter -->
    <%
        String showForm = request.getParameter("showForm");
        if ("true".equals(showForm)) {
    %>
    <div class="form-section" id="addForm">
        <h3>Add New Category</h3>
        <form action="<%= request.getContextPath() %>/CategoryController" method="post">
            <label>Category Name:</label><br>
            <input type="text" name="name" required><br>

            <label>Total Products:</label><br>
            <input type="number" name="totalProducts" required><br><br>

            <input type="submit" value="Add Category" class="submit-btn">
        </form>
    </div>
    <%
        }
    %>
</div>


</body>
</html>
