<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/login.css">
</head>
<body>
  <div class="brand">kasam</div>

  <div class="login-box">
    <h2>Login to your account</h2>
    <!-- Error Message Display -->
	<% if (request.getAttribute("errormessage")!=null){%>
	<div class="alert alert-danger mt-2">
		<%=request.getAttribute("errorMessage") %>
	</div>
	<% } %>
	<% if (request.getAttribute("loginError")!=null){%>
	<div class="alert alert-danger mt-2" style="text-align:center">
		<%=request.getAttribute("loginError") %>
	</div>
	<% } %>
    <form action="<%= request.getContextPath() %>/loginController" method="post">
      <input type="text" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
    <div class="signup-link">
      Don't have an account? <a href="register.jsp">Sign up</a>
    </div>
  </div>
</body>
</html>
