function loadingUser(event) {
  event.preventDefault();
  document.querySelector(".root").classList.add("fade-out");
  setTimeout(function () {
    document.querySelector(".root").classList.remove("fade-out");

    document.querySelector(".root").innerHTML =
      "<div class='lds-dual-ring'></div><h1 class='loding'>Aguarde o pit stop virtual. Logo, teremos as melhores opções!</h1>";

      setTimeout(function () {
        window.location.href = event.target.action;
      }, 2500);
  }, 500);
};

function loadingADM(event) {
  event.preventDefault();
  document.querySelector(".root").classList.add("fade-out");
  document.querySelector(".root").classList.add("adm");
  setTimeout(function () {
    document.querySelector(".root").classList.remove("fade-out");

    document.querySelector(".root").innerHTML =
      "<div class='lds-dual-ring'></div><h1 class='loding'>Carregando o cockpit administrativo. Seu controle total está a caminho!</h1>";

      setTimeout(function () {
        window.location.href = event.target.action;
      }, 5000);
  }, 500);
};