{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Cases/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Cases/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Users dropdown -->
<select id="assigned_user_id" name="assigned_user_id">
  <option>-- Select User--</option>
  {foreach from=$USERS_DATA key=index item=data}
    <option value="{$data.id}">{$data.last_name} </option>
  {/foreach}
  <script> setDDVal('assigned_user_id','{$BEAN->assigned_user_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#assigned_user_id').select2();
      
    });
  </script>
{/literal}