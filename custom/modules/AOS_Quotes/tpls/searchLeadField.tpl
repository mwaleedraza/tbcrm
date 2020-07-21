{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/AOS_Quotes/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/AOS_Quotes/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
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
    <option value="{$data.id}">{$data.first_name} {$data.last_name}</option>
  {/foreach}
  <script> setDDVal('lead_id','{$BEAN->lead_id}') ;</script>
</select>
{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#lead_id').select2();
      if(CurrentLeadId !='')
        setDDVal('lead_id',CurrentLeadId);  
     
    });
    
  </script>
{/literal}
