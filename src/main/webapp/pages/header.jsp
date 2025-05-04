<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.aptcoursework.model.user" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
.header-btn {
  display: flex;
  align-items: center;
  color: #d63384; /* Pink color */
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  gap: 5px; /* Add space between icon and text */
  transition: color 0.3s ease;
}

.header-btn:hover {
  color: #c12374; /* Slightly darker pink on hover */
}

.header-btn i {
  font-size: 18px; /* Icon size */
}

.header-icons i {
  color: #d63384; /* Pink color matching your theme */
  font-size: 20px; /* Optional: adjust size */
  transition: color 0.3s ease;
}

.header-icons i:hover {
  color: #c12374; /* Slightly darker pink on hover */
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
.header-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 40px;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}

.brand-logo {
  font-weight: bold;
  font-size: 24px;
  color: #d63384;
}

.search-bar {
  display: flex;
  align-items: center;
  background-color: #eee;
  padding: 5px 10px;
  border-radius: 8px;
  width: 400px;
  background-color: #ffe4ec;
  margin-left:270px;
}

.search-bar input {
  border: none;
  background: none;
  outline: none;
  width: 100%;
  padding: 8px;
}

.search-bar button {
  background: none;
  border: none;
  cursor: pointer;
  font-size: 18px;
}

.header-icons {
  display: flex;
  align-items: center;
  gap: 20px;
  font-size: 20px;
}

.header-icons a {
  color: #333;
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 5px;
  font-size: 16px;
}

.nav-bar {
  background-color: #ddd;
  display: flex;
  justify-content: center;
  padding: 10px 0;
  gap: 40px;
  background-color:#ffe4ec;
}

.nav-bar a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
}

.nav-bar a:hover {
  color: #d63384;
}
.header-icons a:hover{
  color: #d63384;

}

.auth-button {
  background-color: #d63384; /* Pink color */
  color: white; /* Text color set to white */
  border: none;
  padding: 8px 15px;
  border-radius: 6px;
  font-weight: bold;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  font-family: 'Arial', sans-serif;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.auth-button:hover {
  background-color: #c12374; /* Slightly darker pink on hover */
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

.auth-button i {
  font-size: 18px; /* Icon size */
  color: white; /* Icon color set to white */
}

.auth-button span {
  color: white; /* Text color set to white for login/signup */
  font-size: 16px; /* Optional: adjust font size */
}



</style>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
	  <div class="header-top">
	    <div class="brand-logo">kasam</div>
	
	    <div class="search-bar">
	      <input type="text" placeholder="Search for products">
	      <button><i class="fas fa-search"></i></button>
	    </div>
	
	    <div class="header-icons">
	    	<c:choose>
	    		<c:when test="${not empty sessionScope.userWithSession}">
	      			<!-- User is logged in -->
	     			<a href="profile.jsp">Edit Profile</a>
	      			<a href="${pageContext.request.contextPath}/logoutController" method="get" style="display:inline;">Logout</a>
	      			<a href="#"><i class="fas fa-shopping-cart"></i></a>
	      			<a href="#"><i class="fas fa-shopping-cart"></i></a>
	   	 		</c:when>
			    <c:otherwise>
			      <!-- User is NOT logged in -->
			      <a href="profile.jsp" class="user-icon"><i class="fas fa-user"></i></a>
			      <a href="#"><i class="fas fa-shopping-cart"></i></a>
				  <form action="login.jsp" method="get" class="logout-form">
  					<button type="submit" class="auth-button">
   					 <i class="fas fa-sign-in-alt"></i> <span>Login</span>
  					</button>
				  </form>

				   <form action="register.jsp" method="get" class="logout-form">
  						<button type="submit" class="auth-button">
    						<i class="fas fa-user-plus"></i> <span>Signup</span>
  						</button>
				   </form>


			      <!-- <a href="login.jsp">Login</a> / <a href="register.jsp">Signup</a> -->
			      
			    </c:otherwise>
	  		</c:choose>
	    </div>
	  </div>
	
	  <nav class="nav-bar">
	    <a href="home.jsp">Home</a>
	    <a href="productCategory.jsp">Products</a>
	    <a href="#">Blog</a>
	    <a href="#">About Us</a>
	  </nav>
	</header>
		
</body>
</html>