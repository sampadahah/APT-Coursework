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

	  <section class="promo-banner">
	    <div class="promo-text">
	      <h1 style="font-size:40px;">Introducing KASAM Skincare<br>Where Beauty Meets Wellness</h1>
	      <p>More than skincare — it’s self-care.<br>
			KASAM blends science and nature<br>
			to bring you radiant, healthy skin.<br>
			Your skin deserves nothing less.</p>
	      <button onclick="location.href='productCategory.jsp'">Shop by Category</button>
	    </div>
	    <img src="../img/bannerr.png" alt="Skincare">
	</section>


  	<section class="message">
	    <p><strong>Feel-good Skincare that’s clean, caring, and clinically tested.<br>Because your skin deserves better.</strong></p>
	    <h1>Top Brands</h1>
  	</section>

  	<section class="brands">
  <div class="brand-list">
    <div class="brand">
      <img src="../img/cetaphil.png" alt="Cetaphil">
    </div>
    <div class="brand">
      <img src="../img/cerave.png" alt="CeraVe">
    </div>
    <div class="brand">
      <img src="../img/dermaco.png" alt="Derma Co">
    </div>
    <div class="brand">
      <img src="../img/anua.png" alt="Anua">
    </div>
  </div>
</section>

	
	<section class="best-sellers">
	    
	    <h1>Best Sellers</h1>
	    <div class="product-list">
		    <div class="product">
			  <a href="productCleanser.jsp">
			    <img src="../img/CosrX Cleanser.png" alt="CosrX Low pH Gel Cleanser">
			  </a>
			  <div class="skin-type">For Normal to Dry Skin</div>
			  <p>CosrX Low pH Gel Cleanser</p>
			</div>

		    <div class="product">
			  <a href="productMoisturizer.jsp">
			     <img src="../img/CeraVe Moisturizer.png" alt="CeraVe Daily Moisturizing Lotion">
		      </a>
		      <div class="skin-type">For Normal to Oily Skin</div>
		      <p>CeraVe Daily Moisturizing Lotion</p>
		      
		    </div>
		    <div class="product">
			    <a href="productSerum.jsp">
			      <img src="../img/Plum Serum.png" alt="Plum Mandarin + Vitamin C Serum">
			    </a>
		      <div class="skin-type">For All Skin Types</div>
		      <p>Plum Mandarin + Vitamin C Serum</p>
		      
		    </div>
		    <div class="product">
			    <a href="productSunscreen.jsp">
			      <img src="../img/Dot&Key Sunscreen.png" alt="Dot&Key Blueberry SPF 50+ Sunscreen">
			    </a>
		      <div class="skin-type">For All Skin Types</div>
		      <p>Dot&Key Blueberry SPF 50+ Sunscreen</p>
		      
		    </div>
		    
	 	 </div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>