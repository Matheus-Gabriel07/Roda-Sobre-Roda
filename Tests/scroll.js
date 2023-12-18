function scrollDown() {
    // Obtém a referência da seção alvo
    const targetSection = document.getElementById('sectionCategories');

    // Usa o método `scrollIntoView` com o comportamento suave
    targetSection.scrollIntoView({ behavior: 'smooth' });
  }