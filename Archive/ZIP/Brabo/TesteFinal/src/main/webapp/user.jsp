<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
    DAO dao = new DAO();
    ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
        UserBeans loggedInUser = (UserBeans) request.getAttribute("loggedInUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RSR</title>
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/user.css" />
<link rel="stylesheet" href="./style/settings/navbar.css" />
<link rel="shortcut icon" href="./assets/Logo-RSR.png"
	type="image/x-icon" />
</head>
<body>
	<main class="root">
		<nav class="container-navbar desktop" id="navbar">
			<!-- Linha 2 -->
			<div class="navbar-box">
				<!-- Linha 3 -->
				<div class="navbar-left">
					<img src="./assets/Logo-RSR-R.png" alt="Logo-RSR" class="logo-nav">
					<div class="container-search">
						<i class="fi fi-rr-search"></i> <input type="search" name="search"
							id="search" placeholder="Digite um veículo que deseja alugar">
					</div>
				</div>
				<!-- Linha 4 -->
				<div class="navbar-right">
					<div class="tooltip">
						<i class="fi fi-rr-car" onclick="window.location.href = 'main';"></i> <span class="tooltip-content">Alugar</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-settings" onclick="window.location.href = './alerts/notFound.html';"></i> <span class="tooltip-content">Configurações</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-exit" onclick="window.location.href = './index.html';"></i> <span class="tooltip-content"
							onclick="window.location.href = './index.html';">Sair</span>
					</div>
					<img
						src="./assets/placeholder.png"
						alt="user" id="userPhoto" onclick="window.location.href = 'user';">
				</div>
			</div>
		</nav>

		<!-- Linha 5 -->
		<nav class="container-navbar-media-device">
			<!-- Linha 6 -->
			<div class="navbar-box-device">
				<img
					src="https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D"
					alt="user" id="userPhoto" onclick="window.location.href = '#1';">
				<!-- Linha 7 -->
				<div class="menu">
					<div class="tooltip">
						<i class="fi fi-rr-home"></i> <span class="tooltip-content">Inicio</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-car"></i> <span class="tooltip-content">Alugar</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-settings"></i> <span class="tooltip-content"
							onclick="window.location.href = '#2';">Configurações</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-exit"></i> <span class="tooltip-content"
							onclick="window.location.href = '/Index/index.html';">Sair</span>
					</div>
				</div>
			</div>
		</nav>

      <section class="display-user">
        <div class="side-left">
            <img src="./assets/placeholder.png" alt="userPhoto" class="userPhotoPerfil">
            <div class="side-left-infomations">
                <h1 id="userName">Lorem</h1>
                <p id="emailUser">Lorem@lorem</p>
                <a href="/edit">Editar perfil</a>
            </div>
        </div>
        <div class="side-right">
            <div class="cva">
                <p>Veiculos Alugados</p>
                <span id="qnt-cva">0</span>
            </div>
            <div class="cvd">
                <p>Veiculos devolvidos</p>
                <span id="qnt-cvd">0</span>
            </div>
        </div>
    </section>
    <section class="veichle-details">
    </section>
	</main>

	<script src="./scripts/menu.js"></script>
</body>
</html>