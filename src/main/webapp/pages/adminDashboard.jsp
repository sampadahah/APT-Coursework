<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.aptcoursework.controller.dao.UserDAO" %>
<%@ page import="com.aptcoursework.controller.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<%
    int totalUsers = 0;
    int totalProducts = 0;

    try {
        UserDAO userDAO = new UserDAO();
        ProductDAO productDAO = new ProductDAO();

        totalUsers = userDAO.getAllUsers().size();
        totalProducts = productDAO.getAllProducts().size();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/adminDashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
  .card.no-hover:hover {
  box-shadow: none; /* Remove hover shadow */
  transform: none; /* Remove hover transform */
  cursor: default; /* Remove pointer cursor */
}
  	.card {
  border: 2px solid #f8c6d8; /* Soft pink border */
  border-radius: 12px;
  transition: box-shadow 0.3s ease, transform 0.3s ease;
}
  	.card-body p {
  	color: #6c757d; /* Bootstrap-like muted gray */
 	font-size: 16px;
  	margin-top: 10px;
}
  	
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
	
/* 	.nav-bar a {
  	font-size: 24px;
  	color: #d63384;
  	font-weight: bold;
  	text-decoration: none;
  	margin-left: 70px;
	}

	.nav-bar {
	 background-color: ##fff; /* Optional: dark background for contrast */
  	 padding: 10px 20px;
  	  justify-content: center;
} */
	
    .card:hover {
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
      transition: all 0.3s ease-in-out;
      cursor: pointer;
      border-color: #d63384; /* Brighter pink on hover */
 	  box-shadow: 0 6px 12px rgba(214, 51, 132, 0.3);
    }

    .card:hover .custom-muted-uppercase a {
      color: #d63384;
      text-decoration: none;
      transition: color 0.3s ease;
      
    }

.custom-muted-uppercase a {
  font-size: 30px;
  text-decoration: none;
  color: #d63384;
  font-weight: bold;
}

.custom-muted-uppercase a:hover {
  color: #c12374;
}
    }
    .logout-form {
  display: inline;
}

.logout-button {
  background-color: #d63384;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 6px;
  font-weight: bold;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  font-family: Arial, sans-serif;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.logout-button:hover {
  background-color: #c12374;
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

.user-icon i {
  color: #d63384; /* Pink color matching your theme */
  font-size: 20px; /* Optional: adjust size */
  transition: color 0.3s ease;
}

.user-icon i:hover {
  color: #c12374; /* Slightly darker pink on hover */
  
  /* Remove hover effect for summary cards */
}

/* Summary cards container */
.summary-row {
  margin-top: 30px;
  display: flex;
  justify-content: space-around;
}

/* individual summary card styling */
.summary-card {
  flex: 1;
  margin: 10px;
  padding: 20px;
  text-align: center;
  height: 110px;
}

/* summary number text */
.summary-count {
  font-size: 24px;
  font-weight: bold;
}

/* update color of h2 inside summary cards */
.summary-card h2 {
  color: #d63384;


  </style>
</head>
<body>
<%@ include file="header.jsp" %>
  

<!-- Summary cards row -->
<div class="custom-container summary-row">
    <div class="card no-hover summary-card">
        <h2>TOTAL USERS</h2>
        <p class="summary-count"><%= totalUsers %></p>
    </div>

    <div class="card no-hover summary-card">
        <h2>TOTAL PRODUCTS</h2>
        <p class="summary-count"><%= totalProducts %></p>
    </div>
</div>



  <!-- First row -->
  <div class="custom-container top-margin">
    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
             <a href="viewUsers.jsp">
        		<i class="fas fa-user fa-5x" style="color:#d63384;"></i>
   			 </a>
          </div>
          <h1 class="custom-muted-uppercase"><a href="viewUsers.jsp">USERS</a>
          </h1>
          <p>Click to see all the users available in the system</p>
        </div>
      </div>
    </div>

    <div class="card-column">
      <div class="card">
        <div class="card-body">
          <div class="container">
          <a href="addCategory.jsp">
            <i class="fas fa-layer-group fa-5x" style="color:#d63384;"></i>
           </a>
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
          	<a href="add_product.jsp">
            	<i class="fas fa-bag-shopping fa-5x" style="color:#d63384;"></i>
            </a>
          </div>
          <h1 class="custom-muted-uppercase"><a href="add_product.jsp">ADD PRODUCTS</a></h1>
          <p>Click to add new products into the system</p>
        </div>
      </div>
    </div>
  </div>

<!--   Second row -->
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
  <%@ include file="footer.jsp" %>
</body>
</html>
