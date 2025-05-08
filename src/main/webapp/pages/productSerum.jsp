<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Serums</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productsCategory.css"> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<style>
	.add-to-cart {
    position: absolute;
    right: 20px;
    bottom: 20px;
    background-color: #f5a9b8; /* Darker pastel pink for the circle */
    width: 50px; /* Increased size of the circle */
    height: 50px; /* Increased size of the circle */
    border: none;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    color: #ffffff; /* Lighter pink for the icon */
    font-size: 22px; /* Increased size of the icon */
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
}

.add-to-cart i {
	margin-top:3px;
	margin-left:5px;
    font-size: 22px; /* Increased size of the icon */
    line-height: 1;
}

.add-to-cart:hover {
    background-color: #f08f9f; /* Slightly deeper pink on hover */
    transform: scale(1.1);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

	</style>
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
            <button type="submit" class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
        </div>
        <div class="product-card">
            <img src="../img/Minimalist Serum.png" alt="Minimalist Serum" class="product-img">
            <h3>Minimalist Salicylic Acid Serum</h3>
            <p>Clears pores and reduces acne.</p>
            <p class="price">Rs. 890</p>
            <button type="submit" class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
        </div>
        <div class="product-card">
            <img src="../img/DermaCo Serum.png" alt="DermaCo Serum" class="product-img">
            <h3>DermaCo 2% Kojic Acid Face Serum</h3>
            <p>Reduces pigmentation and evens tone.</p>
            <p class="price">Rs. 700</p>
             <button type="submit" class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
