<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String quantityParam = request.getParameter("quantity");
    Integer quantity = 1;
    if (quantityParam != null) {
        try {
            quantity = Integer.parseInt(quantityParam);
        } catch (NumberFormatException e) {
            quantity = 1;
        }
    }

    String action = request.getParameter("action");
    if ("increase".equals(action)) {
        quantity++;
    } else if ("decrease".equals(action) && quantity > 1) {
        quantity--;
    }

    request.setAttribute("quantity", quantity);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CosrX Cleanser</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productDetails.css"> 
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <div class="product-wrapper">
            <img src="../img/CosrX Cleanser.png" alt="CosrX Cleanser" class="product-img">
            <div class="product-details">
                <h1>COSRX Low pH Gel Cleanser</h1>
                <p>Maintains skin’s ideal pH while effectively removing excess oil and impurities; enriched with tea tree and natural surfactants for gentle care.</p>
                <p class="price">Rs. 1850</p>
               <form action="cleanser2.jsp" method="GET">
				    <div class="quantity-form">
				        <div class="quantity-selector">
				            <button type="submit" name="action" value="decrease" class="quantity-btn">–</button>
				            <input type="text" name="quantityDisplay" value="<%= quantity %>" readonly />
				            <input type="hidden" name="quantity" value="<%= quantity %>" />
				            <button type="submit" name="action" value="increase" class="quantity-btn">+</button>
				        </div>
				        <button class="add-to-cart">Add to Cart</button>
				    </div>
				</form>
            </div>
            </div>
        </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
