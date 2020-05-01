var Agreements = {
	
    /* ************************************************************************** */ 
    /*					New Agreement related JS code							  */
    /* ************************************************************************** */
    setupNewAgreementsElements: function () {
		$('#saveNewAgreementFormBtn').click(function () {
			/* Get Form Data and Save/Update Subagent Record */
			Agreements.SaveAgreementData();
			// alert('Implemeneted Soon');
        });
        //when the New SubAgent popup dialog closes, we remove the Dim from the background div
        $('#newAgreementForm').on('hidden.bs.modal', function () {
            Agreements.ClearNewAgreementForm();
			$('#agrtabdiv').removeClass('disabled1');
        });
    },
	/* ********************************************************************** 	*/
	/* 				  	Create New Agreement Function					  		*/
	/* ********************************************************************** 	*/
	createNewAgreement: function (obj) {
        var CourseProviderId = jq331(obj).attr('data-CourseProviderId');
		$('#account_id').val(CourseProviderId);
        $('#agrtabdiv').addClass('disabled1');
        $('#newAgreementForm').modal('show');
    },
	
	

	/* ********************************************************************** 	*/
	/* 				  	Save Form to Create Agreement					  		*/
	/* ********************************************************************** 	*/
	SaveAgreementData: function () {
		jq331("#agreement_modal_popup").block();
		//Name is required Field
		if( jq331('#name').val()=='' ){
			jq331("#agreement_modal_popup").unblock();
			jq331("#name").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#name").notify("Required");		
			return false;
		}
		if( jq331('#start_date').val()=='' ){
			jq331("#agreement_modal_popup").unblock();
			jq331("#start_date").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#start_date").notify("Required");		
			return false;
		}
		if( jq331('#end_date').val()=='' ){
			jq331("#agreement_modal_popup").unblock();
			jq331("#end_date").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#end_date").notify("Required");		
			return false;
		}
		setTimeout(function(){
			var account_id = jq331('#account_id').val();
			var record = jq331('#record').val();
			var name = jq331('#name').val();
			var agreement_type = jq331('#agreement_type').val();
			var agreement_number = jq331('#agreement_number').val();
			var start_date = jq331('#start_date').val();
			var end_date = jq331('#end_date').val();
			var agreement_status = jq331('#agreement_status').val();
			var renewal_alert_days = jq331('#renewal_alert_days').val();
			var remarks = jq331('#remarks').val();
			var territories = jq331('#territories').val();
			
			var data = {
					'account_id':account_id,'record':record,'name':name,
					'start_date':start_date,'end_date':end_date,
					'agreement_type':agreement_type,
					'agreement_status':agreement_status,
					'agreement_number':agreement_number,
					'renewal_alert_days':renewal_alert_days,
					'remarks':remarks,
					'territories':territories,				
				};	
			jq331.ajax({
				type: "POST",
				url: "index.php?module=igec_agreement&action=AgreementDataController&func=save&sugar_body_only=true",
				data: data,
				contentType: 'application/x-www-form-urlencoded',
				dataType: 'json',
				async: false,
				success: function (result) {
					jq331("#agreement_modal_popup").unblock();				
					window.location.href='index.php?module=igec_agreement&action=AgreementListingPage';
				},
				error: function (request, status, errorThrown) {
					console.log(request + ' ' + status + ' ' + errorThrown);
				}
			});
		},2000);
		
    }, 
	
    /* ************************************************************************ */ 
    /*		  Show Agreement DetailView and All Related Commission              */
    /* ************************************************************************ */ 

    viewAgreementClicked: function (obj) {
        var AgrId = jq331(obj).attr('data-AgreementId');
		Agreements.populateAgreementData(AgrId);
        jq331('#AgreementDetailViewTab').show();
        jq331('#agrtabdiv').addClass('disabled1');
        animateScrollTo(document.querySelector('#AgreementDetailViewTab'));
    },
	editAgreementClicked: function (obj) {
		var CourseProviderId = jq331(obj).attr('data-accountid');
		var AgrId = jq331(obj).attr('data-agreementid');
		$('#AgreementRecordId').val(AgrId);
		Agreements.PopulateEditAgreementForm(AgrId);
        /* $('#agrtabdiv').addClass('disabled1');
        $('#newAgreementForm').modal('show'); */
		
    },
	/* ********************************************************************** 	*/
	/* 			Get and Populate Agreement data in Edit Form			  		*/
	/* ********************************************************************** 	*/
	
	PopulateEditAgreementForm: function(AgrId){
		$.ajax({
			url: 'index.php?module=igec_agreement&action=AgreementDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=getAgreement&record='+AgrId,		
			async: true,			
			success : function (result){
				console.log(result);
				// debugger;
				var data = $.parseJSON(result);
				var Agreement = data['Agreement'];
				jq331('#account_id').val(Agreement['account_id']);
				jq331('#name').val(Agreement['name']);
				jq331('#record').val(Agreement['id']);
				jq331('#agreement_type').val(Agreement['agreement_type']);
				jq331('#agreement_number').val(Agreement['agreement_number']);
				jq331('#start_date').val(Agreement['start_date_db']);
				jq331('#end_date').val(Agreement['end_date_db']);
				jq331('#agreement_status').val(Agreement['agreement_status']);
				jq331('#renewal_alert_days').val(Agreement['renewal_alert_days']);
				jq331('#remarks').val(Agreement['remarks']);
				jq331('#territories').val(Agreement['territories']).trigger("change");

				//Data populated now invoke Form
				$('#agrtabdiv').addClass('disabled1');
				$('#newAgreementForm').modal('show');
			}	
		});
	},
	ClearNewAgreementForm: function(){
		jq331('#account_id').val('');
		jq331('#name').val('');
		jq331('#record').val('');
		jq331('#agreement_type').val('Direct Agreement');
		jq331('#agreement_number').val('');
		jq331('#start_date').val('');
		jq331('#end_date').val('');
		jq331('#agreement_status').val('Active');
		jq331('#renewal_alert_days').val('');
		jq331('#remarks').val('');
		jq331('#territories').val(["All"]).trigger("change");
	},
	/* ********************************************************************** 	*/
	/* 			Get and Populate Agreement data Function				  		*/
	/* ********************************************************************** 	*/
	populateAgreementData: function(AgrId){
		
			$.ajax({
			url: 'index.php?module=igec_agreement&action=AgreementDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=getAgreementCommissions&record='+AgrId,		
			async: true,			
			success : function (result){
				// console.log(result);
				var data = $.parseJSON(result);
				var AgreementData = data['Agreement'];
				$('#PopulatedAgreementID').val(AgreementData['id']);
				$('#PopulatedAccountID').val(AgreementData['account_id']);
				$('#agreement_id').val(AgreementData['id']);
				$('#course_provider_id').val(AgreementData['course_provider_id']);
				$('#AgreementName').text(AgreementData['name']);
				$('#CourseProviderName').text(AgreementData['account_name']);
				$('#AgreementStatus').text(AgreementData['agreement_status']);
				$('#AgreementStartDate').text(AgreementData['start_date']);
				$('#AgreementEndDate').text(AgreementData['end_date']);
				$('#AgreementRenewalDays').text(AgreementData['renewal_alert_days']);
				$('#AgreementAgentCode').text(AgreementData['agreement_number']);
				$('#AgreementType').text(AgreementData['agreement_type']);
				$('#AgreementCurrency').text(AgreementData['currency_name']);
				$('#AgreementCountries').text(AgreementData['territories']);
				$('#AgreementRemarks').text(AgreementData['remarks']);
				if(AgreementData['type']=='Default'){
					$('#addcommvbtn').hide();
				}else{
					$('#addcommvbtn').show();
				}
				var CommissionsData = data['Commissions'];
				var comhtml = '';
				var sign='';
				for(entry of CommissionsData){
					if(entry['calculation_method']=='Percentage'){
						sign='%';
					}else{
						sign='';
					}
					comhtml +=	'<tr><td class="td-padding">'+entry['course_level_name']+'</td><td class="td-padding">'+entry['course_discipline_name']+'</td><td class="td-padding">'+entry['course_name']+'</td><td class="td-padding">'+entry['calculation_method']+'</td><td class="td-padding">---</td><td class="td-padding">'+entry['minimum_students']+'</td><td class="td-padding">'+entry['standard_value']+sign+'</td><td class="td-padding">'+entry['real_value']+sign+'</td><td><span class="fa fa-times red" data-AgreementId="'+AgreementData['id']+'" data-CommissionId="'+entry['commission_id']+'" onclick="Agreements.deleteCommissionClicked(this)"></span></td></tr>';
				}
				$('#CommissionsTable').html(comhtml);
				var AccountID = AgreementData['course_provider_id'];
				CommissionDefCSTM.updateCourseLevels(AccountID);
				setTimeout(function(){ CommissionDefCSTM.updateDicspline(AccountID); }, 1000);
				// CommissionDefCSTM.updateCourseLevels(AccountID);
				// CommissionDefCSTM.updateDicspline(AccountID);
				
			}	
		});
	},
	/* ************************************************************************ */ 
    /* Delete Commission with given Commission ID and refresh Commissions table */
    /* ************************************************************************ */  
	deleteCommissionClicked: function (obj) {
        var res = confirm("Confirm Delete this Commission!");
		if (res == true) {
			var AgreementId = $(obj).attr('data-AgreementId');
			var CommissionId = $(obj).attr('data-CommissionId');
			Agreements.deleteAgreementCommission(AgreementId,CommissionId);  
		} else {
		  return false;
		}
				
    },
	deleteAgreementCommission: function (AgreementId,CommissionId) {
        
		$.ajax({
			url: 'index.php?module=igec_agreement&action=AgreementDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=deleteCommission&record='+CommissionId+'&AgrID='+AgreementId,		
			async: true,			
			success : function (result){
				// console.log(result);
				var data = $.parseJSON(result);				
				var CommissionsData = data['Commissions'];
				var comhtml = '';
				for(entry of CommissionsData){
					comhtml +=	'<tr><td class="td-padding">'+entry['course_level_name']+'</td><td class="td-padding">'+entry['course_discipline_name']+'</td><td class="td-padding">'+entry['course_name']+'</td><td class="td-padding">'+entry['calculation_method']+'</td><td class="td-padding">---</td><td class="td-padding">'+entry['minimum_students']+'</td><td class="td-padding">'+entry['standard_value']+'</td><td><span class="fa fa-times red" data-AgreementId="'+AgreementId+'" data-CommissionId="'+entry['commission_id']+'" onclick="Agreements.deleteCommissionClicked(this)"></span></td></tr>';
				}
				$('#CommissionsTable').html(comhtml);
				
			}	
		});  
		
    },
	

	
	
}
function removeFields(){
	$('#commission_create').trigger('reset');
	jq331('#crslevel').val(['-1']).trigger('change');
	jq331('#crsdis').val(['-1']).trigger('change');
	jq331('#course_id').val(['-1']).trigger('change');
	$('.oneCommDef').trigger('reset');
	if ( ('.oneCommDef').length > 1){
		$('.oneCommDef').not(':first').remove();
		$('.hrBorder').not(':first').remove();
	}
}