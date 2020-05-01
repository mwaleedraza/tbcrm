// var salesStages = ['Prospecting', 'In Progress', 'Offer Acceptance', 'Enrolled', 'Visa Process', 'Traveled', 'Commenced', 'Pipeline', 'Duplicate Dropped', 'Closed Won', 'Closed Lost'];

var salesStages =SUGAR.language.get('app_list_strings', 'sales_stage_dom');
//application_status_list

var ss_Prospecting = {"Prospecting_Not Filed": "Not Filed"};
var ss_InProgress = {"In Progress_Application Lodged": "Application Lodged","In Progress_Acknowledgment Received": "Acknowledgment Received","In Progress_Application Pending": "Application Pending","In Progress_Offer Approved Conditional": "Offer Approved Conditional","In Progress_Offer Approved Unconditional": "Offer Approved Unconditional","In Progress_Offer Deferred": "Offer Deferred" ,"In Progress_Offer Rejected": "Offer Rejected"}
var ss_OfferAcceptance = {"Offer Acceptance_Acceptance Form Deferred": "Acceptance Form Deferred","Offer Acceptance_Acceptance Form Issued": "Acceptance Form Issued","Offer Acceptance_Acceptance Form Requested": "Acceptance Form Requested","Offer Acceptance_Offer Accepted": "Offer Accepted"};
var ss_Enrolled = {"Enrolled_Enrolled":"Enrolled"};
var ss_VisaProcess = {"Visa Process_Visa Applied": "Visa Applied","Visa Process_Visa Pending": "Visa Pending","Visa Process_Visa Issued": "Visa Issued","Visa Process_Visa Rejected": "Visa Rejected"};
var ss_Traveled = {"Traveled_Traveled": "Traveled"};
var ss_Commenced = {"Commenced_Commenced": "Commenced"};
var ss_Pipeline = {"Pipeline_1st Commencement": "1st Commencement" ,"Pipeline_2nd Commencement": "2nd Commencement","Pipeline_3rd Commencement": "3rd Commencement","Pipeline_4th Commencement": "4th Commencement"};
var ss_DuplicateDropped = {"Duplicate Dropped_Duplicate Dropped": "Duplicate Dropped"};
var ss_ClosedWon = {"Closed Won_Closed Won": "Closed Won"};
var ss_ClosedLost = {"Closed Lost_Closed Lost": "Closed Lost"};

// var course_startdate_actual = jq331("#course_startdate_actual").val();
// if(course_startdate_actual!='') {
//     const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
//     let current_datetime = new Date(jq331('#course_startdate_actual').val());
//     let formatted_date = current_datetime.getDate() + " " + months[current_datetime.getMonth()] + ", " + current_datetime.getFullYear();
//     jq331('#TravelDate').val(formatted_date);
// }
// jq331("#TravelDate").change(function () {
//     var  current_datetime = new Date(jq331("#course_startdate_actual").val());
//     let formatted_date = (current_datetime.getMonth()+1) + "/" + current_datetime.getDate()  + "/" + current_datetime.getFullYear();
//     jq331("#course_startdate_actual").val(formatted_date);
// });

// var commence_date = jq331("#commence_date").val();
// if(commence_date!='') {
//     const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
//     let current_datetime = new Date(jq331('#commence_date').val());
//     let formatted_date = current_datetime.getDate() + " " + months[current_datetime.getMonth()] + ", " + current_datetime.getFullYear();
//     jq331('#CommencDate').val(formatted_date);
// }
// jq331("#CommencDate").change(function () {
//     var  current_datetime = new Date(jq331("#commence_date").val());
//     let formatted_date = (current_datetime.getMonth()+1) + "/" + current_datetime.getDate()  + "/" + current_datetime.getFullYear();
//     jq331("#commence_date").val(formatted_date);
// });


// var course_startdate_expected = jq331("#commence_date").val();
// if(course_startdate_expected!='') {
//     const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
//     let current_datetime = new Date(jq331('#course_startdate_expected').val());
//     let formatted_date = current_datetime.getDate() + " " + months[current_datetime.getMonth()] + ", " + current_datetime.getFullYear();
//     jq331('#CommencDate').val(formatted_date);
// }
// jq331("#CommencDate").change(function () {
//     var  current_datetime = new Date(jq331("#course_startdate_expected").val());
//     let formatted_date = (current_datetime.getMonth()+1) + "/" + current_datetime.getDate()  + "/" + current_datetime.getFullYear();
//     jq331("#commence_date").val(formatted_date);
// });

var OppPopup = {

    setupStatusDropdowns: function () {
        jq331('#Sales-StageDD').select2({});
        jq331('#Application-StatusDD').select2({});
        //add all Sales stages to the Dropdown
        jQuery.each(salesStages, function(index, item) {
            // do something with `item` (or `this` is also `item` if you like)
            var dataSS = {
                id: index,
                text: item
            };
            var newOption = new Option(dataSS.text, dataSS.id, false, false);
            jq331('#Sales-StageDD').append(newOption).trigger('change');
        });

        //event listener to the Sales Stage such that on-selection of Sales Stage, the Application-Status DD changes
        jq331('#Sales-StageDD').on("select2:select", function (event) {

            OppPopup.salesStageSelected();
        });
        //event listener to the Application-Status DD 
        jq331('#Application-StatusDD').on("select2:select", function (event) {
            OppPopup.applicationStatusSelected();
        });
        jq331('#Application-StatusDD').on("change", function (event) {
            OppPopup.applicationStatusSelected();
        });
        //set the current values (previously save)
        OppPopup.setCurrentValues();
    },

    salesStageSelected: function () {
        // check what sales-stage is selected and update the Application-Status accordingly
        var selectedSalesStage = jq331("#Sales-StageDD option:selected").val()
        var appsel = jq331('#Application-StatusDD');
        appsel.empty();
        jq331('.secondarydiv').hide();
        if (selectedSalesStage == 'Prospecting') {
            jQuery.each(ss_Prospecting, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
                OppPopup.applicationStatusSelected();
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'In Progress') {
            jQuery.each(ss_InProgress, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Offer Acceptance') {
            jQuery.each(ss_OfferAcceptance, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Enrolled') {
            jQuery.each(ss_Enrolled, function(index, item) {
                data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Visa Process') {
            jQuery.each(ss_VisaProcess, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Traveled') {
            jQuery.each(ss_Traveled, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Commenced') {
            jQuery.each(ss_Commenced, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Pipeline') {
            jQuery.each(ss_Pipeline, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Duplicate Dropped') {
            jQuery.each(ss_DuplicateDropped, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Closed Won') {
            jQuery.each(ss_ClosedWon, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Closed Lost') {
            jQuery.each(ss_ClosedLost, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDD').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDD').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        }
    },

    applicationStatusSelected: function () {
        //first hide all secondary divs
        jq331('.secondarydiv').hide();

        // check what sales-stage is selected and update the Application-Status accordingly
        var selectedAppStatus = jq331("#Application-StatusDD option:selected").val();

        if (selectedAppStatus) {
            if (selectedAppStatus == 'In Progress_Offer Approved Conditional') {
                jq331('#offcondiv').show('slow');
                return;
            } else if (selectedAppStatus == 'Offer Acceptance_Acceptance Form Requested') {
                jq331('#accFormTypeDiv').show('slow');
            } else if (selectedAppStatus == 'Traveled_Traveled') {
                jq331('#travelDateDiv').show('slow');
            } else if (selectedAppStatus == 'Commenced_Commenced') {
                jq331('#commenceDateDiv').show('slow');
            } else if (selectedAppStatus.includes('Commencement') == true) {
                jq331('#expStDateDiv').show('slow');
            }
        };
    },

    setCurrentValues: function () {
        var currentSalesSt = jq331('#Sales-Stage').text();
        var acceptance_form_type = jq331('#acceptance_form_type').text();
        var currentAppStat = jq331('#Application-Status').text();
        var currentAppStatText = jq331('#Application-Status-text').text();
        jq331('#currslstg').text(currentSalesSt.trim());
        jq331('#Sales-StageDD').val(currentSalesSt.trim());
        OppPopup.salesStageSelected();
        jq331('#curappstat').text(currentAppStatText.trim());
        jq331('#Application-StatusDD').val(currentAppStat.trim()).trigger('select');
        OppPopup.applicationStatusSelected();
        jq331('#Acceptance-Form-TypeDD').val(acceptance_form_type);

    }
}

function saveFeedback(ID) {
    if (jq331('#feedbackTitle').val() == '') {
        jq331("#feedbackTitle").css({'background': '#c50e27'});
        return false;
    }
    jq331('#opp_model_popup').block();

    var title = jq331('#feedbackTitle').val();
    var accountId = jq331('#account_id_hidden').val();
    var description = jq331('#Feedback-Notes').val();
    var data = {
        'ID': ID,
        'title': title,
        'account_id': accountId,
        'description': description
    };
    jq331.ajax({
        type: "POST",
        url: "index.php?module=igec_manage_feedback&action=saveFeedback&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: true,
        success: function (data) {
            $('#saveFeedbackBtn').notify("Feedback submitted successfully!","success");
            jq331('#feedbackTitle').val('');
            jq331('#Feedback-Notes').val('');
            jq331('#opp_model_popup').unblock();
        },
        error: function (request, status, errorThrown) {
            console.log(request + ' ' + status + ' ' + errorThrown);
        }
    });
}
function saveDocumment(ID){
    jq331('#opp_model_popup').block();
    var run=true;

    /*
    *   Processing doc saving
    */
    var category = '';
    var description = '';
    var dz = Dropzone.forElement("#dropzoneId");
    // dz.options.url = "index.php?module=Documents&action=saveDocument&sugar_body_only=true&id="+ID;
    dz.on('sending', function(file, xhr, formData){
        formData.append('id', ID);
        formData.append('category', category);
        formData.append('description', description);
        formData.append('rel_module', 'Opportunities');
    });
    dz.processQueue();
    dz.on("successmultiple", function(file,response) {
        if (dz.getUploadingFiles().length === 0 && dz.getQueuedFiles().length === 0 && run==true) {
            data=JSON.parse(response);
            for (i = 0; i < data.length; i++) {
                if(typeof(data['0'])=='undefined' || data['0']=='')
                    console.log("Error occured while uploading !");

                else if(typeof(data[i])!='undefined' && data[i].rev_id!='') {
                    var fileId=data[i].doc_id;
                    var fileName=data[i].name;
                    var relMod='Documents';

                    var newRow='<div id="" class="col-sm-4 text-center cursor-pointer"><i class="fa fa-file-text-o fa-2x red"></i><p><a href=index.php?entryPoint=download&id=' + data[i].rev_id + '&type=Documents>'+fileName+'</a></p><div>';
                    jq331('#existing_docs').append(newRow);

                    dz.removeFile(file);
                }
            }
            run=false;
        }

    });
    dz.on("queuecomplete", function(file) {
        dz.removeAllFiles();
        jq331('#opp_model_popup').unblock();
    });

}

function saveResponse(ID) {
	jq331('#opp_model_popup').block();
	setTimeout(function (){
		if( jq331('#historyTypeDD').val()=='' || jq331('#historyTypeDD').val()=='-1' || jq331('#historyTypeDD').val()==null){
			jq331('#opp_model_popup').unblock();
			jq331("#historyTypeDD").css({'background' : '#c50e27'});
			$('#historyTypeDD').notify('Required Field.','warn');
			jq331("#historyTypeDD").css({'color' : 'white'});
			return false;
		}
		if( jq331('#specialNotes').val()=='' || jq331('#specialNotes').val()==null){
			jq331('#opp_model_popup').unblock();
			$('#specialNotes').notify('Required Field.','warn');
			return false;
		}
		
		var note_title = jq331('#historyTypeDD').val();
		var note_description = jq331('#specialNotes').val();
		//var note_response = tinyMCE.activeEditor.getContent();

		var run=true;

		var dz = Dropzone.forElement("#dropzoneTL");
		if(dz.files==''){
			var data = { 'rel_module':'Opportunities','id':ID,'note_title' :note_title,'note_description':note_description};
			jq331.ajax({
				type: "POST",
				url: "index.php?module=igec_response_history&action=saveResponse&sugar_body_only=true",
				data: data,
				contentType: 'application/x-www-form-urlencoded',
				dataType: 'text',
				async: false,
				success: function (data) {
					$('#saveAppEventBtn').notify('Successfully submitted!','success');
					getOppUpdatedTimeLine(ID);
					setTimeout(function (){
						jq331('#opp_model_popup').unblock();
					},300);

				},
				error: function (request, status, errorThrown) {
					console.log(request + ' ' + status + ' ' + errorThrown);
				}
			});
		}
		else {
			dz.on('sending', function (file, xhr, formData) {
				formData.append('id', ID);
				formData.append('rel_module', 'Opportunities');
				formData.append('note_title', note_title);
				formData.append('note_description', note_description);
			});
		}
		dz.processQueue();
		dz.on("success", function(file,response) {
			if (dz.getUploadingFiles().length === 0 && dz.getQueuedFiles().length === 0 && run==true) {
				data=JSON.parse(response);
				for (i = 0; i < data.length; i++) {
					if(typeof(data['0'])=='undefined' || data['0']=='')
						console.log("Error occured while uploading !");

					else if(typeof(data[i])!='undefined' && data[i].rev_id!='') {
                        var fileName=data[i].name;
                        var newRow='<div id="" class="col-sm-4 text-center cursor-pointer"><i class="fa fa-file-text-o fa-2x red"></i><p><a href=index.php?entryPoint=download&id=' + data[i].rev_id + '&type=igec_response_history>'+fileName+'</a></p><div>';
                        jq331('#existing_docs').append(newRow);
						dz.removeFile(file);
					}
				}
				run=false;
			}

		});
		dz.on("queuecomplete", function(file) {
			getOppUpdatedTimeLine(ID);
			dz.removeAllFiles();
		});

		jq331('#specialNotes').val('');
		//tinyMCE.activeEditor.setContent('');
		jq331('#opp_model_popup').unblock();

		jq331('#newtimelinediv').hide('slow');
		$('#ntlbtn').notify('Successfully submitted!','success');

			
	},2000);

}
function getOppUpdatedTimeLine(id){
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Opportunities&action=getUpdatedTimeline&sugar_body_only=true",
        data: {'id':id,},
        success: function(result){
            jq331("#opp_timeline").html(result);
			systemEntries();
        },
        error: function(result){
            console.log('Timeline ajax failed');
        }
    });
}
function saveOpp(ID){
    jq331('#opp_model_popup').block();
	if(jq331('#Sales-StageDD').val()=="Commenced" && jq331('#commence_date').val()==""){
		jq331('#opp_model_popup').unblock();
		$("#commence_date").notify("Please Enter Commenced Date.","warn");
		return false;
	}
	if(jq331('#Sales-StageDD').val()=="Commenced" && jq331('#course_start_date_user_input').val()==""){
		jq331('#opp_model_popup').unblock();
		$("#course_start_date_user_input").notify("Please Enter Course Start Date.","warn");
		return false;
	}
	if(jq331('#Sales-StageDD').val()=="Commenced" && jq331('#course_provider_std_id').val()==""){
		jq331('#opp_model_popup').unblock();
		$("#course_provider_std_id").notify("Please Enter Student Institute ID.","warn");
		return false;
	}
	
    var course_startdate_actual= jq331('#course_startdate_actual').val();
    var commence_date=  jq331('#commence_date').val();
    var course_startdate_expected=  jq331('#course_startdate_expected').val();
    var acceptance_form_type=  jq331('#Acceptance-Form-TypeDD').val();
    var offer_conditions= jq331('#Offer-Conditions').val();
    var sales_stage= jq331('#Sales-StageDD').val();
    var application_status= jq331('#Application-StatusDD').val();
    var course_provider_std_id= jq331('#course_provider_std_id').val();
    var course_start_date_user_input= jq331('#course_start_date_user_input').val();
    var course_duration= jq331('#course_duration').val();
    if (jq331('#notifyCounselorCB').is(':checked'))
        var notifyCounselorCB= '1';
    else
        var notifyCounselorCB= '0';
    var data = {
        'ID': ID,
        'course_startdate_actual': course_startdate_actual,
        'commence_date': commence_date,
        'course_startdate_expected': course_startdate_expected,
        'acceptance_form_type': acceptance_form_type,
        'offer_conditions': offer_conditions,
        'is_notify': notifyCounselorCB,
        'sales_stage': sales_stage,
        'application_status': application_status,
        'course_provider_std_id': course_provider_std_id,
        'course_start_date_user_input': course_start_date_user_input,
        'course_duration': course_duration
    };

	var app_status=application_status.split("_").pop();
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Opportunities&action=updateOpportunity&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: true,
        success: function (data) {
			getOppUpdatedTimeLine(ID);
            $('#save_opp').notify("Opportunity Updated successfully!","success");
			$('#Sales-Stage').html(sales_stage);
			$('#Application-Status-text').html(app_status);
            $('#opp_'+data+ ' td:nth-child(3)').text(sales_stage);
            $('#opp_'+data+ ' td:nth-child(4)').text(app_status);
            $('#currslstg').text(sales_stage);
            $('#curappstat').text(app_status);
            jq331('#opp_model_popup').unblock();
			
        },
        error: function (request, status, errorThrown) {
            console.log(request + ' ' + status + ' ' + errorThrown);
        }
    });
}
function discardOpp(ID,description='',src='') {
    if(src!='')
        jq331('#opp_model_popup').block();
    var data = {
        'ID': ID,
        'description': description
    };
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Opportunities&action=discardOpportunity&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: true,
        success: function (data) {
            if(src!=''){
                $('#discardOpp').notify('Opportunity discarded successfully','success');
                $('#Discard-Reason').val('');
                jq331('#opp_model_popup').unblock();
            }
            $('#opp_'+ID).remove();
        },
        error: function (request, status, errorThrown) {
            console.log(request + ' ' + status + ' ' + errorThrown);
        }
    });
}
function updateOfficeInfo(ID) {
	jq331('#opp_model_popup').block();
	var from_subagent = jq331("#from_subagent").val();
	var igec_subagents_id = jq331("#igec_subagents_id").val();
	var securitygroup_id = jq331("#securitygroup_id").val();
	var office_user = jq331("#office_user").val();
	if(from_subagent == ""){
		$('#from_subagent').notify('Please Choose','warn');
		jq331('#opp_model_popup').unblock();
		return false;
	}else if(from_subagent == "Yes" && igec_subagents_id == null){
		$('#igec_subagents_id').notify('Please Choose','warn');
		jq331('#opp_model_popup').unblock();
		return false;
	}
	else if(securitygroup_id == "" || securitygroup_id == null){
		$('#securitygroup_id').notify('Choose Relevant Office','warn');
		jq331('#opp_model_popup').unblock();
		return false;
	}else if(office_user == "" || office_user == null){
		$('#office_user').notify('Choose Relevant Counselor','warn');
		jq331('#opp_model_popup').unblock();
		return false;
	}else{
		var data = {
			'ID': ID,
			'from_subagent': from_subagent,
			'igec_subagents_id': igec_subagents_id,
			'securitygroup_id': securitygroup_id,
			'office_user': office_user
		};
		jq331.ajax({
			type: "POST",
			url: "index.php?module=Opportunities&action=updateOfficeInfo&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			async: true,
			success: function (data) {
                // securitygroup_id
                if($("#securitygroup_id").val()=="" || $("#securitygroup_id").val()==null ||
                    $("#course_currencyD").val()=="" || $("#course_currencyD").val()==null ||
                    $("#course_feeD").val()== "" || $("#course_feeD").val() == null ||
                    $("#course_feeD").val()=='0.000000'){
                    disbaleActions();
                }
                else
                    enableActions();

				$('#update_office_info').notify('Office Info updated successfully','success');
				jq331('#SubagentName').text(jq331("#igec_subagents_id option:selected" ).text());
				jq331('#Securitygroup_Name').text(jq331("#securitygroup_id option:selected" ).text());
				jq331('#Counselor_Name').text(jq331("#office_user option:selected" ).text());
				/*if(from_subagent == 'Yes'){
					jq331("#RelevantOfficeInformation").hide();
				}*/
				// if($("#course_currencyD").val()==null || $("#course_currencyD").val()==''){
				// 	if( $("#course_feeD").val() == '0.0000000'){
				//
				// 	}else{
				// 		enableActions();
                 //    }
				// }
				// else
                 //    enableActions();
				jq331('#opp_model_popup').unblock();
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
		});
	}
}
function systemEntries(){
	
	jq331('#opp_model_popup').block();
	if ($('#showSystem').is(':checked')){
		jq331(".system").show('slow');
	}
	else{
		jq331(".system").hide('slow');
	}
	setTimeout(function(){
		jq331('#opp_model_popup').unblock();
	},500);
}