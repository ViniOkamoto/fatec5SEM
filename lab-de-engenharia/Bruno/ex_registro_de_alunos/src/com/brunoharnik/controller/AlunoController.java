package com.brunoharnik.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brunoharnik.entity.Aluno;

@WebServlet("/alunocontroller")
public class AlunoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private List<Aluno> alunos = new ArrayList<>();
	private long autoId = 1;
	
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cmd = req.getParameter("cmd");
		switch (cmd) {
		case "adicionar":
			System.out.println("Clicou em adicionar");
			Aluno novoAluno = new Aluno();
			novoAluno.setRa(req.getParameter("ra"));
			novoAluno.setNome(req.getParameter("name"));
			novoAluno.setIdade(Integer.parseInt(req.getParameter("idade")));
			novoAluno.setSexo(req.getParameter("sexo"));
			novoAluno.setId(autoId);
			alunos.add(novoAluno);
			autoId++;
			break;
		case "atualizar":
			System.out.println("Clicou em atualizar");
			break;
		case "pesquisar":
			System.out.println("Clicou em pesquisar");
			break;
		case "remover":
			System.out.println("Clicou em remover");
			break;

		default:
			break;
		}
		
		
		//		ServletContext sc = getServletContext();
//		List<Aluno> alunos = (List<Aluno>) sc.getAttribute("Lista");
//		
//		super.doPost(req, resp);
		
		System.out.println(cmd);
	}
}
