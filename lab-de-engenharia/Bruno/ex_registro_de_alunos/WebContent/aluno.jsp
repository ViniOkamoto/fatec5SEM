<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercício – Registro de Alunos</title>
<style type="text/css">
	* {
		font-family: sans-serif;
	}
	.form-aluno {
		width: 400px;
		margin: 0 auto;
	}
	.label-form-aluno{
		margin: .2em 0;
		color: #DD0000;
	}
	.input-form-aluno {
		font-size: 1.2em;
		height: 1.4em;
		width: 100%;
		display: block;
		margin-bottom: 1em;
	}
	
	.div-buttons-form-aluno {
		text-align: center;
	}
</style>
</head>
<body>
<form class="form-aluno" action="./alunocontroller" method="post">
	<label class="label-form-aluno" for="id">Id:</label>
	<input class="input-form-aluno" type="text" name="id" disabled/>
	<label class="label-form-aluno" for="ra">Ra:</label>
	<input class="input-form-aluno" type="text" name="ra" />
	<label class="label-form-aluno" for="nome">Nome:</label>
	<input class="input-form-aluno" type="text" name="nome" />
	<label class="label-form-aluno" for="idade">Idade:</label>
	<input class="input-form-aluno" type="text" name="idade" />
	<label class="label-form-aluno" for="sexo">Sexo:</label>
	<input class="input-form-aluno" type="text" name="sexo" />
	<div class="div-buttons-form-aluno">
		<button type="submit" value="adicionar" name="cmd">Adicionar</button>
		<button type="submit" value="atualizar" name="cmd">Atualizar</button>
		<button type="submit" value="pesquisar" name="cmd">Pesquisar</button>
		<button type="submit" value="remover" name="cmd">Remover</button>
	</div>
</form>
</body>
</html>