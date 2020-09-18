package edu.curso;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/TabuadaG")
public class TabuadaGeneric extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
res.setContentType("text/html");

		//numero = 9
		String strNumero = req.getParameter("NUMERO");

		int numero = 7;
		
		try {
			numero = Integer.parseInt(strNumero);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		PrintWriter out = res.getWriter();
		
		out.println("<h2 style=\"color:red;\"> Olá navegador, essa é a tabuada genérica do "+ numero + ": </h2>");
		
		for (int i = 1; i <= 10 ; i++) {
			out.println("<p style=\"color:red;\">" +numero +"  x  "+ i + " = " + i*numero + "</p>");
			out.flush();
		}
		
	}

}
