<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/adminDashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
  	.search-bar {
 	 display: flex;
 	 align-items: center;
 	 background-color: #eee;
	 padding: 5px 10px;
	 border-radius: 8px;
 	 width: 400px;
 	 background-color: #ffe4ec;
  	 margin-left: 110px;
}
  	.custom-container {
  	display: flex;
 	 justify-content: center; /* Change from center to space-between */
 	 flex-wrap: wrap;
 	 max-width: 1000px; /* Limit width to center it and avoid excess spacing */
  	margin: 0 auto 40px;
 	 margin-top: 40px;
 	 gap: 50px; /* Optional: controls spacing between cards */
}
  	.top-margin {
  	margin-top: 40px;
	}
	
	.nav-bar a {
  	font-size: 24px;
  	color: #d63384;
  	font-weight: bold;
  	text-decoration: none;
	}

	.nav-bar {
	 background-color: ##fff; /* Optional: dark background for contrast */
  	 padding: 10px 20px;
}
	
    .card:hover {
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
      transition: all 0.3s ease-in-out;
      cursor: pointer;
    }

    .card:hover .custom-muted-uppercase a {
      color: #d63384;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .custom-muted-uppercase a {
      font-size: 30px;
      text-decoration: none;
      color: #6c757d;
    }

    .custom-muted-uppercase a:hover {
      color: #d63384;
    }
  </style>
</head>
<body>
  <header>
    <div class="header-top">
      <div class="brand-logo">KASAM</div>
      <div class="search-bar">
        <input type="text" placeholder="Search for products">
        <button><i class="fas fa-search"></i></button>
      </div>
      <div class="header-icons">
        <c:choose>
          <c:when test="${not empty sessionScope.userWithSession}">
            <a href="profile.jsp">Edit Profile</a>
            <a href="${pageContext.request.contextPath}/logoutController">Logout</a>
            <a href="#"><i class="far fa-heart"></i></a>
            <a href="#"><i class="fas fa-shopping-cart"></i></a>
          </c:when>
          <c:otherwise>
         	<a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
         	<a href="profile.jsp"><i class="fas fa-user"></i></a>
            <a href="login.jsp">Login</a> / <a href="register.jsp">Signup</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <nav class="nav-bar">
      <a href="#">WELCOME TO THE ADMIN PANEL</a>
    </nav>
  </header>

  <!-- First row -->
  <div class="custom-container top-margin">
    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
            <img style="max-width: 120px;" src="../img/user.png" alt="user-icon">
          </div>
          <h1 class="custom-muted-uppercase"><a href="viewUsers.jsp">USERS</a></h1>
          <p>Click to see all the users available in the system</p>
        </div>
      </div>
    </div>

    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
            <img style="max-width: 120px;" src="../img/apps.png" alt="user-icon">
          </div>
          <h1 class="custom-muted-uppercase"><a href="addCategory.jsp">ADD CATEGORY</a></h1>
          <p>Click to add a category of products into the system</p>
        </div>
      </div>
    </div>

    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
            <img style="max-width: 120px;" src="../img/shopping-bag.png" alt="user-icon">
          </div>
          <h1 class="custom-muted-uppercase"><a href="add_product.jsp">ADD PRODUCTS</a></h1>
          <p>Click to add new products into the system</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Second row -->
  <div class="custom-container">
    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
            <img style="max-width: 120px;" src="../img/user.png" alt="user-icon">
          </div>
          <h1>2343</h1>
          <h1 class="custom-muted-uppercase">Products</h1>
        </div>
      </div>
    </div>

    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
            <img style="max-width: 120px;" src="../img/user.png" alt="user-icon">
          </div>
          <h1>2343</h1>
          <h1 class="custom-muted-uppercase">Products</h1>
        </div>
      </div>
    </div>
  </div>

  <footer class="footer">
    <div class="footer-links">
      <div class="footer-column">
        <h4>Shop</h4>
        <ul>
          <li><a href="#">Cleanser</a></li>
          <li><a href="#">Toner</a></li>
          <li><a href="#">Serum</a></li>
          <li><a href="#">Moisturizer</a></li>
          <li><a href="#">Sunscreen</a></li>
          <li><a href="#">Lipcare</a></li>
        </ul>
      </div>
      <div class="footer-column">
        <h4>Learn</h4>
        <ul>
          <li><a href="#">Blogs</a></li>
          <li><a href="#">Features</a></li>
          <li><a href="#">Rewards</a></li>
          <li><a href="#">Newsletters</a></li>
        </ul>
      </div>
      <div class="footer-column">
        <h4>Help</h4>
        <ul>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">Policies</a></li>
          <li><a href="#">FAQs</a></li>
        </ul>
      </div>
      <div class="footer-column-right">
        <h3>KASAM, the promise to your skin.</h3>
        <p>Sign up for expert skincare tips and previews!</p>
        <div class="subscribe">
          <input type="email" placeholder="Your email">
          <button>Subscribe</button>
        </div>
        <div class="footer-icons">
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <span><i class="fas fa-phone"></i> 061-891045</span>
        </div>
      </div>
    </div>
    <div class="copyright">
      <p class="size">©2025 KASAM Skincare</p>
    </div>
  </footer>
</body>
</html>
