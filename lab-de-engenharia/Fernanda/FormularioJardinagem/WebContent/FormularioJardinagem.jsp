<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Jardinagem</title>
		<script>
			var sub = document.getElementById("submeter");
			var canc = document.getElementById("cancelar");

			if (sub.click()) {
				sucesso();
			};
			if (canc.click()) {
				cancelar();
			};

	function sucesso() {
		alert("Formulario submetido com sucesso");
	};

	function cancelar() {
		alert("Envio de formulario cancelado");
	};
</script>

<style>
.input-primary {
	width: 20px;
}
</style>
</head>
<body>
	<%
		int numero = 7;
	try {
		numero = Integer.parseInt(request.getParameter("NUMERO"));
	} catch (Exception e) {
		// nada
	}
	%>

	<h2>Formulário de Jardinagem</h2>
	<h4>Por favor, insira as informações solicitadas abaixo:</h4>

	<form>
		<div class="column">
			<label for="tmnterreno">Tamanho do terreno: </label> <label
				for="largura">Largura: </label> <input type="text" id="largura"
				name="largura" value=""> <label for="largura">Comprimento:
			</label> <input type="text" id="comprimento" name="comprimento" value="">
		</div>
		<div>
			<label for="tipoterra">Tipo de terra: </label> <input type="radio"
				id="preta" name="tipoterra" value="preta"> <label
				for="preta">Preta</label> <input type="radio" id="vermelha"
				name="tipoterra" value="vermelha"> <label for="preta">Vermelha</label>
			<input type="radio" id="roxa" name="tipoterra" value="roxa">
			<label for="preta">Roxa</label> <input type="radio" id="areia"
				name="tipoterra" value="areia"> <label for="preta">Areia</label>
			<input type="radio" id="argila" name="tipoterra" value="argila">
			<label for="preta">Argila</label><br>
			<br>
		</div>

		<div>
			<label for="ferramentas">Ferramentas: </label>
			<ul>
				<input type="checkbox" id="pa" name="ferramentas" value="pa">
				<label for="pa">Pá</label>
				<br>

				<input type="checkbox" id="tesoura" name="ferramentas"
					value="tesoura">
				<label for="tesoura">Tesoura</label>
				<br>

				<input type="checkbox" id="ancinho" name="ferramentas"
					value="ancinho">
				<label for="ancinho">Ancinho</label>
				<br>

				<input type="checkbox" id="enxada" name="ferramentas" value="enxada">
				<label for="enxada">Enxada</label>
				<br>

				<input type="checkbox" id="foice" name="ferramentas" value="foice">
				<label for="foice">Foice</label>
				<br>

				<input type="checkbox" id="rastelo" name="ferramentas"
					value="rastelo">
				<label for="rastelo">Rastelo</label>
				<br>

				<input type="checkbox" id="luvas" name="ferramentas" value="luvas">
				<label for="luvas">Luvas</label>
				<br>
				<br>
			</ul>
		</div>

		<div>
			<label for="ferramentas">Insumos (colocar a quantidade): </label>
			<ul>
				<input type="text" id="pa" class="input-primary" name="ferramentas"
					value="">
				<label for="pa">Pá</label>
				<br>

				<input type="text" id="tesoura" class="input-primary"
					name="ferramentas" value="">
				<label for="tesoura">Tesoura</label>
				<br>

				<input type="text" id="ancinho" class="input-primary"
					name="ferramentas" value="">
				<label for="ancinho">Ancinho</label>
				<br>

				<input type="text" id="enxada" class="input-primary"
					name="ferramentas" value="">
				<label for="enxada">Enxada</label>
				<br>

				<input type="text" id="foice" class="input-primary"
					name="ferramentas" value="">
				<label for="foice">Foice</label>
				<br>

				<input type="text" id="rastelo" class="input-primary"
					name="ferramentas" value="">
				<label for="rastelo">Rastelo</label>
				<br>

				<input type="text" id="luvas" class="input-primary"
					name="ferramentas" value="">
				<label for="luvas">Luvas</label>
				<br>
				<br>
			</ul>
		</div>

		<div>
			<label for="sementes">Sementes (colocar a quantidade): </label>
			<ul>
				<input type="text" id="melancia" class="input-primary"
					name="sementes" value="">
				<label for="melancia">Melancia</label>
				<br>

				<input type="text" id="cenoura" class="input-primary"
					name="sementes" value="">
				<label for="cenoura">Cenoura</label>
				<br>

				<input type="text" id="tomate" class="input-primary" name="sementes"
					value="">
				<label for="tomate">Tomate</label>
				<br>

				<input type="text" id="chuchu" class="input-primary" name="sementes"
					value="">
				<label for="chuchu">Chuchu</label>
				<br>

				<input type="text" id="alface" class="input-primary" name="sementes"
					value="">
				<label for="alface">Alface</label>
				<br>

				<input type="text" id="cebolinha" class="input-primary"
					name="sementes" value="">
				<label for="cebolinha">Cebolinha</label>
				<br>

				<input type="text" id="cebola" class="input-primary" name="sementes"
					value="">
				<label for="cebola">Cebola</label>
				<br>
			</ul>
		</div>
		
		<div name="cadastro-comprador">
			<label for="dados-comprador">Dados do comprador: </label><br> <label
				for="nome">Nome:</label> <input type="text" id="nome" name="nome"
				value=""> <label for="nascimento">Nascimento:</label> <input
				type="text" id="nascimento" name="nascimento"> <label
				for="rg">RG:</label> <input type="text" id="rg" name="rg"> <label
				for="cpf">CPF:</label> <input type="text" id="cpf" name="cpf">

			<label for="endereco">Endereço:</label> 
			<input type="text" id="endereco" name="endereco"> 
			<label for="bairro">Bairro:</label>
			<input type="text" id="bairro" name="bairro"> 
			<label for="cidade">Cidade:</label> 
			<input type="text" id="cidade" name="cidade"> 
			<label for="estado">Estado:</label>
			<input type="text" id="estado" name="estado"> 
			<label for="nascimento">CEP:</label> 
			<input type="text" id="nascimento" name="nascimento"> 
			<label for="nascimento">E-mail:</label> 
			<input type="text" id="nascimento" name="nascimento"> 
			<label for="nascimento">Telefone:</label> 
			<input type="text" id="nascimento" name="nascimento">
		</div>
	</form>

	<button name="submeter" type="button" onclick="sucesso();">Submeter</button>
	<!-- <button type="button" onclick="falha();">Cancelar</button> -->
</body>
</html>