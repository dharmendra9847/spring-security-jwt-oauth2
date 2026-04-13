<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Resume</title>
</head>
<body>

	<h2>Upload Resume</h2>
	<a href="${pageContext.request.contextPath}/client/home">Client Home</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a><br><br> 
	
	
	${result}
	${fileError}
	<form action="uploadResume" method="post" enctype="multipart/form-data">
	
		<input type="file" name="resume"><br><br>
		<button>upload</button>
	
	</form>
</body>
</html>