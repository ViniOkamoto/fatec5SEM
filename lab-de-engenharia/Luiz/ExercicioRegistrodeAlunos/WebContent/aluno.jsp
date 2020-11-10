<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, entities.Aluno"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALUNO</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

	<div class="container">
	<h1>Registro de alunos</h1>
	
	<%
			List<Aluno> lista = (List<Aluno>)session.getAttribute("ALUNOS");
			String msg = (String)session.getAttribute("MENSAGEM");
			if (msg != null) {
		%>
				<div class="alert alert-success" role="alert">
	  				<h4 class="alert-heading">Comando executado</h4>
	  				<p><%=msg%></p>
	  			</div>
		<% 		session.setAttribute("MENSAGEM", null);
			} %>
	
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
	
	<% if (lista != null && !lista.isEmpty()) {%>
		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>RA</th>
						<th>NOME</th>
						<th>IDADE</th>
						<th>SEXO</th>
					</tr>
				</thead>
				<tbody>
					<% for (Aluno l : lista) {%>
						<tr>
							<td><%=l.getId()%></td>
							<td><%=l.getRa()%></td>
							<td><%=l.getNome()%></td>
							<td><%=l.getIdade()%></td>
							<td><%=l.getSexo()%></td>
						</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	<% } %>
	
</body>
</html>