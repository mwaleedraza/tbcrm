function getOptionHTML(optionArray, selectedField, selectedVal) {
  var optionHTML = "";
  for (key in optionArray) {
    if (selectedVal == key)
      optionHTML +=
        '<option selected value="' +
        key +
        '">' +
        optionArray[key] +
        "</option>";
    else
      optionHTML +=
        '<option value="' + key + '">' + optionArray[key] + "</option>";
  }
  $("#" + selectedField).html(optionHTML)
    // .select2({ allowClear: true });
  //     var $theSelect = $('#'+selectedField);
  //     $theSelect.select2({ allowClear: true });
}
function setDDVal(field_id, field_val) {
  $("#" + field_id)
    .val(field_val)
    .trigger("change");
};
$.fn.serializeObject = function () {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function () {
      if (o[this.name]) {
      if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || "");
      } else {
      o[this.name] = this.value || "";
      }
  });
  return o;
};
