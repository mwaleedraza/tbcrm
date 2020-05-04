{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <!-- Remove <link rel="stylesheet" type="text/css" href="custom/include/UI/app-assets/css/pages/timeline.css">-->
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <script src="custom/modules/Leads/app-assets/vendors/js/animation/jquery.appear.js"></script>
  <script src="custom/modules/Leads/app-assets/js/core/app.js"></script>
  <script src="custom/modules/Leads/app-js/Lead/EditLead.js"></script>
  <script src="custom/modules/Leads/app-js/getOptionByHTML.js"></script>
{/literal}

<!-- Company dropdown -->
<select id="account_id" name="account_id">
  <option>-- Select Company--</option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
</select>


<!-- Client (contact) dropdown -->

<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select Client:</b> 
<select id='contacts_id' name="contacts_id">
  <option value=''>-- Select Client--</option>
</select>


{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      
      // Initialize Select2
      $('#account_id').select2();
      $('#contacts_id').select2();
      $("#account_id").change(function(){
        var account_id = $('#account_id').val();
        
        //to change the selected option (not working)
        var sel = document.getElementById("account_id");
        var text= sel.options[sel.selectedIndex].text;
        alert(text);
        $("#account_id option:contains("+text+")").attr('selected', 'selected');
    
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
          },
          error: function (request, status, errorThrown) {
            console.log(request + ' ' + status + ' ' + errorThrown);
          }
        });
      });

      // Set option selected onchange
      $('#contacts_id').change(function(){
      var value = $(this).val();
      });
    });
  </script>
{/literal}