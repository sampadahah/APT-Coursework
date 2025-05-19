<%@ page language="java" import="java.util.List,com.aptcoursework.model.AddCategory" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category Page</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/addCategory.css">
</head>
<body>
<%@ include file="adminheader.jsp" %>

<div class="container">
    <div class="welcome">Welcome, Admin</div>

    <!-- Add New Category Button -->
    <div class="add-btn">
        <a href="<%= request.getContextPath() %>/AddCategoryController?showForm=true" class="add-category-link">+ Add New Category</a>
    </div>

    <!-- Show form if requested -->
    <div class="category-form">
        <%
            Boolean showForm = (Boolean) request.getAttribute("showForm");
            if (showForm != null && showForm) {
        %>
            <form action="<%= request.getContextPath() %>/AddCategoryController" method="post">
                <div class="form-group">
                    <label for="categoryId">Category ID:</label>
                    <input type="text" name="categoryId" required>
                </div>

                <div class="form-group">
                    <label for="categoryName">Category Name:</label>
                    <input type="text" name="categoryName" required>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea name="description" required></textarea>
                </div>

                <div class="form-group">
                    <label for="totalProducts">Total Products:</label>
                    <input type="number" name="totalProducts" required>
                </div>

                <button type="submit">Add Category</button>
            </form>
        <%
            }
        %>
    </div>

    <!-- Display category list -->
    <div class="title">Total Categories</div>
    <table>
        <thead>
            <tr>
                <th>S.N.</th>
                <th>Category Name</th>
                <th>Category ID</th>
                <th>Total Products</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<AddCategory> categories = (List<AddCategory>) request.getAttribute("categories");
                if (categories != null && !categories.isEmpty()) {
                    for (int i = 0; i < categories.size(); i++) {
                        AddCategory category = categories.get(i);
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= category.getCategoryName() %></td>
                <td><%= category.getCategoryId() %></td>
                <td><%= category.getTotalProducts() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">No categories found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
