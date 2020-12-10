{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Vendor (Company) dropdown -->
<select id="accounts_id" name="accounts_id">
  {foreach from=$ACCOUNT_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('accounts_id','{$BEAN->accounts_id}') ;</script>
</select>

{literal}
  <script>
    $(document).ready(function(){
      $('#accounts_id').select2();
      if(currentVendor!=''){
          setDDVal('accounts_id',currentVendor);
      }
    });
  </script>
{/literal}
