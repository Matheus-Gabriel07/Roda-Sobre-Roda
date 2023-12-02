window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("navbar").style.top = "0.8rem";
    document.querySelector(".fi-rr-exit").style.display = "none";
    document.querySelector(".navbar-right").style.justifyContent = "flex-end";
    document.querySelector(".navbar-right").style.gap = "50px";
    document.querySelector("#userPhoto").style.marginRight = "2.25rem";
    document.querySelector(".container-search").style.background = "var(--darkest-light-shadow)";
  } else {
    document.getElementById("navbar").style.top = "10px";
    document.querySelector(".fi-rr-exit").style.display = "block";
    document.querySelector(".navbar-right").style.justifyContent = "space-evenly";
    document.querySelector(".navbar-right").style.gap = "0";
    document.querySelector("#userPhoto").style.marginRight = "0";
    document.querySelector(".container-search").style.background = "var(--white-smoke)";

    
  }
}