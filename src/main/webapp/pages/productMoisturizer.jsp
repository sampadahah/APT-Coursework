<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Moisturizers</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productsCategory.css"> 
</head>
</head>
<body>
	<%@ include file="header.jsp" %>
    <h1>Moisturizers</h1>
    <div class="product-container">
        <div class="product-card">
            <img src="../img/Kleida Moisturizer.png" alt="Kleida Moisturizer" class="product-img">
            <h3>Kleida Skin Lightening Moisturizer</h3>
            <p>Evens skin tone and hydrates deeply.</p>
            <p class="price">Rs. 1100</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/CeraVe Moisturizer.png" alt="CeraVe Moisturizer" class="product-img">
            <h3>CeraVe Daily Moisturizing Lotion</h3>
            <p>Restores skin barrier and locks in moisture.</p>
            <p class="price">Rs. 1900</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="../img/Aqualogica Moisturizer.png" alt="Aqualogica Moisturizer" class="product-img">
            <h3>Aqualogica Illuminate Oil-Free Moisturizer</h3>
            <p>Hydrates skin without clogging pores.</p>
            <p class="price">Rs. 650</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
