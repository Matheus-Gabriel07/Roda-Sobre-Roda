document.addEventListener("DOMContentLoaded", function () {
    const carousels = document.querySelectorAll(".carousel");

    carousels.forEach(carousel => {
        const firstImg = carousel.querySelectorAll("img")[0];
        const arrowIcons = carousel.parentElement.querySelectorAll(".fi-rr-angle-left, .fi-rr-angle-right");

        let isDragStart = false,
            isDragging = false,
            prevPageX,
            prevScrollLeft,
            positionDiff;

        const showHideIcons = () => {
            let scrollWidth = carousel.scrollWidth - carousel.clientWidth;
            arrowIcons[0].style.display = carousel.scrollLeft === 0 ? "none" : "block";
            arrowIcons[1].style.display = carousel.scrollLeft === scrollWidth ? "none" : "block";
        };

        arrowIcons.forEach(icon => {
            icon.addEventListener("click", (event) => {
                let firstImgWidth = firstImg.clientWidth + 14;
                // Verifique diretamente o ID do ícone clicado usando event.currentTarget.id
                carousel.scrollLeft += event.currentTarget.id === "left" ? -firstImgWidth : firstImgWidth;
                setTimeout(() => showHideIcons(), 60);
            });
        });

        const autoSlide = () => {
            if (carousel.scrollLeft - (carousel.scrollWidth - carousel.clientWidth) > -1 || carousel.scrollLeft <= 0) return;

            positionDiff = Math.abs(positionDiff);
            let firstImgWidth = firstImg.clientWidth + 14;
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
            showHideIcons();
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
});
