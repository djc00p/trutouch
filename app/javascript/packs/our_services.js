var $detail_services = $("#detail_services");
var $tint_services = $("#tint_services");
var $clear_bra_services = $("#clear_bra_services");
var $lower_body_paint_repair_services = $("#lower_body_paint_repair_services");
var $tablink = $(".tablink");
var $tabcontent = $(".tabcontent");
$tabcontent.hide();
$detail_services.show();

$tablink.on("click", function () {
  switch ($(this)[0].innerText) {
    case "Detail Services":
      $tabcontent.hide();
      $detail_services.show();
      break;
    case "Tint Services":
      $tabcontent.hide();
      $tint_services.show();
      break;
    case "Clear Bra / Mask Services":
      $tabcontent.hide();
      $clear_bra_services.show();
      break;
    case "Lower Body Paint Repair Services":
      $tabcontent.hide();
      $lower_body_paint_repair_services.show();
      break;
  }
});
