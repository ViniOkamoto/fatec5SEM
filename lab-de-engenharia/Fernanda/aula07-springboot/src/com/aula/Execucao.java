package com.aula;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;

public class Execucao {

	@Bean
	public Professor gerarProfessor() {
		return new Professor();
	}

	public static void main(String[] args) {

		AnnotationConfigApplicationContext app = new AnnotationConfigApplicationContext(Execucao.class);

		Professor p1 = app.getBean(Professor.class);
		Professor p2 = app.getBean(Professor.class);
		System.out.println("professor gerado p1: " +p1.toString());
		System.out.println("professor gerado p2: " +p2.toString());
		
	}

}
