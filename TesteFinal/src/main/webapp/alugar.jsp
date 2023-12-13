<%@page import="model.DAO"%>
<%@page import="model.JavaBeans"%>
<%@page import="model.UserBeans"%>
<%@page import="java.util.ArrayList"%>
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
    <link rel="shortcut icon" href="./assets/Logo-RSR.png" type="image/x-icon" />
    <title>RSR - Alugar</title>
  </head>
  <body>
    <main id="root">
      <div class="container-veichle">
        <div class="container-veichle-gallery">
          <img src="http://placehold.it/350x350" alt="main image" id="imgPri" />
        </div>
        <div class="container-veichle-details">
          <a href="/main" class="voltar">Voltar</a>
          <div class="conatiner-description">
            <h1>Lorem</h1>
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
                  <p id="cor">Cor</p>
                </div>
              </div>
              <div class="cir-2">
                <div class="circle">
                  <p id="modelo">Modelo</p>
                </div>
              </div>
              <div class="cir-3">
                <div class="circle">
                  <p id="ano">Ano</p>
                </div>
              </div>
              <div class="cir-4">
                <div class="circle">
                  <p id="marca">Marca</p>
                </div>
              </div>
            </div>
            <div class="container-value-alugar">
                <h3 class="valor-diaria">R$105,60 p/dia</h3>
                <button id="alugar">Alugar</button>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script src="/scripts/navbar.js"></script>
    <script src="/scripts/menu.js"></script>
  </body>
</html>
