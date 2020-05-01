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
  <option></option>
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
</select>


<!-- Use to set an option selected in the First dropdown -->
<select id='user_selected'>
  <option value=''>-- Select User--</option>
  <option value='yogesh'>Yogesh Singh</option>
  <option value='sonarika'>Sonarika Bhadoria</option>
  <option value='anil'>Anil Singh</option>
  <option value='akilesh'>Akilesh Sahu</option>	
</select>


{literal}
  <script type="text/javascript">
    $(document).ready(function(){

      // Initialize Select2
      $('#account_id').select2();
      $('#user_selected').select2();
      $("#account_id").change(function(){
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
              debugger;


              $('#user_selected').append('<option value="">0000</option>');

          },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
                debugger;
            }
        });
      });

      // Set option selected onchange
    $('#user_selected').change(function(){
    var value = $(this).val();

    // Set selected
    $('#account_id').val(value);
    $('#sel_users').select2().trigger('change');

    });
    });
  </script>

{/literal}