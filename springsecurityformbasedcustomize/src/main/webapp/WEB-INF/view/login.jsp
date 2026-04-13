<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
* {
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	margin: 0;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.login-card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(10px);
	padding: 40px;
	border-radius: 15px;
	border: 1px solid rgba(255, 255, 255, 0.2);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
	width: 350px;
	text-align: center;
	color: white;
}

h3 {
	margin-bottom: 30px;
	font-weight: 300;
	letter-spacing: 1px;
}

input {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: none;
	border-radius: 5px;
	background: rgba(255, 255, 255, 0.2);
	color: white;
	outline: none;
	transition: 0.3s;
}

input::placeholder {
	color: rgba(255, 255, 255, 0.7);
}

input:focus {
	background: rgba(255, 255, 255, 0.3);
	box-shadow: 0 0 8px rgba(255, 255, 255, 0.2);
}

button {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background: #fff;
	color: #764ba2;
	font-weight: bold;
	font-size: 16px;
	transition: transform 0.2s, background 0.3s;
}

button:hover {
	background: #f0f0f0;
	transform: translateY(-2px);
}

button:active {
	transform: translateY(0);
}
</style>
</head>
<body>
	<div class="login-card">
		<h3>Login Here</h3>
		<form action="/doLogin" method="post" id="loginForm">
			<!-- Changed type to "password" for security -->
			<input type="text" name="user" placeholder="Username" required>
			<input type="password" name="pass" placeholder="Password" required>
			<button type="submit" id="loginBtn">Login</button>
		</form>
	</div>
</body>
</html>