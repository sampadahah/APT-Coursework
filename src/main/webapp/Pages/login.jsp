<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/login.css">
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h1 id="title">Log In </h1>
            <div id="error_message">
                <%= request.getAttribute("loginError") != null ? request.getAttribute("loginError") : "" %>
            </div>
            <form action="<%= request.getContextPath() %>/loginController" method="POST">
                <div class="input-group">
                    <div class="input-field">
                        <input type="email" id="email" name="email" placeholder="Email" required>
                    </div>

                    <div class="input-field">
                        <input type="password" id="password" name="password" placeholder="Password" required>
                    </div>
                    <p>Forgot password? <a href="#">Click Here!</a></p>
                </div>
                <div>
                    <button type="submit" class="btn">Log in</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
