<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de jogos</title>
</head>
<body>

	<h1>Cadastrar novo jogo</h1>
	
	<form method="post" action="JogosController">
		<label>Nome do jogo:</label>
		<input type="text" name="nomeJogo"/> <br>
		
		<label>Dificuldade do jogo:</label>
		<select name="dificuldadeJogo" id="dificuldadeJogo">
  			<option value="INICIANTE">INICIANTE</option>
  			<option value="INTERMEDIARIO">INTERMEDIÁRIO</option>
  			<option value="ESPECIALISTA">ESPECIALISTA</option>
		</select>
		
		<button type="submit">Salvar</button>
	</form>

</body>
</html>