package edu.curso;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/IMC")
public class CalculoIMC extends GenericServlet{
	// recebe peso e altura 
		// peso / altura²
	
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		String strPeso = req.getParameter("PESO");
		String strAltura = req.getParameter("ALTURA");
		
		
		int peso = 0;
		int altura = 0;
		String mensagem = "";
		try {
			peso = Integer.parseInt(strPeso);
			altura = Integer.parseInt(strAltura);
			double imc = (double) peso / (double)Math.pow((double)altura/100, 2);
			mensagem = String.format("<p> Seu IMC é: %6.2</p>%n", imc);
		} catch (Exception e) {
			mensagem = "erro";
		}
		System.out.println(mensagem);
	}
}
