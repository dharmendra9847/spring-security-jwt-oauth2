<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER</title>
</head>
<body style="text-align: center;">
	<h1>THIS IS MY SECURED MEMBER PAGE</h1>
	<a href="${pageContext.request.contextPath}/test/index">Home</a>
	<form action="${pageContext.request.contextPath}/test/logout" method="get">
    	<!-- csrf token generated -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><br><br>
		<button>Logout</button>
    </form>
</body>
</html>