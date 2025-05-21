<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aptcoursework.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Category.css">
<!-- <style>
        @charset "UTF-8";
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            font-size: 50px;
            color: #d63384;
            margin-top: 30px;
        }

        .product-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
            padding: 60px;
        }

        .product-card {
            background-color: #ffe4ec;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 280px;
            padding: 20px;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-img {
            width: 240px;
            height: 240px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
            display: block;
            border: 2px solid #f8cce0;
            box-shadow: 0 0 10px rgba(248, 204, 224, 0.6);
            transition: transform 0.3s;
        }

        .product-img:hover {
            transform: scale(1.05);
        }

		.product-card h3 {
		    color: #333;
		    transition: color 0.3s;
		    text-align: left;
		    width: 100%;
		    font-weight: bold;
		}
		
		.product-card p {
		    color: #333;
		    transition: color 0.3s;
		    text-align: left;
		    width: 100%;
		}


        .price {
            font-weight: bold;
            margin-top: 10px;
        }

		.add-to-cart {
		  position: absolute;
		  bottom: 15px;
		  right: 20px;
		  width: 50px;
		  height: 50px;
		  background-color: #d63384;
		  color: #fff;
		  border: none;
		  border-radius: 50%;
		  font-size: 22px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  transition: transform 0.2s ease, box-shadow 0.2s ease;
			}

		.add-to-cart:hover {
		  transform: scale(1.1);
		  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
		  }
		  
		 .no-results {
		  text-align: center;
		  margin-top: 50px;
		  font-size: 20px;
		  color: #999;
		        }
		        
		 .product-description {
		  font-size: 13px;
		  line-height: 1;
		  flex-grow: 1;
		  margin-bottom: 10px;
		  overflow-wrap: break-word;
		}
		
    </style>
     -->
    
</head>
<body>
<%@ include file="header.jsp" %>

<h1>Search Results</h1>

<%
    String query = (String) request.getAttribute("query");
    List<Product> matchedProducts = (List<Product>) request.getAttribute("matchedProducts");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<% if (errorMessage != null) { %>
    <p class="no-results"><%= errorMessage %></p>
<% } else if (matchedProducts != null && !matchedProducts.isEmpty()) { %>
    <div class="product-container">
        <% for (Product p : matchedProducts) { %>
            <div class="product-card">
                <%-- <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>" class="product-img"> --%>
                <a href="<%= request.getContextPath() %>/productDetails?productId=<%= p.getId() %>">
    				<img src="<%= request.getContextPath() + p.getImagePath() %>" alt="<%= p.getName() %>" class="product-img">
				</a>
                <h3><%= p.getName() %></h3>
                <p class="product-description"><%= p.getDescription() %></p>
                <p class="price">Rs. <%= p.getPrice() %></p>
<!--                 <button class="add-to-cart" title="Add to Cart">
                    <i class="fas fa-cart-plus"></i>
                </button> -->
                 <form action="addToCart" method="post">
				    <input type="hidden" name="product_id" value="<%= p.getId() %>"/>
				    <input type="hidden" name="quantity" value="1"/>
				    <button type="submit" class="add-to-cart" title="Add to Cart">
				        <i class="fas fa-cart-plus"></i> 
				    </button>
				</form>
            </div>
        <% } %>
    </div>
<% } else { %>
    <p class="no-results">No products found matching "<%= query %>"</p>
<% } %>

<%@ include file="footer.jsp" %>
</body>
</html>

