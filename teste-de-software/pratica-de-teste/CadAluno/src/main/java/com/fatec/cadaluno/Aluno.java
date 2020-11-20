package com.fatec.cadaluno;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Aluno {
	private Long id;
	private String ra;
	private String nome;
	private String email;
	private String cep;
	private String endereco;
	
	public Aluno() {}
	
	public Aluno(Long id, String ra, String nome, String email, String cep, String endereco) {
		super();
		this.id = id;
		this.ra = ra;
		this.nome = nome;
		this.email = email;
		this.cep = cep;
		this.endereco = endereco;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
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
		if (!m.matches() && a.getCep().length() > 8){
			throw new IllegalArgumentException("Cep inválido.");
		};
		return true;
	}
	
}
