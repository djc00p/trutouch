window.onload = function () {
  if (window.location.pathname === "/sign_in") {
    console.log(window.location.pathname);
    //Hide the element.
    document.querySelectorAll(".si_su")[0].style.display = "none";
  } else if (window.location.pathname === "/profile") {
    //Hide the element.
    document.querySelectorAll(".si_su")[0].style.display = "none";
  }
};
