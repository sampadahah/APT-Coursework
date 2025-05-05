<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empty Cart</title>
</head>
<body>
	<%@ include file ="header.jsp" %>
	
	<div style ="text-align:center; padding:50px;">
	<h2><%= request.getAttribute("message") %></h2>
	<a href ="<%= request.getContextPath() %>/ product.jsp"> Go Back to Product</a>
	
	</div>
	
	<%@ include file ="footer.jsp" %>

</body>
</html>