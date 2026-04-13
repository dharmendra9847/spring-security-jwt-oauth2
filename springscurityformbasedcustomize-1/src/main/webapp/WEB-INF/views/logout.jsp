<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGOUT</title>
</head>
<body style="text-align: center;">
	<h1>Logged Out Successfully</h1>
	<p>You have been securely logged out of your account. Thank you for
		visiting, and we hope to see you again soon!</p>
		<a href="${pageContext.request.contextPath}/test/mylogin">Log In Again</a>
                <a href="${pageContext.request.contextPath}/test/index">Return to Homepage</a>
</body>
</html>