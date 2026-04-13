<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">
</head>
<body>
    <div class="signup-container">
        <form action="${pageContext.request.contextPath}/client/register" method="POST" class="signup-form">
            <h2>Create Account</h2>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter Username" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required>
            </div>

            <div class="input-group">
                <label for="role">Assign Role</label>
                <select id="role" name="role" required>
                    <option value="" disabled selected>Select a role</option>
                    <option value="ROLE_USER">User</option>
                    <option value="ROLE_ADMIN">Admin</option>
                    <option value="ROLE_MANAGER">Manager</option>
                </select>
            </div>

            <button type="submit" class="register-btn">Register</button>
            
            <div class="footer-link">
                Already have an account? <a href="${pageContext.request.contextPath}/client/login">Login here</a>
            </div>
        </form>
    </div>
</body>
</html>