<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 - Access Denied</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unauthorized.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="lock-wrapper">
            <i class="fa-solid fa-lock-open shadow"></i>
            <i class="fa-solid fa-lock main-lock"></i>
        </div>
        <div class="text-content">
            <h1>403</h1>
            <h2>Access Denied</h2>
            <p>Oops! You don't have permission to view this page. <br> 
               Please check your credentials or head back home.</p>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/client/login" class="btn btn-primary">Login Now</a>
            <a href="${pageContext.request.contextPath}/client/home" class="btn btn-secondary">Go Home</a>
        </div>
    </div>
</body>
</html>