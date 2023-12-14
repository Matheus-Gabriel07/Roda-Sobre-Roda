package controller;

import java.io.IOException;
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

@WebServlet({ "/Controller", "/main", "/validaLogin", "/insert", "/aluguel", "/user" })
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

		try {
			String action = request.getServletPath();
			if (action.equals("/main")) {
				homePage(request, response);
			} else if (action.equals("/validaLogin")) {
				validaLogin(request, response);
			} else if (action.equals("/insert")) {
				novoUsuario(request, response);
			} else if (action.equals("/aluguel")) {
				ExibirAluguel(request, response);
			} else if (action.equals("/user")) {
				redirectUser(request, response);
			} else {
				response.sendRedirect("./alerts/notFound.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect("./alerts/erroServer.html");
		}
	}

	// HOME PAGE
	// ----------------------------------------------------------------------------------------
	protected void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Criando um objeto que irá receber os dados Javabeans
		ArrayList<JavaBeans> lista = dao.listarVeiculos();

		// Encaminhar a lista ao documento home.jsp
		request.setAttribute("carros", lista);
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
	}

	protected void validaLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<UserBeans> listarUsuarios = dao.listarUser();
		String requestedUsername = request.getParameter("user");
		String requestedPassword = request.getParameter("password");

		boolean userFound = false;
		boolean passwordFound = false;
		boolean isAdmin = false;
		UserBeans loggedInUser = new UserBeans();

		for (UserBeans user : listarUsuarios) {
			if (user.getNome().equals(requestedUsername) && user.getSenha().equals(requestedPassword)) {
				userFound = true;
				passwordFound = true;

				loggedInUser.setIduser(user.getIduser());
				dao.selecionarUsuario(loggedInUser);
				// Verifica se o usuário é um administrador
				isAdmin = user.getIsAdmin().equals("true");
				break;
			}
		}

		if (userFound && passwordFound) {
			String script = "<script type='text/javascript'>loadingUser();</script>";
			response.getWriter().write(script);

			HttpSession session = request.getSession();
			session.setAttribute("loggedInUser", loggedInUser);

			homePage(request, response);
		} else if (!userFound) {
			String script = "<script type='text/javascript'>alert('Usuário inválido')</script>";
			response.getWriter().write(script);
		} else if (!passwordFound) {
			String script = "<script type='text/javascript'>alert('Senha inválida')</script>";
			response.getWriter().write(script);
		} else {
			String script = "<script type='text/javascript'>alert('Usuário ou Senha inválida')</script>";
			response.getWriter().write(script);
		}
	}
	// ---------------------------------------------------------------------------------------------------

	// CRUD - CREATE
	// -------------------------------------------------------------------------------

	// Novo Contato
	protected void novoUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// setar as variaveis JavaBeans
		usuario.setNome(request.getParameter("user"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("password"));

		// invocar o método inserirContato passando o objeto contato
		dao.inserirUsuario(usuario);

		dao.selecionarUsuario(usuario);
		usuario.setIduser(usuario.getIduser());

		HttpSession session = request.getSession();
		session.setAttribute("loggedInUser", usuario);

		String script = "<script type='text/javascript'>loadingUser();</script>";
		response.getWriter().write(script);

		// redirecionar para o documento home.jsp
		response.sendRedirect("./home.jsp");
	}
	// ---------------------------------------------------------------------------------------------

	// CRUD - READ

	// REDIRECIONAR PARA O ALUGUEL
	// -------------------------------------------------------------------
	protected void ExibirAluguel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Recebimento do id do contato que será editado
		String idcar = request.getParameter("idcar");
		System.out.println(idcar);
		// Setar a variável JavaBeans
		veiculo.setIdcar(idcar);
		// Executar o método selecionarContato (DAO)
		dao.selecionarVeiculo(veiculo);

		// Setar os atributos do formulário com o conteúdo JavaBeans
		request.setAttribute("idcon", veiculo.getIdcar());
		request.setAttribute("nome", veiculo.getMarca());
		request.setAttribute("fone", veiculo.getTipo());
		request.setAttribute("email", veiculo.getModelo());
		request.setAttribute("email", veiculo.getCor());
		request.setAttribute("email", veiculo.getAno());
		request.setAttribute("email", veiculo.getFotoPrin());
		request.setAttribute("email", veiculo.getFotoSec());
		request.setAttribute("email", veiculo.getDescricao());
		request.setAttribute("email", veiculo.getDiaria());
		request.setAttribute("email", veiculo.getAvaliacao());
		// Encaminhar ao documento aluguel.jsp
		RequestDispatcher rd = request.getRequestDispatcher("Alugar.jsp");
		rd.forward(request, response);

	}

	protected void redirectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}
}
