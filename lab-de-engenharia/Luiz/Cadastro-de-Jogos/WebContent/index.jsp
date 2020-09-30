<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de jogos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

	<hr>
	<h1>Cadastrar novo jogo</h1>
	
	<form method="post" action="JogosServlet">
		<label>Nome do jogo:</label>
		<input type="text" name="nomeJogo" /> <br>
		
		<label>Dificuldade do jogo:</label>
		<select name="dificuldadeJogo" id="dificuldadeJogo">
  			<option value="INICIANTE">INICIANTE</option>
  			<option value="INTERMEDIARIO">INTERMEDIÁRIO</option>
  			<option value="ESPECIALISTA">ESPECIALISTA</option>
		</select>
		
		<button type="submit" class="btn btn-primary">Salvar</button>
	</form>
	<hr>
	
	<h1>Pesquisar jogo</h1>
	<form method="get" action="JogosServlet">
		<label>Nome do jogo:</label>
		<input type="text" name="nomeJogoBusca" />
		<button type="submit" class="btn btn-primary">Pesquisar</button>
	</form>
	<hr>

</body>
</html>