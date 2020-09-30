package com.cadjogos.dao;

import java.sql.SQLException;

import com.cadjogos.entities.Jogo;

public interface JogoDao {

	public boolean cadastrarJogo(Jogo jogo);
	
	public Jogo pesquisarJogo(String nomeJogo) throws SQLException;
}
