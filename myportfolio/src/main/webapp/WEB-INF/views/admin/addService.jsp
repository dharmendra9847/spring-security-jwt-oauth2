<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Service</title>
</head>
<body>

	<h2>Add Service</h2>
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a><br><br> 
	
	${result}<br><br>
	<form action="${pageContext.request.contextPath}/admin/addService" method="post" enctype="multipart/form-data">
		
		<c:forEach var="err" items="${errors}">
                        	
       		<c:if test="${err.field=='title'}"> ${err.defaultMessage} </c:if>
       	
       	</c:forEach>
		<input type="text" name="title" placeholder="enter title"><br><br>
		
		<c:forEach var="err" items="${errors}">
                        	
       		<c:if test="${err.field=='description'}"> ${err.defaultMessage} </c:if>
       	
       	</c:forEach>
		<textarea rows="" cols="" name="description">enter description</textarea><br><br>
		
		${fileError}<br><br> 
		<input type="file" name="serviceFile"><br><br>
		<button>save</button>
	
	</form>
</body>
</html>