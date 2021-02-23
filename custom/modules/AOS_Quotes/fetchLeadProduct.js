$(document).ready(function () {
  var full_url = document.URL;
  var url_array = full_url.split("="); // Split the string into an array with / as separator
  var last_segment = url_array[url_array.length - 1]; // Get the last part of the array (-1)
  var lead_id = last_segment;
  $.ajax({
    url: 'index.php?module=AOS_Quotes&action=GetLeadProducts&sugar_body_only=true&lead_id=' + last_segment,
    datatype: 'JSON',
    success: function (data) {
      var dataArr = JSON.parse(data);
      if (data != null) {
        for (var lineNum = 0; lineNum < dataArr.length; lineNum++) {
          insertProductLine("product_group" + lineNum, lineNum);
          $('#product_name' + lineNum).val(dataArr[lineNum].id).trigger('change');
          $('#product_sub_products' + lineNum).val(dataArr[lineNum].sub_product).trigger('change');
          $('#product_sub_sub_products' + lineNum).val(dataArr[lineNum].sub_sub_product).trigger('change');
          $("#product_product_qty" + lineNum).val('1');

          calculateLine(lineNum, "product_");
        }
      }
    }
  });
});
