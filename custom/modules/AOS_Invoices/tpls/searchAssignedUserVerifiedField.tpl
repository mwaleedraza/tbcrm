{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/AOS_Invoices/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/AOS_Invoices/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Users dropdown -->
<select id="user_id" name="user_id">
  <option>-- Select User--</option>
  {foreach from=$USERSVERIFIED_DATA key=index item=data}
    <option value="{$data.id}">{$data.first_name} {$data.last_name}</option>
  {/foreach}
  <script> setDDVal('user_id','{$BEAN->user_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#user_id').select2();
      
    });
  </script>
{/literal}