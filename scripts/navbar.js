/*  JS SETTINGS - Generator NAVBAR
    UTA: 05/12/23
    @author Matheus Gabriel
*/


function createNavbar() {
  const desktopNavbar = document.createElement("nav");
  desktopNavbar.className = "container-navbar desktop";
  desktopNavbar.id = "navbar";

  const navbarBox = document.createElement("div");
  navbarBox.className = "navbar-box";

  const navbarLeft = document.createElement("div");
  navbarLeft.className = "navbar-left";

  const logoImg = document.createElement("img");
  logoImg.src = "/Assets/Logo-RSR-R.png";
  logoImg.alt = "Logo-RSR";
  logoImg.className = "logo-nav";

  const searchContainer = document.createElement("div");
  searchContainer.className = "container-search";

  const searchIcon = document.createElement("i");
  searchIcon.className = "fi fi-rr-search";

  const searchInput = document.createElement("input");
  searchInput.type = "search";
  searchInput.name = "search";
  searchInput.id = "search";
  searchInput.placeholder = "Digite um veiculo que deseja alugar";

  searchContainer.appendChild(searchIcon);
  searchContainer.appendChild(searchInput);

  navbarLeft.appendChild(logoImg);
  navbarLeft.appendChild(searchContainer);

  const navbarRight = document.createElement("div");
  navbarRight.className = "navbar-right";

  function createTooltip(iconClass, content, clickFunction) {
    const tooltip = document.createElement("div");
    tooltip.className = "tooltip";

    const icon = document.createElement("i");
    icon.className = iconClass;
    if (clickFunction) {
      icon.onclick = clickFunction;
    }

    const tooltipContent = document.createElement("span");
    tooltipContent.className = "tooltip-content";
    tooltipContent.textContent = content;

    tooltip.appendChild(icon);
    tooltip.appendChild(tooltipContent);

    return tooltip;
  }

  navbarRight.appendChild(createTooltip("fi fi-rr-car", "Alugar"));
  navbarRight.appendChild(
    createTooltip("fi fi-rr-settings", "Configurações", function () {
      window.location.href = "#2";
    })
  );
  navbarRight.appendChild(
    createTooltip("fi fi-rr-exit", "Sair", function () {
      window.location.href = "/Index/index.html";
    })
  );

  const userImg = document.createElement("img");
  userImg.src =
    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D";
  userImg.alt = "user";
  userImg.id = "userPhoto";
  userImg.onclick = function () {
    window.location.href = "#1";
  };

  navbarRight.appendChild(userImg);

  navbarBox.appendChild(navbarLeft);
  navbarBox.appendChild(navbarRight);

  desktopNavbar.appendChild(navbarBox);

  const mediaDeviceNavbar = document.createElement("nav");
  mediaDeviceNavbar.className = "container-navbar-media-device";

  const navbarBoxDevice = document.createElement("div");
  navbarBoxDevice.className = "navbar-box-device";

  const userImgDevice = document.createElement("img");
  userImgDevice.src =
    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D";
  userImgDevice.alt = "user";
  userImgDevice.id = "userPhoto";
  userImgDevice.onclick = function () {
    window.location.href = "#1";
  };

  const menuContainer = document.createElement("div");
  menuContainer.className = "menu";

  menuContainer.appendChild(createTooltip("fi fi-rr-home", "Inicio"));
  menuContainer.appendChild(createTooltip("fi fi-rr-car", "Alugar"));
  menuContainer.appendChild(
    createTooltip("fi fi-rr-settings", "Configurações", function () {
      window.location.href = "#2";
    })
  );
  menuContainer.appendChild(
    createTooltip("fi fi-rr-exit", "Sair", function () {
      window.location.href = "/Index/index.html";
    })
  );

  navbarBoxDevice.appendChild(userImgDevice);
  navbarBoxDevice.appendChild(menuContainer);

  mediaDeviceNavbar.appendChild(navbarBoxDevice);

  document.body.appendChild(desktopNavbar);
  document.body.appendChild(mediaDeviceNavbar);
}

createNavbar();
