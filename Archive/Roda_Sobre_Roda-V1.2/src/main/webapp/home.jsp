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
        </section>
      </section>
    </main>

    <script src="./scripts/navbar.js"></script>
    <script src="./scripts/menu.js"></script>
    <script src="./scripts/firstLoading.js"></script>
</body>
</html>