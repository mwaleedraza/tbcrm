var StudentDetails = {
	studentDetailEventHandler: function () {
        jq331('.discardOpp').click(function () {
            StudentDetails.discardOpportunity(this);
        });
    },
	discardOpportunity: function (obj) {
        var oppid = jq331(obj).attr('data-oppid');
        //var oppid now contains the Opp Id to be marked discarded
        swal({
            title: 'Notes (optional)',
            input: 'text',
            showCancelButton: true
        }).then(function (value) {
			igec.blockFullPage();
            discardOpp(oppid,value,''); // this function is defined in oppPopup.js
			setTimeout(function(){
				jq331.unblockUI();
			},3000);
			
        })
    },
    setupPage: function () {
        //convert Select fields to Select2 plugin
        //var $theSelect = jq331('.mySelect1');
        //$theSelect.select2({ allowClear: true });
        //setup tooltip to tooltipster plugin
        jq331('.tooltip').tooltipster({ theme: 'tooltipster-punk' });

        //set tool bar buttons div css (button bar which pops up on STATUS button on-hover)
        jq331('.tool-container').css('width', '200px');
        jq331('.tool-item').css('width', 'auto');

        //someother button click event listeners
        jq331('.myrow').hide();
        jq331('.mylink').click(function (obj) {
            var theLink = jq331(obj.currentTarget).attr('data-link');
            jq331('.myrow').hide();
            jq331('#' + theLink + 'Row').show('slow');
        });


        jq331('#shDetStBtn').click(function () {
            jq331('.studentDetails').show('slow');
            jq331('.fa-th-large').show('slow');
            jq331('.fa-th').hide();
        });
        jq331('.fa-th-large').click(function () {
            jq331('.fa-th-large').hide();
            jq331('.fa-th').show('slow');
            jq331('.studentDetails').hide('slow');
        });
    },

    recalculate: function () {
        var allAmounts = 0;
        jQuery('.amountin').each(function () {
            var curAmt = jq331(this).val();
            if (curAmt) {
                allAmounts = allAmounts + +curAmt;
            }
        });
        var allDiscounts = 0;
        /* jQuery('.discin').each(function () {
            var curDisc = jq331(this).val();
            if (curDisc) {
                allDiscounts = allDiscounts + +curDisc;
            }
        }); */
		var curDisc = jq331("#discin").val();
		if (curDisc) {
			allDiscounts = allDiscounts + +curDisc;
		}

        //jq331('#subtotalin').val(allAmounts - allDiscounts);
		jq331('#subtotalin').val(allAmounts);
        var subtotal = jq331('#subtotalin').val();
        var tax = jq331('#taxin').val();
        if (tax == null || tax == '') {
            tax = 0;
        }
        if (tax < 0) {
            alert('invalid tax value, cannot be negative..');
            jq331('#taxin').val('0');
            return;
        }
        jq331('#totalin').val(+subtotal + +tax - allDiscounts);

        /*var amount = jq331('.amountin').val();
        var discount = jq331('#discin').val();

        if (+discount > +amount) {
            swal("Error!", "Discount can not be greater than Amount, please review and try again.!", "error");
            return;
        }
        var subtotal = amount - discount;
        jq331('#subtotalin').val(subtotal);
        var tax = jq331('#taxin').val();
        var total = +subtotal + +tax;
        jq331('#totalin').val(total);*/
    }
}
function changeStatus(valTo){
	/*if(contact_stage_indx != 0){
		for(i=0; i<contact_stage_indx; i++){
			if(contact_stage_order[i]){
				$("#contact_stage option[value='"+contact_stage_order[i]+"']").prop('disabled', true);
				$("[id='"+contact_stage_order[i]+"']").attr('onclick','$(this).notify("Can not change status to Previous Level!","warn");return false;');
			}
		}
	}*/
	var valFrom=jq331("#BeanStatus").val();
	var BeanRelevantOffice=jq331("#BeanRelevantOffice").val();
	var BeanRelevantCounselor=jq331("#BeanRelevantCounselor").val();
	console.log("Valform"+valFrom);
	console.log("ValTo"+valTo);
	if(BeanRelevantOffice == ""){
		$("#status_bar").notify("Relevant Office is empty for this student. Please fix and try again!","warn");
		return false;
	}else if(BeanRelevantCounselor == ""){
		$("#status_bar").notify("Counselor is empty for this student. Please fix and try again!","warn");
		return false;
	} else if(valTo=='Assigned To Admission') {
		ShowAdmissionOfficers();
		return false;
	}
	/*28-08-2019 by Hameed: Brother Tariq and Rehan discussed this and decided that the student status will be updated manually - instead of Opportunity status update automatically updating the Student status...'*/
	/*else if(valTo=='Enrolled') {
		$("#status_bar").notify("Can't turn contact as Enrolled manually!", "warn");
		return false;
	}
	else if(valTo=='Admission Applied') {
		$("#status_bar").notify("Please update related opportunity Stage to Commenced & Application Status to Admission Applied", "warn");
		return false;
	}*/
	else if(valTo == valFrom){
		$("#status_bar").notify("Status is same", "warn");
		return false;
	}
	igec.blockFullPage();
    var ID = document.getElementsByName('record')[0].value;
    var data = { 'ID' :ID,'to_status':valTo};
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Contacts&action=changeStage&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: true,
        success: function(data) {
			location.reload();
			//jq331.unblockUI();
            //jq331('#contact_stage').text(valTo);
            //jq331('#BeanStatus').val(valTo);
			
        },
        error: function(request,status,errorThrown) {
            console.log(request+' '+status+' '+errorThrown);
        }
    });
}
function ShowAdmissionOfficers(){
	jq331('#admission_officer_id').val(['-1']).trigger('change');
	$("#assigned_to_adminssion_officer").modal('show');
}
function updateAssignedUser(record){
	/* alert(record);*/
	jq331("#assigntoadmission_modal_popup").block();
	if(jq331('#admission_officer_id').val() == null || jq331('#admission_officer_id').val() == ""){
		$("#admission_officer_id").notify("Please Select","warn");
		jq331("#assigntoadmission_modal_popup").unblock();
		return false;
	}else{
		var user = $('#admission_officer_id').val();
		var userName = $('#admission_officer_id option:selected').text();
		var AssignedTo1 = $('#studentAssignedTo').text();
		
		$.ajax({
			type: "POST",
			url: "index.php?module=Contacts&action=AssignedToAdmissionOfficer",
			data: 'sugar_body_only=1&function=updateAssignment&record='+record+'&user_id='+user,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			async: true,
			success: function (response) {
				location.reload();
				//jq331("#assigntoadmission_modal_popup").unblock();
				
				//$("#assigned_to_adminssion_officer").modal('hide');
				//jq331('#contact_stage').text("Assigned To Admission");
				//jq331('#studentAssignedTo').text(userName);
				//jq331('#studentTempAssignedTo').text(AssignedTo1);
				//jq331('#BeanStatus').val("Assigned To Admission");
				
			},
		});
		
	}
}