$(document).ready(function () {
  $.ajax({
    url: 'index.php?module=AOS_Quotes&action=GetLeadProducts&sugar_body_only=true&lead_id=' + last_segment,
    datatype: 'JSON',
    success: function (data) {
      var dataArr = JSON.parse(data);
      debugger;
      if (data != null) {
        for (var lineNum = 0; lineNum < dataArr.length; lineNum++) {
          insertProductLine("product_group" + lineNum, lineNum);
          $('#product_name'+lineNum).val(dataArr[lineNum].id).trigger('change');
          $("#product_product_qty" + lineNum).val('1');
          calculateLine(lineNum, "product_");
        }
      }
    }
  });
});
