<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
	   <div class="header-top">
	    <div class="brand-logo">kasam</div>
	    </div>
	
	  <nav class="nav-bar">
	    <a href="dashboard.jsp">Dashboard</a>
	    <a href="#">Category</a>
	    <a href="#">Product</a>
	    <a href="${pageContext.request.contextPath}/logoutController" method="get" style="display:inline;">Logout</a> 
	  </nav>
	</header>
		
</body>
</html>