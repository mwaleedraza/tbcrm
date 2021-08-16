{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Contacts/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Contacts/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }

      function getRelatedAddress(account_id){
        var data = { account_id };
        $.ajax({
          url: "index.php?module=Contacts&action=getRelatedAddress&sugar_body_only=true",
          type: "GET",
          data: data,
          success: function(data){
            address = JSON.parse(data);
            if(address.length > 0){
              address.forEach(function(row){
                $('#primary_address_street').val(row.address_street);
                $('#primary_address_city').val(row.address_city);
                $('#primary_address_state').val(row.address_state);
                $('#primary_address_postalcode').val(row.address_postalcode);
                $('#primary_address_country').val(row.address_country);
              });
            }
          }
        })
      }
  </script>
{/literal}

<!-- Company dropdown -->
<select id="account_id" name="account_id" onchange="getRelatedAddress(this.value)">
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