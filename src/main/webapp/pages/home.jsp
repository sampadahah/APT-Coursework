<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/home.css">

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

	<section class="best-sellers">
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
