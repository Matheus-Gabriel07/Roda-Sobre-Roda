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

@WebServlet({ "/Controller", "/main", "/insert", "/aluguel" })
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
		}else if (action.equals("/aluguel")) {
			ExibirAluguel(request, response);
		} else {
			response.sendRedirect("index.html");
		}
	}

	// HOME PAGE ----------------------------------------------------------------------------------------
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

		// redirecionar para o documento home.jsp
		response.sendRedirect("./login.html");

	}
	// ---------------------------------------------------------------------------------------------
	
	// CRUD - READ
	
	//REDIRECIONAR PARA O ALUGUEL -------------------------------------------------------------------
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
}
