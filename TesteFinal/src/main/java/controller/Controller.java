package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;
import model.JavaBeans;
import model.UserBeans;

@WebServlet({ "/Controller", "/main", "/insert" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	JavaBeans veiculo = new JavaBeans();
	UserBeans usuario = new UserBeans();

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();
		if (action.equals("/main")) {
			homePage(request, response);
		} else if (action.equals("/insert")) {
			novoUsuario(request, response);
		} else {
			dao.testeConexao();
			response.sendRedirect("index.html");
		}
	}

	protected void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<UserBeans> listarUsuarios = dao.listarUser();
		String requestedUsername = request.getParameter("user");
		String requestedPassword = request.getParameter("password");

		boolean userFound = false;
		boolean passwordFound = false;
		boolean isAdmin = false;

		for (UserBeans user : listarUsuarios) {
			if (user.getNome().equals(requestedUsername) && user.getSenha().equals(requestedPassword)) {
				userFound = true;
				passwordFound = true;

				// Verifica se o usuário é um administrador
				isAdmin = user.getIsAdmin().equals("true");
				break;
			}
		}

		if (userFound && passwordFound) {
			// Criando um objeto que irá receber os dados Javabeans
			ArrayList<JavaBeans> lista = dao.listarVeiculos();
			// Encaminhar a lista ao documento home.jsp
			request.setAttribute("nome", requestedUsername);
			
			request.setAttribute("carros", lista);
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}
	}

	// Método de redirecionamento para o home(adm), coom suas requisições
	protected void homeAdm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Criando um objeto que irá receber os dados Javabeans
		ArrayList<JavaBeans> lista = dao.listarVeiculos();

		// Encaminhar a lista ao documento home.jsp
		request.setAttribute("carros", lista);
		RequestDispatcher rd = request.getRequestDispatcher("homeAdm.jsp");
		rd.forward(request, response);

	}

	// Novo Contato
	protected void novoUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// setar as variaveis JavaBeans
		usuario.setNome(request.getParameter("user"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("password"));

		// invocar o método inserirContato passando o objeto contato
		dao.inserirUsuario(usuario);

		// redirecionar para o documento home.jsp
		response.sendRedirect("./login.html");

	}
}
