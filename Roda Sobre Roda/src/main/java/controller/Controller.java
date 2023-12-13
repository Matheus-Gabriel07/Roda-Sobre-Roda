/* _____________________________________________________________
 * 							CONTROLLER 
 * 	Métodos - (doGet, homePage, homeAdm, validaLog, validaCad, 
 * 	listarUser(ArrayList)
 * 
 * 	@author Kaique Magalhães
 * 	@author Matheus Gabriel
 * 	@version - 2.2
 * _____________________________________________________________
 * */

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.JavaBeans;
import model.UserBeans;

@WebServlet({ "/Controller", "/main", "/validaLog", "/validaCad" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	JavaBeans veiculo = new JavaBeans();

	public Controller() {
		super();
	}

	// Método geral de redirecionamento
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		try {
			if (action.equals("/main")) {
				homePage(request, response);
			} else if (action.equals("/validaLog")) {
				validaLog(request, response);
			} else if (action.equals("/validaCad")) {
				validaCad(request, response);
			} else if (action.equals("/homeAdm")) {
				/*if (userIsAuthorized(request)) {
					homeAdm(request, response);
				} else {
				}*/
			} else {
				dao.testeConexao();
				response.sendRedirect("/alerts/notFound.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect("./alerts/erroServer.html");
		}
	}

	// Método de redirecionamento para o home(usuário), com a geração da lista de
	// veiculos
	protected void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Criando um objeto que irá receber os dados Javabeans
		ArrayList<JavaBeans> lista = dao.listarVeiculos();

		// Encaminhar a lista ao documento home.jsp
		request.setAttribute("carros", lista);
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);

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

	// Método de validação de login
	protected void validaLog(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<UserBeans> listaUsuarios = listarUser();
		String requestedUsername = request.getParameter("user");
		String requestedPassword = request.getParameter("password");

		boolean userFound = false;
		boolean passwordFound = false;
		boolean isAdmin = false;

		for (UserBeans user : listaUsuarios) {
			if (user.getNome().equals(requestedUsername) && user.getSenha().equals(requestedPassword)) {
				userFound = true;
				passwordFound = true;

				// Verifica se o usuário é um administrador
				isAdmin = user.getAdmin().equals("true");

				break;
			}
		}

		if (isAdmin) {
			String script = "<script type='text/javascript'>loadingAdm();</script>";
			response.getWriter().write(script);
			homeAdm(request, response);
		} else if (userFound && passwordFound) {
			String script = "<script type='text/javascript'>loadingUser();</script>";
			response.getWriter().write(script);
			homePage(request, response);
		} else if (!userFound) {
			response.getWriter().write("Usuário incorreto");
		} else {
			response.getWriter().write("Senha incorreta");
		}
	}

	// Método de validação de cadastro
	protected void validaCad(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<UserBeans> listaUsuarios = listarUser();
		String requestedUsername = request.getParameter("user");
		String requestedEmail = request.getParameter("email");
		String requestedPassword = request.getParameter("password");
		boolean userFound = false;
		boolean emailFound = false;

		for (UserBeans user : listaUsuarios) {
			if (user.getNome().equals(requestedUsername)) {
				userFound = true;
			}
			if (user.getEmail().equals(requestedEmail)) {
				emailFound = true;
			}
		}

		if (userFound || emailFound) {
			if (userFound) {
				response.getWriter().write("Esse nome de usuário já está sendo usado.");
			}
			if (emailFound) {
				response.getWriter().write("Esse e-mail já está sendo usado.");
			}
		} else {
			dao.cadastrarUser(requestedUsername, requestedEmail, requestedPassword);
			String script = "<script type='text/javascript'>loadingUser();</script>";
			response.getWriter().write(script);
			response.sendRedirect("homePage");
		}
	}

	public ArrayList<UserBeans> listarUser() {

		// Criando um objeto para acessar a classa JavaBeans
		ArrayList<UserBeans> usuarios = new ArrayList<>();
		String read = "Select * from usuarios";

		try {

			// Abrindo Conexão com o Banco de Dados
			Connection con = dao.conectar();

			// Preparar a query para a execução no banco de dados
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();

			// O laço abaixo será executado enquanto houver veiculos a serem listados

			while (rs.next()) {

				// Variáveis de apoio que recebem os dados da Data Base
				String iduser = rs.getString(1);
				String nome = rs.getString(2);
				String email = rs.getString(3);
				String senha = rs.getString(4);
				String veiAlugados = rs.getString(5);
				String veiDevolvidos = rs.getString(6);
				String imagem = rs.getString(7);
				String isAdmin = rs.getString(8);

				// populando o arraylist
				usuarios.add(new UserBeans(iduser, nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin));
			}
			con.close();
			return usuarios;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}