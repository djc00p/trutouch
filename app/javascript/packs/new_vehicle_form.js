var $color = $("#vehicleColor");
var $make = $("#vehicleMake");
var $model = $("#vehicleModel");
var $year = $("#vehicleYear");
var $register = $("#register");
$register.attr("disabled", true);
var $colorValues = $color.find("option").not("option:first").clone();
var $makeValues = $make.find("option").clone();
var $modelValues = $model.find("option").clone();

$color.empty().append('<option value="">Please Select a Color</option>');
$make.empty().append('<option value="">Please Select a Make</option>');
$model.empty().append('<option value="">Please Select a Model</option>');

$year.change(function (event) {
  var options,
    selected = $(this).val();

  $make.find("option").not("option:first").remove();
  $model.find("option").not("option:first").remove();
  if (selected.length === 0 || selected === void 0) return false;

  options = $makeValues
    .filter(function (index, element) {
      element_value = element.value.slice(0, 4);
      if (element_value === selected) {
        element.value = element.value.split(", ").pop();

        return element;
      }
    })
    .appendTo($make);
  $colorValues.appendTo($color);
});

$make.change(function (event) {
  var options,
    selected = $(this).val();
  selected = $year.val().concat(", ", selected);

  $model.find("option").not("option:first").remove();
  if (selected.length === 0 || selected === void 0) return false;

  options = $modelValues
    .filter(function (index, element) {
      element_value = element.value.split(", ", 2).join(", ");
      if (element_value === selected) {
        element.value = element.value.split(", ").pop();

        return element;
      }
    })
    .appendTo($model);
});

$("select").change(function () {
  if (
    $year.val() != "" &&
    $color.val() != "" &&
    $make.val() != "" &&
    $model.val() != ""
  ) {
    $register.attr("disabled", false);
  } else {
    $register.attr("disabled", true);
  }
});
