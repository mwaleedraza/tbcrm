{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Cases/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Cases/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Products dropdown -->
<select id="product_id" name="product_id">
  <option value="">-- Select Product--</option>
  {foreach from=$PRODUCTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('product_id','{$BEAN->product_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#product_id').select2();

      $( "#product_id" ).change(function() {
        let account_id =$('#account_id').val();
        let contact_id =$('#contact_id').val();
        let product_id =$('#product_id').val();
        if(product_id==null || product_id==''){
          $('#SAVE').hide();
        }else if(account_id!='' && contact_id!=''){
          $('#SAVE').show();
        }
      });
    });
  </script>
{/literal}