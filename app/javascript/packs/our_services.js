function openPage(pageName) {
  // Hide all elements with class="tabcontent" by default */
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Show the specific tab content
  document.getElementById(pageName).style.display = "block";
}

// Get the element with id="defaultOpen" and click on it
document
  .getElementById("defaultOpen")
  .addEventListener("click", openPage("detail_services"));
// document
//   .getElementById("tintOpen")
//   .addEventListener("onclick", openPage("tint_services"));
// document
//   .getElementById("cbmOpen")
//   .addEventListener("onclick", openPage("clear_bra_services"));
// document
//   .getElementById("lbprsOpen")
//   .addEventListener("onclick", openPage("lbprs"));
