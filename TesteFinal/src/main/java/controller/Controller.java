/* _____________________________________________________________
 * 							CONTROLLER 
 * 	Métodos - (doGet, homePage, validaLogin, novoUsuario 
 * 
 * 	@author Kaique Magalhães
 * 	@author Matheus Gabriel
 * 	@version - 2.5
 * _____________________________________________________________
 * */

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

@WebServlet({ "/Controller", "/main", "/insert", "/user" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	JavaBeans veiculo = new JavaBeans();
	UserBeans usuario = new UserBeans();

	public Controller() {
		super();
	}

	/**
	 * ----------------------------------------------------------------
	 * AÇÕES DE REDIRECIONAENTO
	 * ----------------------------------------------------------------
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String action = request.getServletPath();
			if (action.equals("/main")) {
				homePage(request, response);
			} else if (action.equals("/insert")) {
				novoUsuario(request, response);
			} else if (action.equals("/user")) {
				redirectUser(request, response);
			} else {
				dao.testeConexao();
				response.sendRedirect("index.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect("./alerts/erroServer.html");
		}
	}

	/**
	 * ----------------------------------------------------------------
	 * GERAÇÃO DE HOME PAGE
	 * ----------------------------------------------------------------
	 */
	protected void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Criando um objeto que irá receber os dados Javabeans
		ArrayList<JavaBeans> lista = dao.listarVeiculos();

		// Encaminhar a lista ao documento home.jsp
		request.setAttribute("carros", lista);
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);

	}

	/**
	 * ----------------------------------------------------------------
	 * VALIDAÇÃO DE LOGIN
	 * ----------------------------------------------------------------
	 */
	protected void validaLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<UserBeans> listarUsuarios = dao.listarUser();
		String requestedUsername = request.getParameter("user");
		String requestedPassword = request.getParameter("password");
		int requestId;

		boolean userFound = false;
		boolean passwordFound = false;
		boolean isAdmin = false;

		for (UserBeans user : listarUsuarios) {
			if (user.getNome().equals(requestedUsername) && user.getSenha().equals(requestedPassword)) {
				userFound = true;
				passwordFound = true;
				requestId = Integer.parseInt(user.getIduser());
				
				// Verifica se o usuário é um administrador
				//isAdmin = user.getIsAdmin().equals("true");
				break;
			}
		}
		
		if (userFound && passwordFound) {
			homePage(response, request);
		}
	}

	/**
	 * ----------------------------------------------------------------
	 * CRIAÇÃO DE UM NOVO USUÁRIO
	 * ----------------------------------------------------------------
	 */
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

	/**
	 * ----------------------------------------------------------------
	 * Redirecionamento para página de usuário
	 * ----------------------------------------------------------------
	 */
	protected void redirectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}
}