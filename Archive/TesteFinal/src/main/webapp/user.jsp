<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    DAO dao = new DAO();
    ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
    UserBeans loggedInUser = (UserBeans) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RSR - <%= loggedInUser.getNome()%></title>
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/settings/user.css" />
<link rel="stylesheet" href="./style/settings/navbar.css" />
<link rel="shortcut icon" href="./assets/Logo-RSR.png"
	type="image/x-icon" />
</head>
<body>
	<main class="root">
		<nav class="container-navbar">
			<div class="navbar-box">
				<div class="navbar-left">
					<img src="/Assets/Logo-RSR-R.png" alt="Logo-RSR" class="logo-nav" />
					<div class="container-search">
						<i class="fi fi-rr-search"></i> <input type="search" name="search"
							id="search" placeholder="Digite um veiculo que deseja alugar" />
					</div>
				</div>
				<div class="navbar-right">
					<img
						src='<%= loggedInUser.getImagem()%>' alt="user" onclick="window.location.href='./user.jsp'" />
            <i class="fi fi-rr-car" onclick="scrollDown()"></i>
            <i
              class="fi fi-rr-settings"
              onclick="window.location.href='./alerts/notFound.html'"
            ></i>
            <i class="fi fi-rr-exit" onclick="window.Location.href='./index.html'"></i>
          </div>
        </div>
      </nav>

      <section class="display-user">
        <div class="side-left">
            <img src="https://placehold.co/250" alt="userPhoto" class="userPhotoPerfil">
            <div class="side-left-infomations">
                <h1 id="userName"><%= loggedInUser.getNome()%></h1>
                <p id="emailUser"><%= loggedInUser.getEmail()%></p>
                <a href="/edit">Editar perfil</a>
            </div>
        </div>
        <div class="side-right">
            <div class="cva">
                <p>Veiculos Alugados</p>
                <span id="qnt-cva"><%= loggedInUser.getVeiAlugados()%></span>
            </div>
            <div class="cvd">
                <p>Veiculos devolvidos</p>
                <span id="qnt-cvd"><%= loggedInUser.getVeiDevolvidos()%></span>
            </div>
        </div>
    </section>
    <section class="veichle-details">
    </section>
	</main>

	<script src="./scripts/menu.js"></script>
</body>
</html>