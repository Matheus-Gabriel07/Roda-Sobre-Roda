package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class DAO {

	/* Módulo de Conexão */
	// Parâmetros de conexão

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/dbrodas_sobre_rodas?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "admin";

	// métodos de conexão

	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/* CRUD Read */

	public ArrayList<JavaBeans> listarVeiculos() {

		// Criando um objeto para acessar a classa JavaBeans
		ArrayList<JavaBeans> veiculos = new ArrayList<>();
		String read = "Select * from carros order by marca";

		try {

			// Abrindo Conexão com o Banco de Dados
			Connection con = conectar();

			// Preparar a query para a execução no banco de dados
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();

			// O laço abaixo será executado enquanto houver veiculos a serem listados

			while (rs.next()) {

				// Variáveis de apoio que recebem os dados da Data Base
				String idcar = rs.getString(1);
				String marca = rs.getString(2);
				String tipo = rs.getString(3);
				String modelo = rs.getString(4);
				String cor = rs.getString(5);
				String ano = rs.getString(6);
				String fotoPrin = rs.getString(7);
				String fotoSec = rs.getString(8);
				String descricao = rs.getString(9);
				String diaria = rs.getString(10);
				String avaliacao = rs.getString(11);

				// populando o arraylist
				veiculos.add(new JavaBeans(idcar, marca, tipo, modelo, cor, ano, fotoPrin, fotoSec, descricao, diaria,
						avaliacao));
			}
			con.close();
			return veiculos;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public ArrayList<UserBeans> listarUser() {
		// Criando um objeto para acessar a classa JavaBeans
		ArrayList<UserBeans> usuarios = new ArrayList<>();
		String read = "Select * from usuarios";

		try {
			// Abrindo Conexão com o Banco de Dados
			Connection con = conectar();

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
				usuarios.add(new UserBeans(imagem, nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin));
			}

			con.close();
			return usuarios;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/*-------------------------------
	 * 			CRUD - READ
	 * 			  Usuários
	 * ------------------------------*/
	public void selecionarUsuario(UserBeans usuario) {
		String read2 = "select * from usuarios where iduser = ?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setString(1, usuario.getIduser());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				usuario.setIduser(rs.getString(1));
				usuario.setNome(rs.getString(2));
				usuario.setEmail(rs.getString(3));
				usuario.setSenha(rs.getString(4));
				usuario.setVeiAlugados(rs.getString(5));
				usuario.setVeiDevolvidos(rs.getString(6));
				usuario.setImagem(rs.getString(7));
				usuario.setIsAdmin(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*-------------------------------
	 * 			CRUD - CREATE
	 * 			  Usuários
	 * ------------------------------*/
	public void inserirUsuario(UserBeans usuario) {

		String create = "insert into usuarios(nome, email,senha,veiAlugados,veiDevolvidos,imagem, isAdmin) values (?,?,?,0,0,?,?);";
		try {
			// abrir a conexão com o banco
			Connection con = conectar();
			// Preparar a query para execução no banco de dados
			PreparedStatement pst = con.prepareStatement(create);
			// Substituir os parâmetros (?) pelo conteúdo das variáveis JavaBeans
			pst.setString(1, usuario.getNome());
			pst.setString(2, usuario.getEmail());
			pst.setString(3, usuario.getSenha());
			pst.setString(4, generateImage(usuario.getNome()));
			pst.setString(5, "false");
			// Executar a Query
			pst.executeUpdate();
			// Encerrar a conexão com o Banco de dados
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String generateImage(String userName) throws IOException {
		int width = 400;
		int height = 400;
		int circleWidth = height;

		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = bufferedImage.createGraphics();

		g2d.setColor(Color.white);
		g2d.fillRect(0, 0, width, height);

		g2d.setColor(Color.yellow);
		g2d.fillOval(0, 0, circleWidth, height);
		g2d.setColor(Color.black);
		g2d.setFont(new Font("TimesRoman", Font.PLAIN, 100));
		g2d.drawString(userName, 120, 120);
		g2d.dispose();

		File file = new File("myimage.png");
		ImageIO.write(bufferedImage, "png", file);
		file = new File("myimage.jpg");
		ImageIO.write(bufferedImage, "jpg", file);
		ImageIO.write(bufferedImage, "jpg", file);

		return file.toString();
	}

	/*-------------------------------
	 * 			CRUD - UPDATE
	 * 			  Usuários
	 * ------------------------------*/
	public void atualizarUsuario(UserBeans usuario) {
		String update = "update contatos set nome=?,email=?,senha=? where idcon=?\"";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, usuario.getNome());
			pst.setString(2, usuario.getEmail());
			pst.setString(3, usuario.getSenha());
			pst.setString(4, usuario.getIduser());
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*-------------------------------
	 * 			CRUD - DELETE
	 * 			  Usuários
	 * ------------------------------*/
	public void deletarUsuários(UserBeans usuario) {
		String delete = "delete from usuarios where iduser=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setString(1, usuario.getIduser());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*-------------------------------
	 * 			CRUD - READ
	 * 			  Veiculo
	 * ------------------------------*/
	public void selecionarVeiculo(JavaBeans veiculo) {
		String read2 = "select * from usuarios where iduser = ?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setString(1, veiculo.getIdcar());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				veiculo.setIdcar(rs.getString(1));
				veiculo.setMarca(rs.getString(2));
				veiculo.setTipo(rs.getString(3));
				veiculo.setModelo(rs.getString(4));
				veiculo.setCor(rs.getString(5));
				veiculo.setAno(rs.getString(6));
				veiculo.setFotoPrin(rs.getString(7));
				veiculo.setFotoSec(rs.getString(8));
				veiculo.setDescricao(rs.getString(9));
				veiculo.setDiaria(rs.getString(10));
				veiculo.setAvaliacao(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}