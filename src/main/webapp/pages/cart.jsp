<%@ page language="java" import="java.util.List, java.util.Map" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/cart.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="main-content-wrapper">
        <%
            List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");
            String orderMessage = (String) session.getAttribute("orderMessage");
            if (orderMessage != null) {
        %>
            <div class="order-success-message">
                <h2><%= orderMessage %></h2>
            </div>
            <%
                session.removeAttribute("orderMessage");
            }
        %>

        <% if (cartItems == null || cartItems.isEmpty()) { %>
            <div class="empty-cart">
                <h2>No Products in the cart.</h2>
                <p><a href="productCategory.jsp" class="return-btn">Return to Shop</a></p>
            </div>
        <% } else { %>
            <div class="checkout-container">
                <div class="user-info">
                    <h3>Shipping Address</h3>
                    <form action="<%= request.getContextPath() %>/placeOrder" method="post">
                        <label>Address: <input type="text" name="address" required></label><br>
                        <label>Town/City: <input type="text" name="towncity" required></label><br>
                        <label>Street No: <input type="text" name="streetnumber" required></label><br><br>
                        <h4>Payment Method</h4>
                        <label><input type="radio" name="paymentMethod" value="COD" checked> Cash on Delivery</label><br>
                        <label><input type="radio" name="paymentMethod" value="Banking"> Banking</label><br><br>
                        <button type="submit" class="checkout-btn">Place Order</button>
                    </form>
                </div>

                <div class="order-summary">
                    <h3>Order Summary</h3>
                    <table>
                        <tr>
                            <th>Image</th><th>Product</th><th>Price</th><th>Quantity</th><th>Total</th>
                        </tr>
                        <%
                            double subtotal = 0.0;
                            for (Map<String, Object> item : cartItems) {
                                String name = (String) item.get("name");
                                double price = (Double) item.get("price");
                                int quantity = (Integer) item.get("quantity");
                                double itemTotal = price * quantity;
                                subtotal += itemTotal;
                                String imagePath = (String) item.get("image");
                        %>
                        <tr>
                            <td><img src="<%= imagePath %>" alt="Product Image" class="product-img"></td>
                            <td><%= name %></td><td><%= price %></td><td><%= quantity %></td><td><%= itemTotal %></td>
                        </tr>
                        <% } %>
                    </table>
                    <%
                        double deliveryCharge = 150.0;
                        double total = subtotal + deliveryCharge;
                    %>
                    <div class="order-summary-totals">
                        <p>Subtotal: <%= subtotal %></p>
                        <p>Delivery Charge: <%= deliveryCharge %></p>
                        <p><strong>Total: <%= total %></strong></p>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
