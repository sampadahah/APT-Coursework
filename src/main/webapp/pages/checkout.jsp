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
	
	<div class="checkout-container">
		<div class="user-info">
			<h3>SHIPPING ADDRESS</h3>
			<form action ="<%= request.getContextPath() %>/placeOrder" method="post">
				<label>Address:</label>
				<input type="text" name="address" required>
				
				<label>Town/City:</label>
				<input type="text" name="towncity" required>

				<label>Street No:</label>
				<input type="text" name="streetnumber" required>

				<h4>Payment Method</h4>
				<label>
					<input type="radio" name="paymentMethod" value="COD" checked> Cash on Delivery
				</label><br>
				<label>
					<input type="radio" name="paymentMethod" value="Banking"> Banking
				</label><br><br>


			</form>
		</div>

		<div class="order-summary">
			<h3>ORDER SUMMARY</h3>
			<table>
				<tr>
					<th>Product</th>
					<th>Price</th>
					<th>Quantity</th>
				</tr>
				<!-- Product rows will be dynamically added here -->
			</table>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>
</html>
