<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Autentication Page</title>
</head>
<body>
	<form action="/login" method="post">
		<label>Login</label>
		User: <br/><input type="text" name="user"/><br/> 
		Password: <br/><input type="text" name="password"/><br/> 
		<br/><input type="submit" value="login"/><br/> 
	</form>
</body>
</html>