<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read All Contacts</title>
</head>
<body>
	
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>
	
	<h2>All Contacts</h2>
	<c:forEach var="contact" items="${contactData}">
	
		${contact.id}<br>
		${contact.name}<br>
		${contact.email}<br>
		${contact.subject}<br>
		${contact.message}<br>
		${contact.datetime}<br>
		<a href="${pageContext.request.contextPath}/admin/deleteContactById?id=${contact.id}">Delete</a><br><br>
	
	</c:forEach>
</body>
</html>