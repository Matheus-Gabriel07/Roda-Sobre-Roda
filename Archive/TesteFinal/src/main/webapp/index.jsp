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
</head>
<%
DAO dao = new DAO();
ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
%>
<body>

	<section class="module_parallax">
		<div class="container_logo">
			<h3>Aluguel de Veículos</h3>
			<img src="/Assets/Logo-RSR-N.png" alt="logo"
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
					<img src="/Assets/Logo-RSR-R.png" alt="Logo-RSR" class="logo-nav">
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
										href="alugar?idCar=<%=veiculos.get(i).getIdcar()%>&index=<%=i%>"
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
	<script src="./scripts/slider.js"></script>
	<script src="./scripts/sliderHighlights.js"></script>
	<script src="./scripts/menu.js"></script>
	<script src="./scripts/scroll.js"></script>
</body>

</html>