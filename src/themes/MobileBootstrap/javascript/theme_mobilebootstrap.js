function setImgClassResponsive(elementId) {
    // responsive images
    aImgElements = document.getElementById(elementId).getElementsByTagName("img");
    for (var i=0; i < aImgElements.length; i++) {
        imgEl = aImgElements[i];
        imgEl.style.height = "auto";
        if (!jQuery(imgEl).hasClass("noresponsive")) {
            imgEl.className = imgEl.className + (imgEl.className ? " " : "") + "img-responsive";
        }
    }
}
