<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<section class="hero">
	    <h2>Introducing KASAM Skincare<br>Where Beauty Meets Wellness</h2>
	    <button>Shop Now</button>
	    <img src="hero-products.png" alt="Skincare Products">
  	</section>

  	<section class="message">
	    <p><strong>Feel-good skincare</strong> that’s clean, caring, and clinically tested.<br>Because your skin deserves better.</p>
	    <button>Top Brands</button>
  	</section>

  	<section class="brands">
	    <img src="cetaphil-logo.png" alt="Cetaphil">
	    <img src="himalaya-logo.png" alt="Himalaya">
	    <img src="mamaearth-logo.png" alt="Mamaearth">
	    <img src="nivea-logo.png" alt="Nivea">
	</section>
	
	<section class="featured-products">
    <div class="product">
      <img src="cleanser.png" alt="Gentle Touch Cleanser">
      <p>Gentle Touch Cleanser<br>Rs 2,300</p>
      <button><i class="fas fa-cart-plus"></i> Add To Cart</button>
    </div>
    <div class="product">
      <img src="moisturiser.png" alt="Cetaphil Moisturiser">
      <p>Cetaphil Moisturiser<br>Rs 3,000</p>
      <button><i class="fas fa-cart-plus"></i> Add To Cart</button>
    </div>
    <div class="product">
      <img src="serum.png" alt="Pure Glow Serum">
      <p>Pure Glow Serum<br>Rs 3,500</p>
      <button><i class="fas fa-cart-plus"></i> Add To Cart</button>
    </div>
    <div class="product">
      <img src="sunscreen.png" alt="Himalayan Sunscreen">
      <p>Himalayan Sunscreen<br>Rs 2,800</p>
      <button> Add To Cart</button>
    </div>
  </section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>