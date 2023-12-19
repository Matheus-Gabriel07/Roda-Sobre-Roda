<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="controller.Controller"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Roda Sobre Roda</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

<link rel="stylesheet" href="./style/section.css">
<link rel="stylesheet" href="./style/card.css">
<link rel="stylesheet" href="./style/indexHome.css">
<link rel="stylesheet" href="./style/settings/root.css">
<link rel="stylesheet" href="./style/settings/navbar.css">
<style>
figure.containner-card-vehicle {
	padding: 0.8rem 0;
	padding-inline: 1rem;
	border: 0;
	border-radius: 1rem;
	display: flex;
	align-self: center;
	width: 450px;
	background: var(--white-smoke);
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.25);
}

img.card-vehicle-img {
	width: 150px;
	height: 180px;
	object-fit: cover;
}
</style>
</head>
<%
DAO dao = new DAO();
ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
%>
<body>

	<section class="module_parallax">
		<div class="container_logo">
			<h3>Aluguel de Veículos</h3>
			<img src="./assets/Logo-RSR-N.png" alt="logo"
				class="container_logo_image" />
			<p class="container_logo_paragraph">"Liberdade em cada rota"</p>
		</div>
		<div class="container_button">
			<button onclick="scrollDown()">
				<i class="fi fi-rr-angle-small-down"></i>
			</button>
		</div>
	</section>

	<main id="root">
		<nav class="container-navbar desktop index" id="navbar">
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
						<button onclick="scrollDown()" class="button_alugar">Alugar</button>
					</div>
					<div class="tooltip">
						<a href="./login.html" class="button_entrar">Entrar</a> <span
							class="tooltip-content">Faça o login agora!</span>
					</div>
				</div>
			</div>
		</nav>

		<nav class="container-navbar-media-device index">
			<div class="navbar-box-device">
				<div class="menu">
					<div class="tooltip">
						<i class="fi fi-rr-home"></i> <span class="tooltip-content">Inicio</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-car"></i> <span class="tooltip-content">Alugar</span>
					</div>
				</div>
			</div>
		</nav>

		<section class="module_main">
			<section class="container_wrapper_highlights">
				<div class="slides">
					<%
					for (int i = 0; i <= 4; i++) {
					%>
					<header class="container-highlight slide"
						style='background: url("<%=veiculos.get(1).getFotoPrin()%>");'>
						<div class="container-highlight-details">
							<h3 class="title-highlight"><%=veiculos.get(1).getModelo()%></h3>
							<p class="description-highlight">
								<%=veiculos.get(1).getDescricao()%>
							</p>
						</div>
						<div class="container-highlight-button">
							<a id="alugar"
								href="alugar.jsp?idCar=<%=veiculos.get(1).getIdcar()%>&index=<%=1%>">Alugar</a>
						</div>
					</header>
					<%
					}
					%>
				</div>

				<div class="controls">
					<div class="control prev-slide">&#9668;</div>
					<div class="control next-slide">&#9658;</div>
				</div>
			</section>

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

			<section class="container-section-vehicle">
				<div class="container-section-details">
					<h3>Partiu Viajar!</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<%
						for (int i = 12; i <= 16; i++) {
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
					<h3>Semi-novos</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<%
						for (int i = 17; i <= 20; i++) {
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
	<script>
	function scrollDown() {
		// Obtém a referência da seção alvo
		const targetSection = document.getElementById('sectionCategories');

		// Usa o método `scrollIntoView` com o comportamento suave
		targetSection.scrollIntoView({ behavior: 'smooth' });
	}
	
	</script>
</body>
</html>