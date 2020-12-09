{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script>
        function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
    </script>
{/literal}

<h1>Select Products</h1>
<!-- Vendor (contact) DropDown -->
<label>Select Vendor</label>:
<select style="width:200px" id="contact_id" name="contact_id">
  {foreach from=$VENDOR_DATA key=id item=data}
    <option value="{$data.id}">{$data.first_name} {$data.last_name}</option>
  {/foreach}
  <script> setDDVal('contact_id','{$BEAN->contact_id}');</script>
</select>

<!-- Product Select -->
<label style="margin-left:10%;">Products</label>
<select id="product_id" name="product_id[]" style="width:200px" multiple="mutliple">


</select>


{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#contact_id').select2();
     $('#product_id').select2({
        tags:true,
     });
     
      $("#contact_id").change(function(){
        makePoductDD();
      });  
      makePoductDD();
    });
    function makePoductDD(){
      var contact_id = $('#contact_id').val();
        
        var data = {
            'id': contact_id
        };
        $.ajax({
            type: 'POST',
            url: 'index.php?module=Leads&action=GetProducts&sugar_body_only=true',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            async: true,
            success: function(data) {
                var data= $.parseJSON(data);
                $("#product_id option").remove();
                $.each(data, function(i,item){
                    $('#product_id').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                });
                var currentProducts = []; //ProductArray
                for (var i = 0; i < CurrentProductId.length; i++){
                    currentProducts.push(CurrentProductId[i].id);
                }
                    setDDVal('product_id',currentProducts);
              },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
            }
        });
    }

  </script>
{/literal}
