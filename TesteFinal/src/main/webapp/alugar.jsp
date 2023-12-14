<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/navbar.css" />
<link rel="stylesheet" href="./style/veichlePage.css">
<link rel="shortcut icon" href="./assets/Logo-RSR.png"
	type="image/x-icon" />
<title>RSR - Alugar</title>
</head>
<%
	//Recupera o �ndice da URL
	int index = Integer.parseInt(request.getParameter("index"));
	DAO dao = new DAO();
	ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
	JavaBeans veiculoSelecionado = veiculos.get(index);

%>
<body>
	<main id="root">
		<nav class="container-navbar">
			<div class="navbar-box">
			  <div class="navbar-left">
				<img
				  src="/Assets/Logo-RSR-R.png"
				  alt="Logo-RSR" class="logo-nav"
				  />
				<div class="container-search">
				  <i class="fi fi-rr-search"></i>
				  <input
					type="search"
					name="search"
					id="search"
					placeholder="Digite um veiculo que deseja alugar"
				  />
				</div>
			  </div>
			  <div class="navbar-right">
				<img src='<%= loggedInUser.getImagem()' alt="user" onclick="window.location.href='./user.jsp'" />
				<i class="fi fi-rr-car" onclick="scrollDown()"></i>
				<i
				  class="fi fi-rr-settings"
				  onclick="window.location.href='./alerts/notFound.html'"
				></i>
				<i class="fi fi-rr-exit" onclick="window.Location.href='./index.html'"></i>
			  </div>
			</div>
		  </nav>

		<div class="container-veichle">
			<div class="container-veichle-gallery">
				<img src="<%=veiculoSelecionado.getFotoPrin()%>" alt="main image"
					id="imgPri" />
			</div>
			<div class="container-veichle-details">
				<a href="/main" class="voltar">Voltar</a>
				<div class="conatiner-description">
					<h1><%=veiculoSelecionado.getModelo()%></h1>
					<div class="stars">
						<i class="fi fi-rr-star"></i> <i class="fi fi-rr-star"></i> <i
							class="fi fi-rr-star"></i> <i class="fi fi-rr-star"></i> <i
							class="fi fi-rr-star"></i> <span class="general-stars">0</span>
					</div>
					<p class="description-veichle">
						<%=veiculoSelecionado.getDescricao()%>
					</p>
					<div class="especificacoes-veichle">
						<div class="cir-1">
							<div class="circle">
								<p id="cor"><%=veiculoSelecionado.getCor()%></p>
							</div>
						</div>
						<div class="cir-2">
							<div class="circle">
								<p id="modelo"><%=veiculoSelecionado.getMarca()%></p>
							</div>
						</div>
						<div class="cir-3">
							<div class="circle">
								<p id="ano"><%=veiculoSelecionado.getAno()%></p>
							</div>
						</div>
						<div class="cir-4">
							<div class="circle">
								<p id="marca"><%=veiculoSelecionado.getMarca()%></p>
							</div>
						</div>
					</div>
					<div class="container-value-alugar">
						<h3 class="valor-diaria"><%=veiculoSelecionado.getDiaria()%></h3>
						<button id="alugar">Alugar</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="/scripts/menu.js"></script>
</body>
</html>
