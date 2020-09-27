package com.cadjogos.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.cadjogos.dao.JogoDao;
import com.cadjogos.entities.Jogo;

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
	

}
