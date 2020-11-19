package com.fatec.testes_tdd_escola.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fatec.testes_tdd_escola.domain.Aluno;

@Repository
public interface AlunoRepository extends CrudRepository<Aluno, Long> {}