{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Cases/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Cases/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Clients dropdown -->
<select id="contact_id" name="contact_id">
  <option value="">-- Select Client--</option>
  <script> setDDVal('contact_id','{$BEAN->contact_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      $('#SAVE').hide();
      // Initialize Select2
      $('#contact_id').select2();
    });

    $( "#contact_id" ).change(function() {
      let account_id =$('#account_id').val();
      let contact_id =$('#contact_id').val();
      let product_id =$('#product_id').val();
      if(contact_id==''){
        $('#SAVE').hide();
      }else if(account_id!='' && product_id!=''){
        debugger;
        $('#SAVE').show();
      }
    });
  </script>
{/literal}