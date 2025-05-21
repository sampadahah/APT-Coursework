<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/home.css">
<style>
	.featured-products {
	  text-align: center;
	  padding: 2rem 0;
	}
	
	.featured-products h1 {
	  font-size: 2.5rem;
	  margin-bottom: 1rem;
	  font-weight: bold;
	  color: #d63384;
	}
	 .product-list {
	  display: flex;
	  justify-content: center;
	  flex-wrap: wrap;
	  gap: 20px;
	  padding: 20px;
	}

	
	.product {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 12px;
    padding: 16px;
    width: 250px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 330px;
}

.product img {
    width: 200px;
    height: 220px;
    object-fit: cover;
    border-radius: 8px;
    border: 2px solid  #f8f8f8; 
    box-shadow: 0 0 10px rgba(255,255,255);
    
    padding: 10px;
    margin-bottom: 10px;
    flex-shrink: 0;
}
.product img:hover {
     transform: scale(1.05);
     transition: transform 0.3s;
}
.product h3 {
    font-size: 16px;
    font-weight: bold;
    margin: 10px 0 5px 0;
    flex-grow: 1;
    color: #d63384;
}

.product p {
    font-size: 15px;
    font-weight: bold;
    color: #d63384;
    margin: 0;
}</style>

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
	      <a href="<%= request.getContextPath() %>/pages/productCategory.jsp">
		  <button>Shop by Category</button>
		</a>

	    </div>
	    <img src="${pageContext.request.contextPath}/img/bannerr.png" alt="Skincare">
	</section>

  	<section class="message">
	    <p><strong>Feel-good Skincare that’s clean, caring, and clinically tested.<br>Because your skin deserves better.</strong></p>
	    <h1>Top Brands</h1>
  	</section>

  	<section class="brands">
	  <div class="brand-list">
	    <div class="brand"><img src="${pageContext.request.contextPath}/img/cetaphil.png" alt="Cetaphil"></div>
	    <div class="brand"><img src="${pageContext.request.contextPath}/img/cerave.png" alt="CeraVe"></div>
	    <div class="brand"><img src="${pageContext.request.contextPath}/img/dermaco.png" alt="Derma Co"></div>
	    <div class="brand"><img src="${pageContext.request.contextPath}/img/anua.png" alt="Anua"></div>
	  </div>
	</section>

	<section class="featured-products">
	    <h1>Featured Products</h1>
	    <div class="product-list">
	        
            <c:if test="${not empty featuredProducts}">
                <c:forEach var="p" items="${featuredProducts}">
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/${p.imagePath}" alt="${p.name}" />
                        <div class="product-info">
				            <h3 class="product-name">${p.name}</h3>
				            <p class="product-price">Rs. ${p.price}</p>
				        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty featuredProducts}">
                <p>No featured products found.</p>
            </c:if>
        
	    </div>
	</section>

	<%@ include file="footer.jsp" %>
	
</body>
</html>