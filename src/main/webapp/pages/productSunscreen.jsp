<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sunscreens</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productsCategory.css"> 
</head>
<body>
	<%@ include file="header.jsp" %>
    <h1>Sunscreens</h1>
    <div class="product-container">
        <div class="product-card">
            <img src="../img/Shadow Sunscreen.png" alt="Shadow Sunscreen" class="product-img">
            <h3>Fix Derma Shadow SPF 50+ Cream</h3>
            <p>Broad spectrum protection with a matte finish.</p>
            <p class="price">Rs. 980</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/Dot&Key Sunscreen.png" alt="Dot & Key Sunscreen" class="product-img">
            <h3>Dot&Key Blueberry SPF 50+ Sunscreen</h3>
            <p>Lightweight, hydrating, and antioxidant-rich.</p>
            <p class="price">Rs. 740</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/Raystop Sunscreen.png" alt="Raystop Sunscreen" class="product-img">
            <h3>Raystop SPF 50+++ Sunscreen Lotion</h3>
            <p>Strong UVA/UVB defense with skin brightening.</p>
            <p class="price">Rs. 1300</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
