window.onload = main;

function showMenu() {
    document.getElementById("nav").classList.add("is-dropdown-menu-active");
}

function hideMenu() {
    document.getElementById("nav").classList.remove("is-dropdown-menu-active");
}

function main() {
    document.getElementById("menu-icon").addEventListener("click", showMenu);
    document.getElementById("close-icon").addEventListener("click", hideMenu);
}