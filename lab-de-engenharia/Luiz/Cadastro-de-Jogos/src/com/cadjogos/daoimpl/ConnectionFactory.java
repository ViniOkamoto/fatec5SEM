package com.cadjogos.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static final String URL = "jdbc:mysql://localhost:3306/jogos?useTimezone=true&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASS = "root";
	
	public ConnectionFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		try {
			return DriverManager.getConnection(URL , USER , PASS);
			
		}catch (SQLException s) {
			throw new RuntimeException(s);
		}
		
	}
}
