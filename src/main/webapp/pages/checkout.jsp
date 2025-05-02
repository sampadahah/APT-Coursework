<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Checkout</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/checkout.css">
</head>
<body>
		<%@ include file="header.jsp" %>
<div class ="checkout-container">
	<div class ="user-info">
	<h3>PERSONAL INFORMATION</h3>
	<form action ="<%= request.getContextPath() %>/placeOrder" method="post">
		<label>Name:</label>
		<input type="text" name ="name" required>
		<label>Email:</label>
		<input type="text" name="email" required>
		<label>Phone:</label>
		<input type="text" name="phone" required>
		
		<h4>Shipping Address</h4>
		<label>Address:</label>
		<input type= "text"  name ="address" required>
		<label>City:</label>
		<input type="text" name="city" required>
	</form>
	</div>

<div class ="order-summary">
	<h3>ORDER SUMMARY</h3>
	<table>
		<tr>
		<th>Product</th>
		<th>Price</th>
		<th>Quantity</th>
		</tr>
	</table>
</div>
</div>
	<%@ include file ="footer.jsp" %>
</body>
</html>