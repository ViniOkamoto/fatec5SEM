package com.cadjogos.entities;

import java.io.Serializable;

public class Jogo implements Serializable{

	private static final long serialVersionUID = 1L;

	private String nome;
	private JogoDificuldade dificuldade;
	
	
	public Jogo(String nome, JogoDificuldade dificuldade) {
		super();
		this.nome = nome;
		this.dificuldade = dificuldade;
	}

	public Jogo(){
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public JogoDificuldade getDificuldade() {
		return dificuldade;
	}

	public void setDificuldade(JogoDificuldade dificuldade) {
		this.dificuldade = dificuldade;
	};
	
	
	
	
}
