<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page session="true" %>
<%
	String role = (String) session.getAttribute("role");
	String username = (String) session.getAttribute("username");
	String email = (String) session.getAttribute("email");
	String phone = String.valueOf(session.getAttribute("phone"));  // Use phone_no as set in servlet
	String address = (String) session.getAttribute("address");
    
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>


<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/profile.css">
</head>
<body>
	<%@ include file="header.jsp" %>

<div class="profile-box">
    <h2>Welcome, <%= role %></h2>
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
     <% if (successMessage!=null){%>
	<div class="success" style="text-align:center">
		<%=request.getAttribute("successMessage") %>
	</div>
	<% } %>
	 <% if (errorMessage!=null){%>
	<div class="error" style="text-align:center">
		<%=request.getAttribute("errorMessage") %>
	</div>
	<% } %>
</div>

</body>
</html>
