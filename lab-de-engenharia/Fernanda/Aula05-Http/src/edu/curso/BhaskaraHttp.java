package edu.curso;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bhaskara")
public class BhaskaraHttp extends HttpServlet {
	
	//localhost:8080/Aula05-Http/bhaskara
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String msg = "";
		try {
			int a = Integer.parseInt(req.getParameter("a"));
			int b = Integer.parseInt(req.getParameter("b"));
			int c = Integer.parseInt(req.getParameter("c"));
			float delta = b * b - 4 * a * c;
			double x1 = (-b + Math.sqrt(delta)) / (2 * a);
			double x2 = (-b - Math.sqrt(delta)) / (2 * a);
			if (delta < 0) {
				msg = "Não há raízes reais para estes valores";
			} else {
				msg = String.format("Raízes X1: %8.2f      X2: %8.2f%n", x1, x2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg="deu ruim";
		}
	}
}
