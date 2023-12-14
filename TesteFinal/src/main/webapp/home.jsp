<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Roda Sobre Roda</title>
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/settings/card.css" />
<link rel="stylesheet" href="./style/section.css">
<link rel="stylesheet" href="./style/settings/navbar.css" />
<link rel="stylesheet" href="./style/homePage.css" />
<link rel="shortcut icon" href="./assets/Logo-RSR.png"
	type="image/x-icon" />
</head>
<%
DAO dao = new DAO();
ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
	UserBeans loggedInUser = (UserBeans) request.getAttribute("loggedInUser");
%>
<body>
<main class="root">
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

      <section class="container-main">
        <!-- Header Main -->
        <header class="container-highlight" style='background: url("<%= veiculos.get(1).getFotoPrin()%>");'>
          <div class="container-highlight-details">
            <h3 class="title-highlight"><%= veiculos.get(1).getModelo() %></h3>
            <p class="description-highlight">
              <%= veiculos.get(1).getDescricao() %>
            </p>
          </div>
          <div class="container-highlight-button">
            <button id="alugar" onclick="window.location.href = './alugar.jsp'">Alugar</button>
          </div>
        </header>

			<h1 id="saudacaoUser">Olá, loggedInUser.getNome()</h1>

			<!-- Sess�es -->

			<section class="container-categories">
				<div class="container-section-details">
					<h3>Veiculos mais alugados</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<% for (int i=0; i <=10; i++) { %>
							<figure class="containner-card-vehicle">
								<img src='<%=veiculos.get(i).getFotoPrin()%>' alt="vehicle" class="card-vehicle-img" />
								<div class="containner-card-vehicle-details">
									<h3 class="card-vehicle-title">
										<%=veiculos.get(i).getModelo()%>
									</h3>
									<p class="card-vehicle-paragraph-details">
										<%=veiculos.get(i).getDescricao()%>
									</p>
									<div class="container-card-vehicle-button">
										<a href="aluguel?idCar=<%=veiculos.get(i).getIdcar()%>&index=<%=i%>"
											class="button-alugar">Alugar</a>
									</div>
								</div>
							</figure>
							<% } %>
					</div>
					<i class="fi fi-rr-angle-right" id="right"></i>
				</div>
			</section>

			<section class="container-categories">
				<div class="container-section-details">
					<h3>Adicionados recentemente</h3>
				</div>
				<div class="wrapper">
					<i class="fi fi-rr-angle-left" id="left"></i>
					<div class="carousel">
						<% for (int i=10; i <= lista.slize(); i++) { %>
							<figure class="containner-card-vehicle">
								<img src='<%=veiculos.get(i).getFotoPrin()%>' alt="vehicle" class="card-vehicle-img" />
								<div class="containner-card-vehicle-details">
									<h3 class="card-vehicle-title">
										<%=veiculos.get(i).getModelo()%>
									</h3>
									<p class="card-vehicle-paragraph-details">
										<%=veiculos.get(i).getDescricao()%>
									</p>
									<div class="container-card-vehicle-button">
										<a href="aluguel?idCar=<%=veiculos.get(i).getIdcar()%>&index=<%=i%>"
											class="button-alugar">Alugar</a>
									</div>
								</div>
							</figure>
							<% } %>
					</div>
					<i class="fi fi-rr-angle-right" id="right"></i>
				</div>
			</section>
		</section>
	</main>

	<script src="./scripts/menu.js"></script>
</body>
</html>