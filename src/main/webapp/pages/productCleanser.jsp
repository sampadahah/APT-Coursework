<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cleansers</title>
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
    <h1>Cleansers</h1>
    <div class="product-container">
        <div class="product-card">
        <a href='cleanser1.jsp'>
            <img src="../img/Anua Cleanser.png" alt="Anua Cleansing Foam" class="product-img">
        </a>
            <h3>Anua Heartleaf Cleanser</h3>
            <p>Soothes sensitive skin and controls oil.</p>
            <p class="price">Rs. 2000</p>
            <button class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
            <!-- <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button> -->
        </div>
        <div class="product-card">
        <a href='cleanser2.jsp'>
            <img src="../img/CosrX Cleanser.png" alt="COSRX Cleanser" class="product-img">
        </a>
            <h3>COSRX Low pH Gel Cleanser</h3>
            <p>Maintains pH and gently cleanses.</p>
            <p class="price">Rs. 3500</p>
            <button class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
            <!-- <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button> -->
        </div>
        <div class="product-card">
        <a href='cleanser3.jsp'>
            <img src="../img/Dot&Key Cleanser.png" alt="Dot & Key Cleanser" class="product-img">
        </a>
            <h3>Dot&Key Vitamin Gel Cleanser</h3>
            <p>Brightens dull skin and removes impurities.</p>
            <p class="price">Rs. 999</p>
            <button class="add-to-cart" title="Add to Cart">
    			<i class="fas fa-cart-plus"></i>
			</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
