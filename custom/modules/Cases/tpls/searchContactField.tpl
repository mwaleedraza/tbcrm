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
  <option>-- Select Client--</option>
  {foreach from=$CONTACTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.first_name} {$data.last_name}</option>
  {/foreach}
  <script> setDDVal('contact_id','{$BEAN->contact_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#contact_id').select2();
      
    });
  </script>
{/literal}