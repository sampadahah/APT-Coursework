<<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categories</title>
</head>
<body>

<%@ include file="header.jsp" %>

<h1>Categories</h1>

<div class="category-container">
    
</div>

<!-- Add Category Button -->
<div style="text-align: center; margin: 20px;">
    <form action="addCategory.jsp" method="post">
        <input type="submit" name="showForm" value="Add New Category">
    </form>
</div>

<%-- Check if the form should be displayed --%>
<% 
    String showForm = request.getParameter("showForm");
    if (showForm != null) {
%>

<div style="width: 300px; margin: 30px auto;">
    <h3>Add New Category</h3>
    <form action="CategoryController" method="post">
        <label>Category Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Total Products:</label><br>
        <input type="number" name="totalProducts" required><br><br>

        <input type="submit" value="Add Category">
    </form>
</div>

<% 
    }
%>

<%@ include file="footer.jsp" %>

</body>
</html>
