function showLoading() {
    document.getElementById('loading').style.display = 'block';
}

function hideLoading() {
    document.getElementById('loading').style.display = 'none';
}

function checkWindowSize() {
    if (localStorage.getItem('firstLoad') === null) {
        localStorage.setItem('firstLoad', 'false');
        showLoading(); 

        setTimeout(function() {
            hideLoading();
        }, 2000);
    } else {

        window.addEventListener('resize', showLoading);
        window.addEventListener('resize', hideLoadingAfterResize);
    }
}

function hideLoadingAfterResize() {
    hideLoading();
    window.removeEventListener('resize', showLoading);
    window.removeEventListener('resize', hideLoadingAfterResize);
}

document.addEventListener('DOMContentLoaded', checkWindowSize);