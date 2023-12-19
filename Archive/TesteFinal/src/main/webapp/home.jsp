<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Roda Sobre Roda</title>
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/section.css">
<link rel="stylesheet" href="./style/card.css" />
<link rel="stylesheet" href="./style/homePage.css" />
<link rel="stylesheet" href="./style/settings/navbar.css" />
<link rel="shortcut icon" href="./assets/Logo-RSR.png"
	type="image/x-icon" />
</head>
<%
DAO dao = new DAO();
ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
UserBeans loggedInUser = (UserBeans)request.getAttribute("loggedInUser");
%>
<body>
	<main class="root">
		<nav class="container-navbar desktop" id="navbar">
			<div class="navbar-box">
				<div class="navbar-left">
					<img src="./assets/Logo-RSR-R.png" alt="Logo-RSR" class="logo-nav">
					<div class="container-search">
						<i class="fi fi-rr-search"></i> <input type="search" name="search"
							id="search" placeholder="Digite um veículo que deseja alugar">
					</div>
				</div>
				<div class="navbar-right">
					<div class="tooltip">
						<i class="fi fi-rr-car" onclick="window.location.href = 'home.jsp';"></i> <span class="tooltip-content">Alugar</span>
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

		<nav class="container-navbar-media-device">
			<div class="navbar-box-device">
				<img
					src="https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D"
					alt="user" id="userPhoto" onclick="window.location.href = '#1';">
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

		<section class="container-main">
			<header class="container-highlight"
				style='background: url("<%=veiculos.get(1).getFotoPrin()%>");'>
				<div class="container-highlight-details">
					<h3 class="title-highlight"><%=veiculos.get(1).getModelo()%></h3>
					<p class="description-highlight">
						<%=veiculos.get(1).getDescricao()%>
					</p>
				</div>
				<div class="container-highlight-button">
					<a id="alugarHighlight"
						href="alugar.jsp?idCar=<%=veiculos.get(1).getIdcar()%>&index=<%=1%>">Alugar</a>
				</div>
			</header>

			<h1 id="saudacaoUser">Olá <%=loggedInUser.getNome() %>!</h1>

			<!-- Sessões -->
			<section class="container-section-vehicle" id="sectionCategories">
				<div class="container-section-details">
					<h3>Carros Populares</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<%
						for (int i = 5; i <= 8; i++) {
						%>
						<figure class="containner-card-vehicle">
							<img src='<%=veiculos.get(i).getFotoPrin()%>' alt="vehicle"
								class="card-vehicle-img" />
							<div class="containner-card-vehicle-details">
								<h3 class="card-vehicle-title">
									<%=veiculos.get(i).getModelo()%>
								</h3>
								<p class="card-vehicle-paragraph-details">
									<%=veiculos.get(i).getDescricao()%>
								</p>
								<div class="container-card-vehicle-button">
									<a
										href="aluguel?idCar=<%=veiculos.get(i).getIdcar()%>&index=<%=i%>"
										class="button-alugar">Alugar</a>
								</div>
							</div>
						</figure>
						<%
						}
						%>

					</div>
					<i class="fi fi-rr-angle-right" id="right"></i>
				</div>
			</section>

			<section class="container-section-vehicle">
				<div class="container-section-details">
					<h3>Motos</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<%
						for (int i = 9; i <= 12; i++) {
						%>
						<figure class="containner-card-vehicle">
							<img src='<%=veiculos.get(i).getFotoPrin()%>' alt="vehicle"
								class="card-vehicle-img" />
							<div class="containner-card-vehicle-details">
								<h3 class="card-vehicle-title">
									<%=veiculos.get(i).getModelo()%>
								</h3>
								<p class="card-vehicle-paragraph-details">
									<%=veiculos.get(i).getDescricao()%>
								</p>
								<div class="container-card-vehicle-button">
									<a
										href="aluguel?idCar=<%=veiculos.get(i).getIdcar()%>&index=<%=i%>"
										class="button-alugar">Alugar</a>
								</div>
							</div>
						</figure>
						<%
						}
						%>
					</div>
					<i class="fi fi-rr-angle-right" id="right"></i>
				</div>
			</section>
		</section>
	</main>
	<script src="./scripts/menu.js"></script>
	<script src="./scripts/slider.js"></script>
</body>
</html>