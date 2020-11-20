package com.fatec.cap12.domain;

public class Disciplina {

	private Integer codigo;
	private String disciplina;
	private Double nota1;
	private Double nota2;
	private transient Double media = 0.;
	private String situacao = "";

	private Aluno aluno;
	
	public Disciplina() {}

	public Disciplina(Integer codigo, String disciplina, Double nota1, Double nota2, Aluno aluno) {
		super();
		this.codigo = codigo;
		this.disciplina = disciplina;
		this.nota1 = nota1;
		this.nota2 = nota2;
		this.aluno = aluno;
	}

	public Disciplina(Integer codigo, String disciplina, Double nota1, Double nota2) {
		super();
		this.codigo = codigo;
		this.disciplina = disciplina;
		this.nota1 = nota1;
		this.nota2 = nota2;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}

	public Double getNota1() {
		return nota1;
	}

	public void setNota1(Double nota1) {
		this.nota1 = nota1;
	}

	public Double getNota2() {
		return nota2;
	}

	public void setNota2(Double nota2) {
		this.nota2 = nota2;
	}

	public Double getMedia() {
		return media;
	}

	public void setMedia(Double media) {
		this.media = media;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	@Override
	public String toString() {
		return "Disciplina [codigo=" + codigo + ", disciplina=" + disciplina + ", nota1=" + nota1 + ", nota2=" + nota2
				+ ", media=" + media + ", situacao=" + situacao + ", aluno=" + aluno + "]";
	}

}
