 $(document).ready(function () {
     $('div[data-label="LBL_OTHER_SOURCE"]').parent().hide(); 
	$('#lead_source').change(function () { 
	 if(document.getElementById('lead_source').value=='Other')
	  {
	    $('div[data-label="LBL_OTHER_SOURCE"]').parent().show();
	     }else{
		$('div[data-label="LBL_OTHER_SOURCE"]').parent().hide(); 
			}
 	});

debugger;
	 $('div[data-label="LBL_RENEWAL_PERIOD"]').parent().hide(); 
	 $('#sugarfield_type').change(function () { 
	 debugger;
	  if(document.getElementById('sugarfield_type').value=='Renewal')
	   {
		 $('div[data-label="LBL_RENEWAL_PERIOD"]').parent().show();
		  }else{
		 $('div[data-label="LBL_RENEWAL_PERIOD"]').parent().hide(); 
			 }
	  });
  });
