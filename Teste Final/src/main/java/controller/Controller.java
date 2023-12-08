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


@WebServlet({"/Controller", "/main"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	JavaBeans veiculo = new JavaBeans();
       
    
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action = request.getServletPath();
		if(action.equals("/main")) {
			homePage(request, response);
		} else {
			dao.testeConexao();
			response.sendRedirect("index.html");
		}
	}
	
	protected void homePage(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 
        // Criando um objeto que irá receber os dados Javabeans
        ArrayList<JavaBeans> lista = dao.listarVeiculos();
 
        // Encaminhar a lista ao documento home.jsp
        request.setAttribute("carros", lista);
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
        rd.forward(request, response);
        
	}
	
public ArrayList<UserBeans> listarUser() {
    	
    	//Criando um objeto para acessar a classa JavaBeans
    	ArrayList<UserBeans> usuarios = new ArrayList<>();
    	String read = "Select * from usuarios";
    	
    	try {
    		
    		//Abrindo Conexão com o Banco de Dados
			Connection con = dao.conectar();
			
			
			// Preparar a query para a execução no banco de dados
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			
			// O laço abaixo será executado enquanto houver veiculos a serem listados
			
			while (rs.next()) {
				
				
				
				//Variáveis de apoio que recebem os dados da Data Base
				String iduser = rs.getString(1);
				String nome = rs.getString(2);
				String email = rs.getString(3);
				String senha = rs.getString(4);
				String veiAlugados = rs.getString(5); 
				String veiDevolvidos = rs.getString(6); 
				String imagem = rs.getString(7); 
				
				// populando o arraylist
				usuarios.add(new UserBeans (imagem, nome, email, senha, veiAlugados, veiDevolvidos, imagem));
			}
			
			
			if(usuarios.contains(request.getParameter("user"))) {
				
			}
			con.close();
			return usuarios;
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	
}
