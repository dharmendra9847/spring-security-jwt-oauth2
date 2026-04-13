<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="background-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="login-card">
        <% if(request.getParameter("error") != null) { %>
            <div class="error-banner">
                <i class="fas fa-exclamation-circle"></i>
                Invalid Username or Password
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/doLogin" method="POST">
            <h3>Welcome Back</h3>
            
            <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" name="user" placeholder="Username" required>
                <span class="border-line"></span>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" name="pass" placeholder="Password" required>
                <span class="border-line"></span>
            </div>

            <div class="options">
                <label><input type="checkbox"> Remember Me</label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="login-btn">Login</button>

            <div class="signup-link">
                Don't have an account? <a href="${pageContext.request.contextPath}/client/signup">Sign Up</a>
            </div>
        </form>
    </div>
</body>
</html>