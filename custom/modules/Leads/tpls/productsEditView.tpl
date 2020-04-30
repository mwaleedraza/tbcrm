
<script type="text/javascript">
{literal}
	$(document).ready(function(){
	  $("button").click(function(){
		$("p").slideToggle();
	  });
	});
    var rowIndex=0;
    function addProducts(pro_name_val,pro_id_val){
      $('#pro_tbl').append('<tr id="row'+rowIndex+'"><td><input value="'+pro_name_val+'" type="text" id="pro_name_'+rowIndex+'" name="pro_name_'+rowIndex+'" placeholder="Search Product " class="sqsEnabled form-control" autocomplete="off"/><input type="hidden" value="'+pro_id_val+'" id="pro_id_'+rowIndex+'" name="pro_id_'+rowIndex+'" placeholder="Search Product " class="form-control" /></td><td><button type="button" name="remove" id="'+rowIndex+'" class="btn btn-danger btn_remove">X</button></td></tr>');
	  setTimeout(function(){
		SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['EditView_pro_name_'+rowIndex]) != 'undefined'",
		enableQS(false)
		);
		customSqs(rowIndex);
		rowIndex++;
		$('#product_count').val(rowIndex);
	}, 20);
    }
    function customSqs(prodln){
      sqs_objects["pro_name_" + prodln] = {
        "form": "EditView",
        "method": "query",
        "modules": ["AOS_Products"],
        "group": "or",
        "field_list": ["name", "id"],
        "populate_list": ["pro_name_" + prodln, "pro_id_" + prodln],
        "required_list": ["pro_id_" + prodln],
        "conditions": [{
        "name": "name",
        "op": "like_custom",
        "end": "%",
        "value": ""
        }],
        "order": "name",
        "limit": "30",
        // "post_onblur_function": "formatListPrice(" + prodln + ");",
        "no_match_text": "No Match"
      };
	   enableQS(false);
    }
    $(document).on('click', '.btn_remove', function(){
      var button_id = $(this).attr("id");
      $('#row'+button_id+'').remove();
    });
		{/literal}
</script>


<h1>Select Products</h1>
<table class="table table-bordered" id="pro_tbl" name="pro_tbl">
  <tbody>
  <tr>
      <td><button type="button" name="add_pro" id="add_pro" class="btn btn-success" onclick="addProducts('','');">Add Product</button></td>
  </tr>
</tbody>
</table>
<input type="hidden" name="product_count" id="product_count" value="">

{foreach from=$PRODUCTLIST_DETAILS key=index item=line_item}
    <script>
        pid = '{$line_item.id}';
        pname='{$line_item.name}';
        addProducts(pname,pid);
    </script>
{/foreach}



