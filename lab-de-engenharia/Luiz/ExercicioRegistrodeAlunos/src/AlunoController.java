import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Aluno;

@WebServlet("/AlunoController")
public class AlunoController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException { 
		
		ServletContext app = req.getServletContext();
		HttpSession session = req.getSession();
		
		List<Aluno> lista = (List<Aluno>)app.getAttribute("ALUNOS"); 
		if(lista==null){
			lista = new ArrayList();
			app.setAttribute("ALUNOS", lista);
		}
		
		String acao = req.getParameter("cmd");
		Aluno a = new Aluno();
		
		try {
			a.setId(Long.parseLong(req.getParameter("id")));
			a.setRa(req.getParameter("ra"));
			a.setNome(req.getParameter("nome"));
			a.setIdade(Integer.parseInt(req.getParameter("idade")));
			a.setSexo(req.getParameter("sexo"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		if ("adicionar".equals(acao)) { 
			lista.add(a);
			msg = String.format(
				"Aluno adicionado com sucesso, há %d alunos na lista", 
				lista.size());
		} else if ("pesquisar".equals(acao)) {
			List<Aluno> localizados = new ArrayList<>();
			for (Aluno al : lista) { 
				if (al.getRa().contains(a.getRa())) { 
					localizados.add(al);
				}
			}
			msg = String.format(
					"Foram localizados %d alunos com este  %s", 
					localizados.size(), a.getRa());
			session.setAttribute("ALUNOS", localizados);
		}
		System.out.println(msg);
		session.setAttribute("MENSAGEM", msg);
		res.sendRedirect("./aluno.jsp");
		
	}
	
}
