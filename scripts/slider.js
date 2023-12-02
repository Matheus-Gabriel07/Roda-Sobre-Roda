const carousels = document.querySelectorAll(".carousel");

const activateCarousel = (carouselId) => {
    carousels.forEach((carousel) => {
        if (carousel.id === carouselId) {
            carousel.classList.add("active");
        } else {
            carousel.classList.remove("active");
        }
    });
};

const showHideIcons = (carousel) => {
    const scrollWidth = carousel.scrollWidth - carousel.clientWidth;
    const arrowIcons = carousel.parentNode.querySelectorAll(".fa-angle-left, .fa-angle-right");
    arrowIcons[0].style.display = carousel.scrollLeft === 0 ? "none" : "block";
    arrowIcons[1].style.display = carousel.scrollLeft === scrollWidth ? "none" : "block";
};

carousels.forEach((carousel) => {
    carousel.addEventListener("click", (e) => {
        const carouselId = e.currentTarget.id;
        activateCarousel(carouselId);
    });

    const arrowIcons = carousel.parentNode.querySelectorAll(".fa-angle-left, .fa-angle-right");

    arrowIcons.forEach((icon) => {
        icon.addEventListener("click", () => {
            const firstImgWidth = carousel.querySelector("figure").clientWidth + 14;
            carousel.scrollLeft += icon.classList.contains("fa-angle-left") ? -firstImgWidth : firstImgWidth;
            setTimeout(() => showHideIcons(carousel), 60);
        });
    });

    let isDragStart = false,
        isDragging = false,
        prevPageX,
        prevScrollLeft,
        positionDiff;

    const autoSlide = () => {
        if (carousel.scrollLeft - (carousel.scrollWidth - carousel.clientWidth) > -1 || carousel.scrollLeft <= 0) return;

        positionDiff = Math.abs(positionDiff);
        let firstImgWidth = carousel.querySelector("figure").clientWidth + 14;
        let valDifference = firstImgWidth - positionDiff;

        if (carousel.scrollLeft > prevScrollLeft) {
            return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
        }

        carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
    };

    const dragStart = (e) => {
        isDragStart = true;
        prevPageX = e.pageX || e.touches[0].pageX;
        prevScrollLeft = carousel.scrollLeft;
    };

    const dragging = (e) => {
        if (!isDragStart) return;
        e.preventDefault();
        isDragging = true;
        carousel.classList.add("dragging");
        positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
        carousel.scrollLeft = prevScrollLeft - positionDiff;
        showHideIcons(carousel);
    };

    const dragStop = () => {
        isDragStart = false;
        carousel.classList.remove("dragging");

        if (!isDragging) return;
        isDragging = false;
        autoSlide();
    };

    carousel.addEventListener("mousedown", dragStart);
    carousel.addEventListener("touchstart", dragStart);

    document.addEventListener("mousemove", dragging);
    carousel.addEventListener("touchmove", dragging);

    document.addEventListener("mouseup", dragStop);
    carousel.addEventListener("touchend", dragStop);
});
