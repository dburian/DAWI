window.onload = main;

function showMenu() {
    document.getElementById("nav").classList.add("is-dropdown-menu-active");
    document.getElementsByTagName("main")[0].style.filter = "blur(8px)";
}

function hideMenu() {
    document.getElementById("nav").classList.remove("is-dropdown-menu-active");
    document.getElementsByTagName("main")[0].style.filter = "none";
}

function main() {
    document.getElementById("menu-icon").addEventListener("click", showMenu);
    document.getElementById("close-icon").addEventListener("click", hideMenu);
}