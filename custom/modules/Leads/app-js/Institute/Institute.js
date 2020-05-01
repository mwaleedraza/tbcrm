var Institute = {
    showDetails: function (obj) {
        //get the id of the institute which has been clicked so that we display the View-Institute-Dialog 
        //populated with the data for the selected Instituet ID which will be in instId parameter
        var instId = $(obj).attr('data-instId');
		igec.blockFullPage();
        $('#instDetailsForm').modal('show');
		jq331.ajax({
			type: "POST",
			url: "index.php?module=Accounts&action=getAccountDetails&sugar_body_only=true",
			data: {'instId':instId,'Details':'Yes'},
			success: function(result){
				jq331("#instDetailsForm").html(result);
				jq331.unblockUI();
			},
			error: function(result){
				console.log('opp detail ajax failed');
			}
		});
    },

    editInstituteClicked: function (obj) {
        //get the id of the institute which has been clicked so that we display the Edit-Institute-Dialog 
        //populated with the data for the selected Instituet ID which will be in instId parameter
        var instId = $(obj).attr('data-instId');
        $('#instEditForm').modal('show');
		igec.blockFullPage();
		jq331.ajax({
			type: "POST",
			url: "index.php?module=Accounts&action=getAccountDetails&sugar_body_only=true",
			data: {'instId':instId},
			success: function(result){
				jq331("#instEditForm").html(result);
				var services = $("#servicesHidden").val();
				var servicesActual = services.split(',');
				if(servicesActual && servicesActual.length > 0){
					var myarr = [];
					for(var j=0; j<servicesActual.length; j++ ){
						if (servicesActual[j]) {
							myarr.push(servicesActual[j]);	
						}
					}
					setTimeout(function(){ 
						jq331('#services').val(myarr);
						jq331('#services').trigger('change');  
					}, 900);
					
				}
				var testss = $("#required_testsHidden").val();
				var testssActual = testss.split(',');
				if(testssActual && testssActual.length > 0){
					var myarrTest = [];
					for(var j=0; j<testssActual.length; j++ ){
						if (testssActual[j]) {
							myarrTest.push(testssActual[j]);	
						}
					}
					setTimeout(function(){ 
						jq331('#required_tests-in').val(myarrTest);
						jq331('#required_tests-in').trigger('change');  
					}, 900);
					
				}
				jq331.unblockUI();
			},
			error: function(result){
				console.log('opp detail ajax failed');
			}
		});
		//InstituteEditPopup.editInstituteDialogSetup();
    }
}