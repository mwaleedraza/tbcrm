YAHOO.util.Event.addListener('billing_contact_id', 'change', function(){
  var id=$('#billing_contact_id').val();
  if(id==''){
     $('#rfq_ref').val('0');
     return false;
  }
  $.ajax({
          url: 'index.php?module=AOS_Quotes&action=GetUserBillingId&sugar_body_only=true&id='+id,
		       //dataType: "json",
           success: function(data) {
             $('#rfq_ref').val(data);
           }
          });
   });
