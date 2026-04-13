<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Service</title>
</head>
<body>

	<h2>Update Service</h2>
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a><br><br> 

	${result}<br><br>
	<form action="${pageContext.request.contextPath}/admin/updateService" method="post" enctype="multipart/form-data">
		
		
       	<input type="hidden" name="id" value="${serviceData.id}"><br><br>
       	<input type="hidden" name="oldFileName" value="${serviceData.filename}"><br><br>
		<input type="text" name="title" placeholder="enter title" value="${serviceData.title}"><br><br>
		
		<textarea rows="" cols="" name="description">${serviceData.description}</textarea><br><br>
		
		${fileError}<br><br> 
		<input type="file" name="serviceFile"><br><br>
		<button>save</button>
	
	</form>
</body>
</html>