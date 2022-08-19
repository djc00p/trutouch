var $detail_services = $("#detail_services");
var $main_detail_services = $("#main_detail_services");
var $tablink = $(".tablink");
var $detail_tablink = $(".detail_tablink");
var $tabcontent = $(".tabcontent");
var $detail_tabcontent = $(".detail_tabcontent");
$("#defaultOpen").addClass("active");
$tabcontent.hide();
$detail_tabcontent.hide();
$detail_services.show();
$main_detail_services.show();

$tablink.on("click", function (e) {
  let services = downcaseUnderscore($(this));

  $tabcontent.hide();
  $(`#${services}`).show();

  e.preventDefault();
});

$detail_tablink.on("click", function (e) {
  let services = downcaseUnderscore($(this));

  $detail_tabcontent.hide();
  $(`#${services}`).show();

  e.preventDefault();
});

function downcaseUnderscore(element) {
  return element[0].innerText.split(" ").join("_").toLowerCase();
}
