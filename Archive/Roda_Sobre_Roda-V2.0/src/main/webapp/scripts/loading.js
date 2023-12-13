document.querySelector("form").addEventListener("submit", function (event) {
  event.preventDefault();
  document.querySelector(".root").classList.add("fade-out");
  setTimeout(function () {
    document.querySelector(".root").classList.remove("fade-out");

    document.querySelector(".root").innerHTML =
      "<div class='lds-dual-ring'></div><h1 class='loding'>Carregando...</h1>";

      setTimeout(function () {
        window.location.href = event.target.action;
      }, 2000);
  }, 500);
});
