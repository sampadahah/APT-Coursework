<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Initialize quantity to 1 if not already set
    Integer quantity = (Integer) request.getAttribute("quantity");
    if (quantity == null) quantity = 1;

    // Get action from the form (increase or decrease)
    String action = request.getParameter("action");
    if ("increase".equals(action)) {
        quantity+=1;
    } else if ("decrease".equals(action) && quantity > 1) {
        quantity--;
    }
    
    // Set the updated quantity in the request for next page load
    request.setAttribute("quantity", quantity);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dot&Key Cleanser</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/productDetails.css"> 
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
        <div class="product-wrapper">
            <img src="../img/Dot&Key Cleanser.png" alt="Dot & Key Cleanser" class="product-img">
            <div class="product-details">
                <h1>Dot&Key Vitamin Gel Cleanser</h1>
                    <p>Brightens complexion and gently exfoliates with Vitamin C and E, while cleansing out dirt to reveal refreshed, glowing skin.</p>
                <p class="price">Rs. 750</p>
                <form action="cleanser3.jsp" method="GET">
                    <div class="quantity-selector">
                        <button type="submit" name="action" value="decrease">–</button>
                        <input 
                            type="text" 
                            name="quantity" 
                            value="<%= quantity %>" 
                            readonly 
                        />
                        <button type="submit" name="action" value="increase">+</button>
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            </div>
        </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
