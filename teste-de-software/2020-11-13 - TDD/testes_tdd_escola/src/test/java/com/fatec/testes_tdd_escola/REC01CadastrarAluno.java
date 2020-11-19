package com.fatec.testes_tdd_escola;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fatec.testes_tdd_escola.domain.Aluno;
import com.fatec.testes_tdd_escola.repositories.AlunoRepository;

@SpringBootTest
public class REC01CadastrarAluno {

	@Autowired
	AlunoRepository repository;
	
	@Test
	public void cadastrarAlunoComSucesso() {
		repository.deleteAll();
		Aluno aluno = new Aluno(1L, "0987654321", "Alfredo da Silva", "alfredo.silva@fatec.sp.gov.br", "23423465", "Rua dos Bolos, 50");
		repository.save(aluno);
		assertEquals(1, repository);
	}

}
