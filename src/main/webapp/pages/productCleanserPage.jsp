<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cleansers</title>
</head>
  <style>
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
            transition: transform 0.3s, background-color 0.3s;
            position: relative;
        }

        .product-card:hover {
            transform: scale(1.05);
            background-color: #d63384;
        }

        .product-card h3,
        .product-card p {
            color: #333;
            transition: color 0.3s;
        }

        .product-card:hover h3,
        .product-card:hover p {
            color: white;
        }

        .product-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .price {
            font-weight: bold;
            margin-top: 10px;
        }

        .product-card:hover .price {
            color: white;
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
    </style>
</head>
<body>

    <h1>Cleansers</h1>
    <div class="product-container">
        <div class="product-card">
            <img src="images/cleanser1.jpg" alt="Gentle Foaming Cleanser" class="product-img">
            <h3>Gentle Foaming Cleanser</h3>
            <p>Perfect for daily use and sensitive skin.</p>
            <p class="price">$14.99</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="images/cleanser2.jpg" alt="Hydrating Gel Cleanser" class="product-img">
            <h3>Hydrating Gel Cleanser</h3>
            <p>Infused with aloe and cucumber extract.</p>
            <p class="price">$18.50</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="images/cleanser3.jpg" alt="Deep Pore Cleanser" class="product-img">
            <h3>Deep Pore Cleanser</h3>
            <p>Removes impurities and unclogs pores.</p>
            <p class="price">$16.75</p>
            <button class="add-to-cart"><i class="fas fa-cart-plus"></i>Add to Cart</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>