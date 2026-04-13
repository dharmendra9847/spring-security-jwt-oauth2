<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
</head>
<body style="text-align: center;">
	<h1>THIS IS MY SECURED ADMIN PAGE</h1>
	<a href="${pageContext.request.contextPath}/test/index">Home</a>
	<a href="${pageContext.request.contextPath}/test/member">Go To Member Page</a>
	<a href="${pageContext.request.contextPath}/test/admin">Go To Admin Page</a>
	<a href="${pageContext.request.contextPath}/test/logout">Logout</a>
</body>
</html>