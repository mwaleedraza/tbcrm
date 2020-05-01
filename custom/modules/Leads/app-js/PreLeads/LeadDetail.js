var LeadDetail = {
    leadDetailEventHandler: function () {
        jq331('.lddiscicon').click(function () {
            LeadDetail.discardOpportunity(this);
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
			},2000);
			
        })
    }
}
function changeStatus(valTo){
	var valFrom=jq331("#BeanStatus").val();
	var BeanRelevantOffice=jq331("#BeanRelevantOffice").val();
	var BeanRelevantCounselor=jq331("#BeanRelevantCounselor").val();
    if(valFrom=='Converted') {
        $("#status_bar").notify("Can't change status once lead is converted!","warn");
        return false;
    }
    else if(valFrom=='In Process' && valTo=='Converted') {
		if(BeanRelevantOffice == "" || BeanRelevantCounselor == ""){
			$("#status_bar").notify("Relevant Office and Counselor is empty, can't be converted!","warn");
			return false;
		}else{
			var ID = document.getElementsByName('record')[0].value;
			// document.location='index.php?module=Leads&action=ConvertLead&record='+ID;
			// return true;
			convertLead(ID);
		}
    }
    else if(valFrom!='In Process' && valTo=='Converted') {
        $("#status_bar").notify("Lead with In Process status can be converted only!","warn");
        return false;
    }
	igec.blockFullPage();
    var ID = document.getElementsByName('record')[0].value;
    var data = { 'ID' :ID,'to_status':valTo};
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Leads&action=leadStatusUpdate&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: true,
        success: function(data) {
			jq331.unblockUI();
            jq331('#lead_status').text(valTo);
            jq331('#BeanStatus').val(valTo);
        },
        error: function(request,status,errorThrown) {
            console.log(request+' '+status+' '+errorThrown);
        }
    });
}
function saveNewNoteClicked(closeWhenDone) {
	var retId;
	var relMod;
	var rowId
	jq331("#leadtimeline_modal_popup").block();
    if( jq331('#note_title').val()=='' ){
        jq331("#note_title").css({'background' : '#c50e27'});
		jq331("#leadtimeline_modal_popup").unblock();
        return false;
    }
    var note_title = jq331('#note_title').val();
    var note_description = jq331('#note_description').val();
    var beanId= jq331('#igec_special_notes_id').val();
    /* Saving Note */
    var ID = document.getElementsByName('record')[0].value;
    var data = { 'related_module':'Leads','bean':'igec_special_notes','ID' :ID,'name':note_title , 'description':note_description,'igec_special_notes_id':beanId};
	jq331("#leadtimeline_modal_popup").block();
	setTimeout(function(){
		retId = saveNote(data);
		relMod= 'igec_special_notes';
		rowId=relMod+retId;
		getUpdatedTimeLine(ID);
	},2000);
	jq331("#leadtimeline_modal_popup").unblock();
    if(beanId!=''){
        jq331('#igec_special_notes'+beanId).remove();
    }

    if (closeWhenDone && closeWhenDone == true) {
        $('#addNoteForm').modal('hide');
    };
    jq331('#igec_special_notes_id').val('');
    // jq331('#note_form').trigger('reset');
}
function saveNote(data) {
    var retId='';

    jq331.ajax({
        type: "POST",
        url: "index.php?module=igec_special_notes&action=saveSpecialNote&sugar_body_only=true",
        data: data,
        contentType: 'application/x-www-form-urlencoded',
        dataType: 'text',
        async: false,
        success: function (data) {
            if (typeof data != 'undefined' && data != '') {
                retId=data;
            }
        },
        error: function (request, status, errorThrown) {
            console.log(request + ' ' + status + ' ' + errorThrown);
        }
    });
    jq331('#time_line_section').css('padding-left','20%');
    return retId;
}
function getUpdatedTimeLine(id){
    jq331.ajax({
        type: "POST",
        url: "index.php?module="+currentModule+"&action=getUpdatedTimeline&sugar_body_only=true",
        data: {'id':id,},
        success: function(result){
            jq331("#timeline_div").html(result);
        },
        error: function(result){
            console.log('Timeline ajax failed');
        }
    });
}
function editLineItem(modu,rec){
    $('#addNoteForm').modal('show');
    jq331('#igec_special_notes_id').val(rec);
    jq331('#note_title').val( jq331('#'+modu+'_'+rec+'_name').text() );
    jq331('#note_description').val( jq331('#'+modu+'_'+rec+'_description').text() );
}
function convertLead (ID){
    jq331.ajax({
        type: "POST",
        url: "index.php?module=Leads&action=convertLeadToContact&sugar_body_only=true",
        data: {'record':ID},
        success: function(result){
            var stdName=$('#fullName').text().trim();
            var std='Student <a style="color:#a77422;" href="index.php?module=Contacts&action=DetailView&record='+result+'">'+stdName+'</a>';
            $('#converted_student_link').html(std);
            $('#converted_student_link').show();
            $('#status_bar').notify('Converted successfully','success');
        },
        error: function(result){
            console.log('Conversion error');
        }
    });
}