<%-- <!-- akiritisearchpageforakritiproductcode -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aptcoursework.controller.dao.ProductDAO" %>
<%@ page import="com.aptcoursework.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Products</title>
    <style>
        .product {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: 250px;
            float: left;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<h2>Search for Products</h2>
<form action="search.jsp" method="get">
    <input type="text" name="query" placeholder="Search by name or category" required>
    <button type="submit">Search</button>
</form>

<%
    String query = request.getParameter("query");
    if (query != null && !query.trim().isEmpty()) {
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = productDAO.getAllProducts();
            boolean found = false;

            for (Product p : products) {
                if (p.getName().toLowerCase().contains(query.toLowerCase()) ||
                    p.getCategory().toLowerCase().contains(query.toLowerCase())) {
                    found = true;
%>
    <div class="product">
        <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>" width="150" height="150">
        <h3><%= p.getName() %></h3>
        <p>Category: <%= p.getCategory() %></p>
        <p>Price: Rs <%= p.getPrice() %></p>
        <p>Quantity: <%= p.getQuantity() %></p>
        <button>Add to Cart</button>
    </div>
<%
                }
            }

            if (!found) {
%>
    <p>No products found matching "<%= query %>".</p>
<%
            }
        } catch (Exception e) {
            out.println("Error fetching products: " + e.getMessage());
        }
    }
%>

<%@ include file="footer.jsp" %>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aptcoursework.controller.dao.ProductDAO" %>
<%@ page import="com.aptcoursework.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @charset "UTF-8";
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            font-size: 20px;
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

        .product-card h3,
        .product-card p {
            color: #333;
            transition: color 0.3s;
            text-align: left;
            width: 100%;
        }
.product-card p {
    color: #333;
    transition: color 0.3s;
    text-align: left;
    width: 100%;
    font-weight: bold;
}


        .price {
            font-weight: bold;
            margin-top: 10px;
        }

        .add-to-cart {
            margin-top: 15px;
            font-size: 20px;
            color: #d63384;
            background: none;
            border: none;
            cursor: pointer;
            transition: color 0.3s;
        }

        .product-card:hover .add-to-cart {
            color: white;
        }
        

        .add-to-cart i {
            margin-right: 8px;
        }

        .no-results {
            text-align: center;
            margin-top: 50px;
            font-size: 20px;
            color: #999;
        }
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
    background-color: #d63384; /* Slightly deeper pink on hover */
    transform: scale(1.1);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <h1>Search Results</h1>

    <%
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            try {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.getAllProducts();
                boolean found = false;
    %>
    <div class="product-container">
    <%
                for (Product p : products) {
                    if (p.getProductName().toLowerCase().contains(query.toLowerCase())) {
                        found = true;
    %>
        <div class="product-card">
            <img src="img/default-product.png" alt="<%= p.getProductName() %>" class="product-img">
            <h3><%= p.getProductName() %></h3>
            <p>Stock: <%= p.getStockQuantity() %></p>
            <p class="price">Rs. <%= p.getPrice() %></p>
            <button class="add-to-cart" title="Add to Cart">
                <i class="fas fa-cart-plus"></i>
            </button>
        </div>
    <%
                    }
                }
    %>
    </div>
    <%
                if (!found) {
    %>
        <p class="no-results">No products found matching "<%= query %>"</p>
    <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>

    <%@ include file="footer.jsp" %>
</body>
</html>

 --%>