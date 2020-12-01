package com.fatec.cadaluno;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class ValidaAluno {
	
	public Boolean validaId(Aluno a) throws Exception {
		if (a.getId() <= 0) {
			throw new IllegalArgumentException("ID Invalido ...Nao pode ser Nulo ou Negativo");
		}
		return true;
	}
	
	public Boolean validaRa(Aluno a) {
		if (a.getRa().isEmpty()) {
			throw new IllegalArgumentException("RA nao pode ser nulo ...");
		}
		return true;
	}

	public Boolean validaNome(Aluno a) {
		if (a.getNome() == null) {
			throw new IllegalArgumentException("Nome nao pode ser NULL ...");
		}
		if (a.getNome().length() == 0) {
			throw new IllegalArgumentException("Nome nao pode ser vazio ...");
		}
		Pattern p = Pattern.compile("[A-Z a-z]{2,35}");
		Matcher m = p.matcher(a.getNome());
		if (!m.matches()) {
			throw new IllegalArgumentException("Nome Invalido ...");
		}
		return true;
	}

	public Boolean validaEmail(Aluno a) {
		Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
		Matcher m = p.matcher(a.getEmail());
		if (!m.matches()) {
			throw new IllegalArgumentException("Email Invalido ...");
		}
		return true;
	}
	
	public Boolean validaCep(Aluno a) {
		Pattern p = Pattern.compile("[0-9]+");
		Matcher m = p.matcher(a.getCep());
		if (!m.matches() && a.getNome().contentEquals("")){
		};
		return true;
	}
	
	

}
