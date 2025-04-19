<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/register.css">
</head>
<body>
	  <h1 class="brand">kasam</h1>
	  <div class="container">
	  <h2>Create a New Account</h2>
	  <p style="text-align: center; margin-bottom: 25px;">It’s quick and easy – just like your skincare routine.</p>
	  <form action="../loginController" method="post">
	    <div>
	      <label>Username:</label>
	      <input type="text" name="username">
	    </div>
	    <div>
	      <label>Email:</label>
	      <input type="email" name="email">
	    </div>
	    <div>
	      <label>Phone Number:</label>
	      <input type="text" name="phone">
	    </div>
	    <div>
	      <label>Address:</label>
	      <input type="text" name="address">
	    </div>
	    <div>
	      <label>Role:</label>
	      <select name="role">
	        <option>Customer</option>
	        <option>Admin</option>
	      </select>
	    </div>
	    <div>
 	 		<label>Registered Date:</label>
  			<input type="datetime-local" name="registeredDate" required>
		</div>
	    <div>
	      <label>Password:</label>
	      <input type="password" name="password">
	    </div>
	    <div>
	      <label>Confirm Password:</label>
	      <input type="password" name="confirmPassword">
	    </div>
	    <div class="full-width">
	      <button type="signup">Sign Up</button>
	    </div>
	    <div class="login-link">
			<a href="login.jsp">Already have an account?</a>
    	</div>
	  </form>
	</div>
</body>
</html>
