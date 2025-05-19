<%-- <%@ page import="com.aptcoursework.model.user" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    user u = (user) request.getAttribute("editUser");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<% if (u != null) { %>
    <h2>Edit User</h2>
    <form action="${pageContext.request.contextPath}/UpdateUserController" method="post">
        <input type="hidden" name="userId" value="<%= u.getUserId() %>" />
        
        Username: <input type="text" name="name" value="<%= u.getName() %>" required /><br/><br/>
        
        Email: <input type="email" name="email" value="<%= u.getEmail() %>" required /><br/><br/>
        
        Phone: <input type="text" name="phone" value="<%= u.getPhone() %>" /><br/><br/>
        
        Address: <input type="text" name="address" value="<%= u.getAddress() %>" /><br/><br/>
        
        Role: <input type="text" name="role" value="<%= u.getRole() %>" /><br/><br/>
        
        <input type="submit" value="Update User" />
    </form>
<% } else { %>
    <h2>User not found</h2>
    <p>The user details could not be loaded. Please return to the <a href="${pageContext.request.contextPath}/ViewUsersController">user list</a>.</p>
<% } %>
</body>
</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/register.css">
    <style>
        .alert {
            background-color: #ffe5e5;
            color: #d63333;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #d63333;
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1 class="brand">kasam</h1>
    <div class="container">
        <h2>Edit User Details</h2>
        <p style="text-align: center; margin-bottom: 25px;">Modify user details below.</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/updateUserController" method="post">
            <!-- Hidden field to send user ID -->
            <input type="hidden" name="userId" value="<%= request.getAttribute("userId") != null ? request.getAttribute("userId") : "" %>">

            <div>
                <label>Username:</label>
                <input type="text" name="username" required 
                    value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>">
            </div>
            <div>
                <label>Email:</label>
                <input type="email" name="email" required
                    value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
            </div>
            <div>
                <label>Phone Number:</label>
                <input type="tel" name="phone" pattern="[0-9]{10}" title="Enter a 10-digit phone number" required
                    value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>">
            </div>
            <div>
                <label>Address:</label>
                <input type="text" name="address" required
                    value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>">
            </div>
            <div>
                <label>Role:</label>
                <select name="role" required>
                    <option value="">Select Role</option>
                    <option value="Customer" <%= "Customer".equals(request.getAttribute("role")) ? "selected" : "" %>>Customer</option>
                    <option value="Admin" <%= "Admin".equals(request.getAttribute("role")) ? "selected" : "" %>>Admin</option>
                </select>
            </div>
            <div>
                <label>Registered Date:</label>
                <input type="datetime-local" name="registeredDate" required
                    value="<%= request.getAttribute("registeredDate") != null ? request.getAttribute("registeredDate") : "" %>">
            </div>

            <!-- Password fields optional for editing. If you want admin to update password, keep these, else omit or leave blank -->
            <div>
                <label>Password:</label>
                <input type="password" name="password" placeholder="Leave blank to keep current password">
            </div>
            <div>
                <label>Confirm Password:</label>
                <input type="password" name="confirmPassword" placeholder="Leave blank to keep current password">
            </div>

            <div class="full-width">
                <button type="submit">Update User</button>
            </div>
        </form>

        <div class="login-link" style="margin-top:20px;">
            <a href="${pageContext.request.contextPath}/ViewUsersController">Back to Users List</a>
        </div>
    </div>
</body>
</html>
 