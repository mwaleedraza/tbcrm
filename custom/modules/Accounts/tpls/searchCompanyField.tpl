{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Accounts/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Accounts/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Company dropdown -->
<select id="parent_id" name="parent_id">
  <option>-- Select Member--</option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('parent_id','{$BEAN->parent_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#parent_id').select2();
      
    });
  </script>
{/literal}