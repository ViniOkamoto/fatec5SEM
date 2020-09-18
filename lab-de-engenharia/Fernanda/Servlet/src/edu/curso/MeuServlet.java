package edu.curso;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/MeuServlet")
public class MeuServlet implements Servlet{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("Servlet foi adicionado");
		
		res.setContentType("text/html");
		
		PrintWriter out = res.getWriter();
		
		out.println("<h2 style=\"color:red;\"> Olá navegador, essa é a tabuada do 7: </h2>");
		
		for (int i = 1; i <= 10 ; i++) {
			out.println("<p style=\"color:red;\"> 7 x  "+ i + " = " + i*7 + "</p>");
			out.flush();
		}
		
		
		out.flush();
		
	}

}
