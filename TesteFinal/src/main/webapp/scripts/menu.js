window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.querySelector(".container-search").style.background =
      "var(--darkest-light-shadow)";
  } else {
    document.querySelector(".container-search").style.background =
      "var(--white-smoke)";
  }
}

function scrollDown() {
  let section = document.querySelectorAll(".container-categorie");
  section.scrollIntoView({ behavior: 'smooth' });
}