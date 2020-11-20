package com.fatec.cap12.domain;

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
}
