{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
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
  <script> setDDVal('account_id','{$BEAN->account_id}') ;</script>
</select>


<!-- Client (contact) dropdown -->

<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select Contact:</b> 
<select id='contacts_id' name="contacts_id">
  <option value=''>-- Select Contact--</option>
</select>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#account_id').select2();
      $('#contacts_id').select2();
      makeContactsDD();
      $("#account_id").change(function(){
        makeContactsDD();
      });
    });
    function makeContactsDD(){
        var account_id = $('#account_id').val();
        
        var data = {
            'id': account_id
        };

        $.ajax({
            type: 'POST',
            url: 'index.php?module=Leads&action=GetRelatedContacts&sugar_body_only=true',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            async: true,
            success: function(data) {
                var data= $.parseJSON(data);
                $("#contacts_id option").remove();
                $('#contacts_id').append('<option value=""></option>');
                $.each(data, function(i,item){
                    $('#contacts_id').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                });
                if(CurrentContactId!=''){
                    setDDVal('contacts_id',CurrentContactId);
                }
            },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
            }
        });
    }
  </script>
{/literal}