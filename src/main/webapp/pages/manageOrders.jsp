<%@ page import="java.util.List" %>
<%@ page import="com.aptcoursework.model.Order" %>
<%@ page import="com.aptcoursework.model.OrderItem" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/adminDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #bbb;
            padding: 10px;
            text-align: center;
            vertical-align: top;
        }
        th {
            background-color: #ffe4ec;
            color: #d63384;
        }
        h2 {
            text-align: center;
            color: #d63384;
            margin-top: 40px;
        }
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
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .back-button:hover {
            background-color: #c12374;
            text-decoration: none;
            box-shadow: 0 6px 10px rgba(0,0,0,0.15);
        }
        ul {
            list-style-type: none;
            padding-left: 0;
            margin: 0;
            text-align: left;
        }
        .order-items {
            max-width: 300px;
            margin: 0 auto;
        }
        .status-dropdown {
    padding: 8px 12px;
    border: 2px solid #d63384;
    border-radius: 8px;
    background-color: #ffe4ec;
    color: #d63384;
    font-weight: bold;
    font-family: Arial, sans-serif;
    transition: all 0.3s ease;
    cursor: pointer;
    margin: 5px 0;
}

.status-dropdown:hover {
    background-color: #fdd1e4;
    border-color: #c12374;
}

        
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<% if (request.getAttribute("message") != null) { %>
    <div style="color: green; text-align: center; margin: 20px;">
        <%= request.getAttribute("message") %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div style="color: red; text-align: center; margin: 20px;">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<h2>All Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>User ID</th>
        <th>Date</th>
        <th>Status</th>
        <th>Items (Product x Quantity)</th>
        <th>Total Price</th>
    </tr>
    <%
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
                double totalPrice = 0;
                for (OrderItem item : order.getItems()) {
                    totalPrice += item.getQuantity() * item.getPriceEach();
                }
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getUserId() %></td>
        <td><%= order.getOrderDate() %></td>
        <td>
            <form method="post" action="<%= request.getContextPath() %>/manageOrders">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>" />
                <select name="status" class="status-dropdown" onchange="this.form.submit()">
                    <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="Processing" <%= "Processing".equals(order.getStatus()) ? "selected" : "" %>>Processing</option>
                    <option value="Shipped" <%= "Shipped".equals(order.getStatus()) ? "selected" : "" %>>Shipped</option>
                    <option value="Delivered" <%= "Delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                    <option value="Cancelled" <%= "Cancelled".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                </select>
            </form>
        </td>
        <td class="order-items">
            <ul>
                <%
                    for (OrderItem item : order.getItems()) {
                %>
                <li><%= item.getProductName() %> x <%= item.getQuantity() %></li>
                <%
                    }
                %>
            </ul>
        </td>
        <td>Rs.<%= String.format("%.2f", totalPrice) %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="6">No orders found.</td>
    </tr>
    <% } %>
</table>

<div class="back-button-container">
    <a href="<%= request.getContextPath() %>/pages/adminDashboard.jsp" class="back-button">Back to Dashboard</a>
</div>

</body>
</html>
