<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int quantity = 1;
    String action = request.getParameter("action");
    String q = request.getParameter("quantity");
    if (q != null) {
        try { quantity = Integer.parseInt(q); } catch (NumberFormatException e) { quantity = 1; }
    }
    if ("increase".equals(action)) quantity++;
    else if ("decrease".equals(action) && quantity > 1) quantity--;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anua Cleanser</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/productDetails.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="product-wrapper">
        <img src="../img/Anua Cleanser.png" alt="Anua Cleanser" class="product-img">
        <div class="product-details">
            <h1>Anua Heartleaf Cleanser</h1>
            <p>Soothes skin and controls oil.</p>
            <p class="price">Rs. 2000</p>

            <form method="post" action="<%= request.getContextPath() %>/cart">
                <input type="hidden" name="productId" value="1"/>
                <input type="hidden" name="quantity" value="<%= quantity %>"/>
                <div class="quantity-selector">
                    <a href="cleanser1.jsp?action=deczrease&quantity=<%= quantity %>">–</a>
                    <input type="text" value="<%= quantity %>" readonly />
                    <a href="cleanser1.jsp?action=increase&quantity=<%= quantity %>">+</a>
                </div>
                <button type="submit" class="add-to-cart">Add to Cart</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
