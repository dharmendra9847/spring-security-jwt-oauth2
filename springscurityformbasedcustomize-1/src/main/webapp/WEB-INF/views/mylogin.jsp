<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body style="text-align: center;">



	<h1>THIS IS MY SECURED LOGING PAGE</h1>
	<%
		if(request.getParameter("error") != null){
	%>
		<p style="color: red;">Invalid Username & Password</p>
	<%
	
	}
	
	%>
	<form action="/doLogin" method="post">
		
		<label>USERNAME</label><br>
		<input type="email" name="email" placeholder="enter username"><br><br>
		
		<label>PASSWORD</label><br>
		<input type="password" name="pass" placeholder="enter password"><br><br>
		
		<button>LOGIN</button>
	
	</form>
</body>
</html>