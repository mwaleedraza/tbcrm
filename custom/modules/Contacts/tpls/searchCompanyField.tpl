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
            account = JSON.parse(data);
            $('#phone_work').val(account.phone_office);

            $('#primary_address_street').val(account.billing_address_street);
            $('#primary_address_city').val(account.billing_address_city);
            $('#primary_address_state').val(account.billing_address_state);
            $('#primary_address_postalcode').val(account.billing_address_postalcode);
            $('#primary_address_country').val(account.billing_address_country);

            if(account.shipping_address_street){
              $('#alt_checkbox').click();
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