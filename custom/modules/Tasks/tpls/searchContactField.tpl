{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Tasks/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Tasks/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Clients dropdown -->
<select id="contact_id" name="contact_id">
  <option>-- Select Client--</option>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#contact_id').select2();
      
    });
  </script>
{/literal}