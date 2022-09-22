{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Cases/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Cases/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script>
      function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
      }

    function getRelatedContacts(account){
      var contactOpt = '<option value="">-- Select Client--</option>';
      if(account == ''){
        $('#contact_id').html(contactOpt);
        return 0;
      }
      var data = { account };
      $.ajax({
          url: "index.php?module=Tasks&action=getRelatedContacts&sugar_body_only=true",
          data: data,
          type: "GET",
          success: function(contacts){
              contacts = JSON.parse(contacts);
              contacts.forEach(function(contact){
                  contactOpt += '<option value="'+ contact.id +'">'+ contact.first_name +' '+ contact.last_name +'</option>';
              });
              $('#contact_id').html(contactOpt);
              
              if(CurrentCaseContact != ''){
                  setDDVal('contact_id',CurrentCaseContact); ;
              }
          }
      });
    }
  </script>
{/literal}

<!-- Company dropdown -->
<select id="account_id" name="account_id" onchange="getRelatedContacts(this.value)">
  <option value="">-- Select Company--</option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('account_id','{$BEAN->account_id}') ;</script>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#account_id').select2();
    });
    
    $( "#account_id" ).change(function() {
      let account_id =$('#account_id').val();
      let contact_id =$('#contact_id').val();
      let product_id =$('#product_id').val();
      if(account_id==''){
          $('#SAVE').hide();
      }else if(contact_id!='' && product_id!=''){
        $('#SAVE').show();
      }
  });
  </script>
{/literal}