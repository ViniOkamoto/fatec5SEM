<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITabuada em JSP</title>
</head>
<body>
	<h3>Pagina de Teste em JSP</h3>
	<h2>Este código esta em JSP</h2>
	<%
		out.println("Este código mostra a tabuada do número 7");
	for (int i = 1; i <= 7; i++) {
	%>
	<h4>
		7 X
		<%=i%>
		=
		<%=(i * 7)%>
	</h4>
	<%
}
%>
	<h2>Fim da Tabuada</h2>
</body>
</html>