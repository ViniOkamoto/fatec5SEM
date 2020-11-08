<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ALUNO</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

	<div class="container">
	<h1>Registro de alunos</h1>
	
	<hr>
		<form method="post" action="./AlunoController">
		
		<div class="form-group">
		<label for="id">ID:</label>
		<input type="text" name="id" class="form-control"/> <br>
		</div>
		
		<div class="form-group">
		<label for="ra">RA:</label>
		<input type="text" name="ra" class="form-control"/> <br>
		</div>
		
		<div class="form-group">
		<label for="nome">NOME:</label>
		<input type="text" name="nome" class="form-control"/> <br>
		</div>
		
		<div class="form-group">	
		<label for="idade">IDADE</label>
		<input type="text" name="idade" class="form-control"/> <br>
		</div>
		
		<div class="form-group">
		<label for="sexo">SEXO:</label>
		<select name="sexo"  class="form-control">
  			<option value="MASCULINO">M</option>
  			<option value="FEMININO">F</option>
		</select>
		</div>
		
		<button type="submit" class="btn btn-primary" name="cmd" value="adicionar"> ADICIONAR</button>
		<button type="submit" class="btn btn-primary" name="cmd" value="pesquisar"> PESQUISAR</button>
	
	</form>
	</div>
	
	
</body>
</html>