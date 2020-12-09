{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }
  </script>
{/literal}

<!-- Contact dropdown -->
<select id="contacts_id" name="contacts_id">
  {foreach from=$CONTACT_DATA key=index item=data}
    <option value="{$data.id}">{$data.first_name} {$data.last_name}</option>
  {/foreach}
  <script> setDDVal('contacts_id','{$BEAN->contacts_id}') ;</script>
</select>

{literal}
  <script>
    $(document).ready(function(){
      $('#contacts_id').select2();
      if(currentVendor!=''){
          setDDVal('contacts_id',currentVendor);
      }
    });
  </script>
{/literal}
