package com.fatec.scel.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fatec.scel.model.Aluno;

@Repository
public interface AlunoRepository extends CrudRepository<Aluno, Long> {
	
	@Query("SELECT a FROM Aluno a WHERE a.ra = :ra")
	Optional<Aluno> findByRa(@Param("ra") String ra);

	@Query("SELECT a FROM Aluno a WHERE a.nome = :nome")
	List<Aluno> findAllByNomeIgnoreCaseContaining(@Param("nome") String nome);
}