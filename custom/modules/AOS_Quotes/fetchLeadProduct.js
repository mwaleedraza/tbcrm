$(document).ready(function(){
  $.ajax({
    url: 'index.php?module=AOS_Quotes&action=GetLeadProducts&sugar_body_only=true&lead_id='+last_segment,
    datatype: 'JSON',
    success: function(data) {
      var dataArr=JSON.parse(data);
      if (data !=null){
        for (var i=0; i < dataArr.length; i++){
          insertProductLine("product_group"+i , i);
          $("#product_name"+i).val(dataArr[i].name);
          $("#product_product_unit_price"+i).val(dataArr[i].price);
          $("#product_product_list_price"+i).val(dataArr[i].price);
          $("#product_product_id"+i).val(dataArr[i].id);
          $("#product_product_qty"+i).val('1');
      }
      }
    }
  });
});
