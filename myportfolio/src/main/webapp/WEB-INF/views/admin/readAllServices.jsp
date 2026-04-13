<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read All Services</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a><br><br><br>
	
	
	<h2>All Services</h2>
	
	${result}<br><br>
	<c:forEach var="service" items="${listOfServices}">

		<img style="width: 200px; height: auto;"
			src="${pageContext.request.contextPath}/img/services/${service.filename}"
			alt="">
		<p>${service.title}</p>
		<p>${service.description}</p>
		
		
		<a href="${pageContext.request.contextPath}/admin/deleteService?id=${service.id}&filename=${service.filename }">Delete</a>
		
		<a href="${pageContext.request.contextPath}/admin/updateService?id=${service.id}">Update</a><br><br>
		

	</c:forEach>

</body>
</html>