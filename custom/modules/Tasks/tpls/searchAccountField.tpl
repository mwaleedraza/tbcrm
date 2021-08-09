{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Tasks/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Tasks/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
    function setDDVal (field_id,field_val){
        $('#'+field_id).val(field_val).trigger('change');
    }

    function getRelatedContacts(account){
        var data = { account };
        $.ajax({
            url: "index.php?module=Tasks&action=getRelatedContacts&sugar_body_only=true",
            data: data,
            type: "GET",
            success: function(contacts){
                contacts = JSON.parse(contacts);
                contactOpt = '<option value="">-- Select Client--</option>';
                contacts.forEach(function(contact){
                    contactOpt += '<option value="'+ contact.id +'">'+ contact.first_name +' '+ contact.last_name +'</option>';
                });
                $('#contact_id').html(contactOpt);
                
                if(CurrentContact != ''){
                    setDDVal('contact_id',CurrentContact); ;
                }
            }
        })

    }
  </script>
{/literal}

<!-- Accounts dropdown -->
<select id="accounts_id" name="accounts_id" onchange="getRelatedContacts(this.value)">
  <option>-- Select Client--</option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('accounts_id','{$BEAN->accounts_id}') ;</script>


</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#accounts_id').select2();
      
    });
  </script>
{/literal}