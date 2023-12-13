<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Roda Sobre Roda</title>
<link rel="stylesheet" href="./style/settings/root.css" />
<link rel="stylesheet" href="./style/settings/navbar.css" />
<link rel="stylesheet" href="./style/homePage.css" />
<link rel="shortcut icon" href="./assets/Logo-RSR.png" type="image/x-icon" />
<% DAO dao = new DAO();
	ArrayList<JavaBeans> veiculos = dao.listarVeiculos();
%>
</head>
<body>
<main class="root">
      <section class="container-main">
        <!-- Header Main -->
        <header class="container-highlight">
          <div class="container-highlight-details">
            <h3 class="title-highlight">Lorem</h3>
            <p class="description-highlight">
              <% %>
            </p>
          </div>
          <div class="container-highlight-button">
            <button id="alugar" onclick="escolha()">Alugar</button>
          </div>
        </header>

        <h1 id="saudacaoUser">Olá, <% %></h1>

        <!-- Sessões -->

        <section class="container-categories">
          <h3 class="title-categorie">Veiculos mais alugados</h3>
      		<% if (veiculos != null) { %>
    			<% for (int i = 0; i < veiculos.size(); i++) { %>
        		<figure class="containner-card-vehicle">
            	<img src='<%=veiculos.get(i).getFotoPrin()%>'
	            	alt="vehicle"
	            	class="card-vehicle-img"/>
	          <div class="containner-card-vehicle-details">
	            <h3 class="card-vehicle-title"><%=veiculos.get(i).getModelo() %></h3>
	            <p class="card-vehicle-paragraph-details">
	            <%=veiculos.get(i).getDescricao()%>
	            </p>
	            <div class="container-card-vehicle-button">
	              <a href="#" class="button-alugar">Alugar</a>
	            </div>
	          </div>
	      </figure>
      		<%}}else {%>
      	<p>Not found</p>
      	<%} %>
        </section>
      </section>
    </main>

    <script src="./scripts/navbar.js"></script>
    <script src="./scripts/menu.js"></script>
</body>
</html>