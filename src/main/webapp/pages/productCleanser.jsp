<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cleansers</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productsCategory.css"> 
</head>
<body>
	<%@ include file="header.jsp" %>
    <h1>Cleansers</h1>
    <div class="product-container">
        <div class="product-card">
        <a href='cleanser1.jsp'>
            <img src="../img/Anua Cleanser.png" alt="Anua Cleansing Foam" class="product-img">
        </a>
            <h3>Anua Heartleaf Cleanser</h3>
            <p>Soothes sensitive skin and controls oil.</p>
            <p class="price">Rs. 2000</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
        <a href='cleanser2.jsp'>
            <img src="../img/CosrX Cleanser.png" alt="COSRX Cleanser" class="product-img">
        </a>
            <h3>COSRX Low pH Gel Cleanser</h3>
            <p>Maintains pH and gently cleanses.</p>
            <p class="price">Rs. 3500</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
        <a href='cleanser3.jsp'>
            <img src="../img/Dot&Key Cleanser.png" alt="Dot & Key Cleanser" class="product-img">
        </a>
            <h3>Dot&Key Vitamin Gel Cleanser</h3>
            <p>Brightens dull skin and removes impurities.</p>
            <p class="price">Rs. 999</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
