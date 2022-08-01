var $singleLineForm = $("#single-line-form");
var $singleLineField = $("#single-line-field");
var $structuredFields = $("#structured-fields");
var $structuredForm = $("#structured-form");

$structuredForm.click(function (event) {
  $singleLineForm.prop("checked", false);
  $singleLineField.hide();
  $structuredFields.show();
});

$singleLineForm.click(function (event) {
  $structuredForm.prop("checked", false);
  $structuredFields.hide();
  $singleLineField.show();
});
