<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
// Recupera o índice da URL
int index = Integer.parseInt(request.getParameter("index"));

DAO dao = new DAO();
ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
JavaBeans veiculoSelecionado = veiculos.get(index);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./style/settings/root.css" />
    <link rel="stylesheet" href="./style/settings/navbar.css" />
    <link rel="stylesheet" href="./style/veichlePage.css">
    <link rel="shortcut icon" href="./assets/Logo-RSR.png" type="image/x-icon" />
    <title>RSR - Alugar</title>
  </head>
  <body>
    <main id="root">
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
						<i class="fi fi-rr-car" onclick="window.location.href = 'home.jsp';"></i> <span class="tooltip-content">Alugar</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-settings" onclick="window.location.href = './alerts/notFound.html';"></i> <span class="tooltip-content">Configurações</span>
					</div>
					<div class="tooltip">
						<i class="fi fi-rr-exit" onclick="window.location.href = './alerts/notFound.html';"></i> <span class="tooltip-content"
							onclick="window.location.href = './index.html';">Sair</span>
					</div>
					<img
						src="./assets/placeholder.png"
						alt="user" id="userPhoto" onclick="window.location.href = '#1';">
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
		
     <div class="container-veichle">
        <div class="container-veichle-gallery">
          <img src="<%=veiculoSelecionado.getFotoPrin()%>" alt="main image" id="imgPri" />
        </div>
        <div class="container-veichle-details">
          <a href="#" onclick="window.history.back()" class="voltar">Voltar</a>
          <div class="conatiner-description">
            <h1><%=veiculoSelecionado.getModelo() %></h1>
            <div class="stars">
                <i class="fi fi-rr-star"></i>
                <i class="fi fi-rr-star"></i>
                <i class="fi fi-rr-star"></i>
                <i class="fi fi-rr-star"></i>
                <i class="fi fi-rr-star"></i>
              <span class="general-stars">0</span>
            </div>
            <p class="description-veichle">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus
              magni, numquam praesentium quasi totam sequi. Unde, sequi maiores
              amet commodi repudiandae aperiam est, temporibus odio, minima
              nobis laudantium. Numquam, aperiam!
            </p>
            <div class="especificacoes-veichle">
              <div class="cir-1">
                <div class="circle">
                  <p id="cor"><%=veiculoSelecionado.getCor() %></p>
                </div>
              </div>
              <div class="cir-2">
                <div class="circle">
                  <p id="modelo"><%=veiculoSelecionado.getMarca() %></p>
                </div>
              </div>
              <div class="cir-3">
                <div class="circle">
                  <p id="ano"><%=veiculoSelecionado.getAno()%></p>
                </div>
              </div>
              <div class="cir-4">
                <div class="circle">
                  <p id="marca"><%=veiculoSelecionado.getAvaliacao()%></p>
                </div>
              </div>
            </div>
            <div class="container-value-alugar">
                <h3 class="valor-diaria"><%=veiculoSelecionado.getDiaria()%></h3>
                <button id="alugar" onclick="window.location.href='./alerts/manutencao.html'">Alugar</button>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script src="./scripts/menu.js"></script>
  </body>
</html>
