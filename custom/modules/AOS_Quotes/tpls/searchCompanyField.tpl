{literal}
  <script src="custom/modules/AOS_Quotes/app-assets/vendors/jquery-3.3.1.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="custom/modules/AOS_Quotes/app-assets/vendors/select2/dist/css/select2.min.css">
  <script src="custom/modules/AOS_Quotes/app-assets/vendors/select2/dist/js/select2.min.js"></script>
  <script>
    function setDDVal (field_id,field_val){
    $('#'+field_id).val(field_val).trigger('change');
    }
</script>
{/literal}

<!-- Company dropdown -->
<select id="billing_account_id" name="billing_account_id">
  <option>-- Select Company--</option>
  {foreach from=$BILLING_ACCOUNT_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
  <script> setDDVal('billing_account_id','{$BEAN->billing_account_id}') ;</script>
</select>


<!-- Client (contact) dropdown -->

<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Client:</b> 
<select id='billing_contact_id' name="billing_contact_id">
  <option value=''>-- Select Client--</option>
</select>


{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#billing_account_id').select2();
      $('#billing_contact_id').select2();
      makeContactsDD();
      $("#billing_account_id").change(function(){
        makeContactsDD();
      });
    });
    function makeContactsDD(){
        var billing_account_id = $('#billing_account_id').val();

        var data = {
            'id': billing_account_id
        };

        $.ajax({
            type: 'POST',
            url: 'index.php?module=AOS_Quotes&action=GetRelatedContacts&sugar_body_only=true',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            async: true,
            success: function(data) {               
                var data= $.parseJSON(data);
                $("#billing_contact_id option").remove();
                $('#billing_contact_id').append('<option value=""></option>');
                $.each(data, function(i,item){
                    $('#billing_contact_id').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                });
                if(CurrentBillingContactId !='')
                  setDDVal('billing_contact_id',CurrentBillingContactId);                 
            },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
            }
        });
    }
  </script>
 
{/literal}

