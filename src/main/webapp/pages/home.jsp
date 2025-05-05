<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/home.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<section class="promo-banner-container">
	  <div class="promo-banner">
	    <div class="promo-text">
	      <h2>Introducing KASAM Skincare<br>Where Beauty Meets Wellness</h2>
	      <button onclick="location.href='product.jsp'">Shop by Category</button>
	    </div>
	    <img src="../img/banner.png" alt="Promo Printer">
	  </div>
	</section>


  	<section class="message">
	    <p><strong>Feel-good Skincare that’s clean, caring, and clinically tested.<br>Because your skin deserves better.</strong></p>
	    <h1>Top Brands</h1>
  	</section>

  	<section class="brands">
	    <img src="../img/cetaphil.png" alt="Cetaphil">
	    <img src="../img/cerave.png" alt="CeraVe">
	    <img src="../img/dermaco.png" alt="Derma Co">
	    <img src="../img/anua.png" alt="Anua">
	</section>
	
	<section class="best-sellers">
	    
	    <h1>Best Sellers</h1>
	    <div class="product-list">
		    <div class="product">
		      <img src="cleanser.png" alt="Gentle Touch Cleanser">
		      <p>Gentle Touch Cleanser<br>Rs 2,300</p>
		      
		    </div>
		    <div class="product">
		      <img src="moisturiser.png" alt="Cetaphil Moisturiser">
		      <p>Cetaphil Moisturiser<br>Rs 3,000</p>
		      
		    </div>
		    <div class="product">
		      <img src="cleanser.png" alt="Gentle Touch Cleanser">
		      <p>Gentle Touch Cleanser<br>Rs 2,300</p>
		      
		    </div>
		    <div class="product">
		      <img src="moisturiser.png" alt="Cetaphil Moisturiser">
		      <p>Cetaphil Moisturiser<br>Rs 3,000</p>
		      
		    </div>
		    
	 	 </div>
	</section>
  	
	
	<%@ include file="footer.jsp" %>
</body>
</html>