<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Serums</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productsCategory.css"> 
</head>
<body>
	<%@ include file="header.jsp" %>
    <h1>Serums</h1>
    <div class="product-container">
        <div class="product-card">
            <img src="../img/Plum Serum.png" alt="Plum Serum" class="product-img">
            <h3>Plum Mandarin + Vitamin C Serum</h3>
            <p>Brightens skin and fades dark spots.</p>
            <p class="price">Rs. 1200</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/Minimalist Serum.png" alt="Minimalist Serum" class="product-img">
            <h3>Minimalist Salicylic Acid Serum</h3>
            <p>Clears pores and reduces acne.</p>
            <p class="price">Rs. 890</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/DermaCo Serum.png" alt="DermaCo Serum" class="product-img">
            <h3>DermaCo 2% Kojic Acid Face Serum</h3>
            <p>Reduces pigmentation and evens tone.</p>
            <p class="price">Rs. 700</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
