{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Contacts/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Contacts/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Company dropdown -->
<select id="account_id" name="account_id">
  <option>-- Select Company--</option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('account_id','{$BEAN->accounts_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#account_id').select2();
      
    });
  </script>
{/literal}