package com.cadjogos.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cadjogos.daoimpl.JogoDaoImp;
import com.cadjogos.entities.Jogo;
import com.cadjogos.entities.JogoDificuldade;


@WebServlet("/JogosServlet")
public class JogosController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	JogoDaoImp jogoDaoImpl = new JogoDaoImp();
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException { 
		
		Jogo jogo = new Jogo();
		
		jogo.setNome(req.getParameter("nomeJogo"));
		jogo.setDificuldade(nomeParaEnum(req.getParameter("dificuldadeJogo")));
		
		//teste
		System.out.println("DADOS: " + jogo.getNome() + " " + jogo.getDificuldade().toString() + " recebidos");
		
		try {
			jogoDaoImpl.cadastrarJogo(jogo);
			System.out.println("Jogo cadastrado");
			
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>JOGO CADASTRADO</h1>");
			out.println("<h4> O Jogo: " + jogo.getNome() +" foi cadastrado !</h4>");
			out.println("</body>");
			out.println("</html>");
			out.flush();
		
		
		}catch(Exception e){
			System.out.println("Erro ao cadastrar jogo:");
			
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>ERRO AO CADASTRAR JOGO</h1>");
			out.println("<h2> ERRO </h2>");
			out.println("<h4> O Jogo: " + jogo.getNome() +" não foi cadastrado !</h4>");
			out.println("</body>");
			out.println("</html>");
			out.flush();
		}
	}
	
	
	
	
	//Conversao String para Enum
	public JogoDificuldade nomeParaEnum(String nome){
		JogoDificuldade jogoDificuldade = JogoDificuldade.valueOf(nome);
		return jogoDificuldade;
	}
	
	
}
