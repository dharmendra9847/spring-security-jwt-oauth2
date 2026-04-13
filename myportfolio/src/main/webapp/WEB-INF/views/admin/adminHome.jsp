<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
</head>
<body>
	<h2>Admin Panel</h2>
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/readAllContacts">Read All Contacts</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/addService">Add Service</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/readAllServices">Read All Services</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/uploadResume">Upload Resume</a><br><br>
</body>
</html>