package com.cadjogos.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.cadjogos.dao.JogoDao;
import com.cadjogos.entities.Jogo;
import com.cadjogos.entities.JogoDificuldade;

public class JogoDaoImp implements JogoDao {

	ConnectionFactory db = new ConnectionFactory();
	
	@Override
	public boolean cadastrarJogo(Jogo jogo) {
		
		Connection con = db.getConnection();
		
		String sql = "INSERT INTO TBL_JOGOS (NOME_JOGO, DIFICULDADE_JOGO)"
				   + "VALUES (?, ?)";
		try{
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, jogo.getNome());
			stm.setString(2, jogo.getDificuldade().toString());
			stm.executeUpdate();
			con.close();
			return true;
		}catch(SQLException se){
			se.printStackTrace();
		}
		return false;
	}

	@Override
	public Jogo pesquisarJogo(String nomeJogo) throws SQLException {
		
		Jogo jogo = new Jogo();
		String sql = "SELECT * FROM TBL_JOGOS WHERE NOME_JOGO= ?";
		
		Connection con = db.getConnection();
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, nomeJogo);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		 jogo.setNome(rs.getString("NOME_JOGO"));
		 jogo.setDificuldade(nomeParaEnum(rs.getString("DIFICULDADE_JOGO")));
		 rs.close();
		}
		stmt.close();
		con.close();
		return jogo;
	}
	
	//Conversao String para Enum
	public JogoDificuldade nomeParaEnum(String nome){
		JogoDificuldade jogoDificuldade = JogoDificuldade.valueOf(nome);
		return jogoDificuldade;
	}

}
