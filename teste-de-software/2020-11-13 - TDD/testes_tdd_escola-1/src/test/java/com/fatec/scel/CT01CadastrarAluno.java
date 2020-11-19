package com.fatec.scel;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fatec.scel.model.Aluno;
import com.fatec.scel.repositories.AlunoRepository;

@SpringBootTest
class CT01CadastrarAluno {

	@Autowired
	AlunoRepository repository;
	
	private ValidatorFactory validatorFactory;
	private Validator validator;
	
	@Test
	void cadastro_com_sucesso() {
		repository.deleteAll();
		repository.save(new Aluno(1L, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666"));
		assertEquals(1, repository.count());
	}
	
	@Test
	void validacao_de_entrada_com_sucesso() {
		repository.deleteAll();
		validatorFactory = Validation.buildDefaultValidatorFactory();
		validator = validatorFactory.getValidator();
		Aluno aluno = new Aluno(1L, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		Set<ConstraintViolation<Aluno>> violations = validator.validate(aluno);
		assertTrue(violations.isEmpty());
	}
	
	@Test
	void validacao_de_entrada_dados_invalidos() {
		validatorFactory = Validation.buildDefaultValidatorFactory();
		validator = validatorFactory.getValidator();
		repository.deleteAll();
		Aluno aluno = new Aluno(1L, "XX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		Set<ConstraintViolation<Aluno>> violations = validator.validate(aluno);
		assertEquals("O RA deve conter entre 3 e 10 caracteres.", violations.iterator().next().getMessage());
	}
	
	@Test
	void validacao_de_RA_cadastrado() {
		repository.deleteAll();
		Aluno aluno = new Aluno(1L, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		Aluno alunoRepetido = new Aluno(1L, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		repository.save(aluno);
		try {
			repository.save(alunoRepetido);
		} catch (Exception e) {
			System.out.println(e);
		}
		assertEquals(1, repository.count());
	}
	
	@Test
	void validacao_consulta_sucesso() {
		repository.deleteAll();
		Aluno aluno = new Aluno(1L, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		repository.save(aluno);
		Optional<Aluno> alunoConsulta = repository.findByRa("XXXXX");
		assertThat(alunoConsulta.get().getRa()).isEqualTo(aluno.getRa());
	}
	
	@Test
	void validacao_consulta_nome_parcial() {
		repository.deleteAll();
		Aluno aluno1 = new Aluno(null, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		repository.save(aluno1);
		Aluno aluno2 = new Aluno(null, "ZZZZZ", "Jeca", "jeca@fatec.sp.gov.br", "67564566", "Rua da Felicidade, 999");
		repository.save(aluno2);
		Aluno aluno3 = new Aluno(null, "YYYYY", "Joca", "joca@fatec.sp.gov.br", "20202020", "Rua do ano sen fim, 2020");
		repository.save(aluno3);
		List<Aluno> alunos = repository.findAllByNomeIgnoreCaseContaining("Juca");
		assertThat(alunos.size()).isEqualTo(1);
	}
	
	@Test
	void validacao_exclusao() {
		repository.deleteAll();
		Aluno aluno = new Aluno(null, "XXXXX", "Juca", "juca@fatec.sp.gov.br", "21312354", "Rua da Amargura, 666");
		repository.save(aluno);
		Optional<Aluno> alunoFind = repository.findByRa("XXXXX");
		repository.deleteById(alunoFind.get().getId());
		assertThat(repository.findByRa("XXXXX")).isEmpty();
	}
}
