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
<!-- Lead dropdown -->
<select id="lead_id" name="lead_id">
  <option>-- Select Sale--</option>
  {foreach from=$LEAD_DATA key=index item=data}
    <option value="{$data.id}">{$data.last_name}</option>
  {/foreach}
  <script> setDDVal('lead_id','{$BEAN->lead_id}') ;</script>
</select>
{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#lead_id').select2();
     
    });
    
  </script>
{/literal}