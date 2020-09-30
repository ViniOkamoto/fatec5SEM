<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Teste de JSP</h1>
	<h2>Data e hora atual</h2>
	
	<%
		LocalDateTime dt = LocalDateTime.now();
	%>
	
	<h5><%=dt.toString() %></h5>
</body>
</html>