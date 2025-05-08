<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.aptcoursework.model.CartItem" %>
<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/cart.css">
</head>
<body>
<<<<<<< HEAD
<%@ include file="header.jsp" %>
=======
    <h1>Your Shopping Cart</h1>
    
    <!-- Check if the cart is empty -->
    <c:if test="${empty cartItems}">
        <p>Your cart is empty.</p>
        <a href="${pageContext.request.contextPath}/pages/productCategory.jsp">Continue Shopping</a>
    </c:if>
>>>>>>> 8a733a2264178bb8ea154ff9a59dc8efaafaff63

<div class="cart-container">
    <h2>Your Shopping Cart</h2>

    <% if (message != null) { %>
        <p class="empty-cart-message"><%= message %></p>
    <% } else if (cartItems != null && !cartItems.isEmpty()) { %>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Description</th>
                    <th>Price (Rs)</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <% double grandTotal = 0; %>
                <% for (CartItem item : cartItems) {
                    double total = item.getPrice() * item.getQuantity();
                    grandTotal += total;
                %>
                <tr>
                    <td><%= item.getProductName() %></td>
                    <td><%= item.getProductDescription() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td><%= total %></td>
                </tr>
                <% } %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" class="text-right"><strong>Grand Total:</strong></td>
                    <td><strong>Rs. <%= grandTotal %></strong></td>
                </tr>
            </tfoot>
        </table>
        <div class="checkout-btn">
            <form action="checkout.jsp" method="get">
                <button type="submit">Proceed to Checkout</button>
            </form>
        </div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
