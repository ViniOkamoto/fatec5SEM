<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tabuada</title>
<script>
	function alerta() { alert("foi clicado")}
</script>
</head>
<body>
	<h1>Tabuada do número 7</h1>

	<%
		int numero = 7;
	for (int i = 0; i <= 10; i++) {
		int resultado = numero * i;
	%>
	<h3><%=numero%>
		X
		<%=i%>
		=
		<%=resultado%></h3>
	<%
		}
	%>
	<button type="button" onclick="alerta();"> Clique-me </button>
</body>
</html>