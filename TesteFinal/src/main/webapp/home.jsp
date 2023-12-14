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

			<h1 id="saudacaoUser">Olá, placeholder</h1>

			<!-- Sess�es -->

			<section class="container-categories">
				<h3 class="title-categorie">Veiculos mais alugados</h3>
				<div class="wapper">
					<%
					for (int i = 0; i < veiculos.size(); i++) {
					%>
					<figure class="containner-card-vehicle">
						<img src='<%=veiculos.get(i).getFotoPrin()%>' alt="vehicle"
							class="card-vehicle-img" />
						<div class="containner-card-vehicle-details">
							<h3 class="card-vehicle-title"><%=veiculos.get(i).getModelo()%></h3>
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
			</section>
		</section>
	</main>

	<script src="./scripts/navbar.js"></script>
	<script src="./scripts/menu.js"></script>
</body>
</html>