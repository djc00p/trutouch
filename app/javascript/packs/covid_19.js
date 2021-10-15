var coll = document.getElementsByClassName("collapsible");
var animationDelay = 200; /* Gotta delay max-height value */
var i;

function calcMaxHeight(elem) {
  var content = elem.nextElementSibling;
  if (elem.classList.contains("active")) {
    content.style.maxHeight = content.scrollHeight + "px";
  } else {
    content.style.maxHeight = "0";
  }
  var nextParentContent = elem.closest(".covid_19_messages");
  if (nextParentContent !== null) {
    var nextParentCollapsible = nextParentContent.previousElementSibling;
    setTimeout(function () {
      calcMaxHeight(nextParentCollapsible);
    }, animationDelay);
  }
}

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function () {
    this.classList.toggle("active");
    calcMaxHeight(this);
  });
}
