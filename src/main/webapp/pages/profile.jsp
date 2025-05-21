<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    String phone = String.valueOf(session.getAttribute("phone_no"));  
    String address = (String) session.getAttribute("address");

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/profile.css">
    <style>
        .back-button-container {
            text-align: center;
            margin: 30px 0;
        }

        .back-button {
            display: inline-block;
            padding: 12px 25px;
            background-color: #d63384;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background-color: #c12374;
            text-decoration: none;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>

<div class="profile-box">
    <h2>Your Profile</h2>
    <form action="<%= request.getContextPath() %>/profileController" method="post">
        <input type="hidden" name="_method" value="PUT">

        Username:<br>
        <input type="text" name="username" value="<%= username %>" required><br>

        Email:<br>
        <input type="email" name="email" value="<%= email %>" required><br>

        Phone Number:<br>
        <input type="text" name="phone" value="<%= phone %>" required><br>

        Address:<br>
        <input type="text" name="address" value="<%= address %>" required><br><br>

        <input type="submit" value="Save Changes">
    </form>

    <% if (successMessage != null) { %>
        <div class="success" style="text-align:center">
            <%= successMessage %>
        </div>
    <% } %>

    <% if (errorMessage != null) { %>
        <div class="error" style="text-align:center">
            <%= errorMessage %>
        </div>
    <% } %>
</div>

<c:if test="${sessionScope.userWithSession.role == 'Admin'}">
    <div class="back-button-container">
        <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp" class="back-button">
            &#8592; Back to Dashboard
        </a>
    </div>
</c:if>

</body>
</html>
