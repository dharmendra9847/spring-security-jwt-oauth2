<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNAUTHORIZED</title>
</head>
<body style="text-align: center;">
	<h1>Access Denied</h1>
	<p>You do not have the necessary permissions to view this directory
		or page. If you believe this is a mistake, please check your
		credentials or contact the administrator.</p>
	<a href="${pageContext.request.contextPath}/test/index">Home</a>
	<a href="${pageContext.request.contextPath}/test/member">Go To
		Member Page</a>
	<a href="${pageContext.request.contextPath}/test/admin">Go To Admin
		Page</a>
</body>
</html>