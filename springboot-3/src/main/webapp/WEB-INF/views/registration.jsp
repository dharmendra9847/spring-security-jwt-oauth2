<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

	${msg}

	<h1>This is my Registration Page!</h1>
	<form action="save" method="post">
	
		<input type="text" name="id" placeholder="Enter Id"><br><br>
		<input type="text" name="name" placeholder="Enter Name"><br><br>
		<input type="text" name="address" placeholder="Enter Address"><br><br>
		<input type="text" name="salary" placeholder="Enter Salary"><br><br>
		
		<button>save</button>
	
	</form>

</body>
</html>