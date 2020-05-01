var SubAgents = {
    showDetails: function (obj) {
        jq331('#myModalLabe501').text('View Sub-Agent Details');
        var subAgId = jq331(obj).attr('data-subAgentId');
        jq331('#agtabdiv').addClass('disabled1');
        jq331('#newSubAgForm').modal('show');
        alert('CRM Developer to populate the data for the selected SubAgent to let user VIEW it - Readonly');
    },
    editSubAgentClicked: function (obj) {
        $('#myModalLabe501').text('Edit Sub-Agent Details');
        var subAgId = $(obj).attr('data-subAgentId');
        $('#agtabdiv').addClass('disabled1');
		SubAgents.populateSubagentData(subAgId);
        $('#newSubAgForm').modal('show');
		
    },
	populateSubagentData: function(subAgId){		
		$.ajax({
			url: 'index.php?module=igec_subagents&action=SubagentsDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=edit&record='+subAgId,		
			async: true,			
			success : function (result){
				var data = $.parseJSON(result);
				var count = Object.keys(data).length;
				var keys = Object.keys(data);
				jq331("#securitygroup_id").val(data['securitygroup_id']).trigger('change');
				for(i=0;i<count;i++){
					var key = keys[i];
					$('#'+key).val(data[key]);
				}
				
			}	
		});
	},
    manageStaffClicked: function (obj) {
        var subAgId = jq331(obj).attr('data-subAgentId');
		jq331('#sub_AgentId').val(subAgId);
		// jq331('#existingCommTab').DataTable().destroy();
		subagenttab.destroy();
		SubAgents.setupSubAgentCommissionElements(subAgId);
        jq331('#staffdiv2').show();
        jq331('#agtabdiv').addClass('disabled1');
        animateScrollTo(document.querySelector('#staffdiv2'));
    },

    manageFeedbackClicked: function (obj) {
        var subAgId = jq331(obj).attr('data-subAgentId');
        alert('Not Implemneted yet..');
    },
	manageApprove: function (obj) {
		var subAgId = jq331(obj).attr('data-subAgentId');
		swal({
			title: 'Are you sure?',
			text: "You want to approve",
			type: 'success',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes, Approve it!'
		}).then((result) => {
			jq331.ajax({
				type: "POST",
				url: "index.php?module=igec_subagents&action=approveSubagent&sugar_body_only=true",
				data: {id :subAgId},
				// contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				success: function(result) {
					console.log("Approved Successfully");
					igec.blockFullPage();
					location.reload();
				},
				error: function(request,status,errorThrown) {
					console.log(request+' '+status+' '+errorThrown);
				}
			});
			jq331(this).parent().parent().remove();
			//if delete to crm is ok, remove from fontend as well
			
		})
	},

    //************************************************************************** 
    //New Sub-Agent related JS code
    //**************************************************************************
    //this function is invoked when we load the SubAgents listing page. it sets up the event listeners etc.
    setupNewSubAgentElements: function () {
        //event handler for the + icon, click will open a modal dialog where user can define new SubAgent
		$('#addsubagbtn').click(function () {
			jq331("#pwd").hide();
            $('#myModalLabe501').text('New Sub-Agent');
			SubAgents.populateSubagentData(0);
            $('#agtabdiv').addClass('disabled1');
			$("#subagent_form").trigger('reset');
			jq331('#securitygroup_id').val(['-1']).trigger('change');
            $('#newSubAgForm').modal('show');
        });
		$('#saveNewSubAgentFormBtn').click(function () {
			/* Get Form Data and Save/Update Subagent Record */
			jq331("#subagent_modal_popup").block();
			setTimeout(function(){
				SubAgents.SaveSubagentData();
			},500);
			
        });
        //when the New SubAgent popup dialog closes, we remove the Dim from the background div
        $('#newSubAgForm').on('hidden.bs.modal', function () {
            $('#agtabdiv').removeClass('disabled1');
        });
    },
	/* ********************************************************************** */
	/* 					Save Form to Create or Update Sub Agent			  		*/
	/* ********************************************************************** */
	SaveSubagentData: function () {
        // alert('Inside Save Function ');
		//Name is required Field
		if( jq331('#name').val()=='' ){
			jq331("#subagent_modal_popup").unblock();
			jq331("#name").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#name").notify("Required");		
			
			return false;
		}
		if( jq331('#securitygroup_id').val()=='' || jq331('#securitygroup_id').val()==null){
			jq331("#subagent_modal_popup").unblock();
			jq331("#securitygroup_id").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#securitygroup_id").notify("Required");
			return false;
		}
		if( jq331('#email_sa').val()=='' ){
			jq331("#subagent_modal_popup").unblock();
			jq331("#email_sa").css({
					'background' : '#c50e27',
					'color':'#FFF'
				});
			$("#email_sa").notify("Required");
			return false;
		}

        var record = jq331('#id').val();
		var name = jq331('#name').val();
		var phone_office = jq331('#phone_office').val();
		var phone_fax = jq331('#phone_fax').val();
		var website = jq331('#website').val();
		var email1 = jq331('#email_sa').val();
		var password = jq331('#password').val();
		var billing_address_street = jq331('#billing_address_street').val();
		var billing_address_city = jq331('#billing_address_city').val();
		var billing_address_state = jq331('#billing_address_state').val();
		var billing_address_country = jq331('#billing_address_country').val();
		var shipping_address_street = jq331('#shipping_address_street').val();
		var shipping_address_city = jq331('#shipping_address_city').val();
		var shipping_address_state = jq331('#shipping_address_state').val();
		var shipping_address_country = jq331('#shipping_address_country').val();
		var securitygroup_id = jq331('#securitygroup_id').val();

        var data = {
				'record':record,'name':name,
				'phone_office':phone_office,'phone_fax':phone_fax,
				'website':website,'email1':email1,'password':password,
				'billing_address_street':billing_address_street,
				'billing_address_city':billing_address_city,
				'billing_address_state':billing_address_state,
				'billing_address_country':billing_address_country,
				'shipping_address_street':shipping_address_street,
				'shipping_address_city':shipping_address_city,
				'shipping_address_state':shipping_address_state,
				'shipping_address_country':shipping_address_country,
				'securitygroup_id':securitygroup_id,

			};	
		jq331.ajax({
			type: "POST",
			url: "index.php?module=igec_subagents&action=SubagentsDataController&func=save&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'json',
			async: false,
			success: function (result) {
				jq331("#subagent_modal_popup").unblock();				
				window.location.href='index.php?module=igec_subagents&action=SubagentsListingPage';
				
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
		});
		
    },
	
    //************************************************************************** 
    //Sub-Agent Commissions related JS code
    //************************************************************************** 
    setupSubAgentCommissionElements: function (subAgId) {
        //setup the DataTables for Existing Commissions in the grid
		// jq331('#existingCommTab').DataTable({});
        subagenttab = jq331('#existingCommTab').DataTable({
				"processing": true,
				"serverSide": true,
				"header": 'Content-type: text/html; charset=utf-8',
				"ajax": {
					"url": "index.php?module=igec_subagents&action=getSubagentCommissions&sugar_body_only=true&subagent_id="+subAgId,
					/* "url": "index.php?module=igec_subagents&action=getSubagentCommissions&sugar_body_only=true", */
					"data": function ( data ) {
						//return JSON.stringify(data);
					}
				},
                columns: [
                    {
                        data: "Name",
                        title: "Name",
                        "width": "45%",
                        "mRender": function (data, type, full) {
                            return '<a onclick="SubAgents.editSubAgentCommission(this)" data-subagentComId="' + full["ID"] + ' ">' + full['Name'] + '</a> <i class="oppName fa fa-pencil info cursor-pointer" data-subagentComId="' + full["ID"] + '" onclick="SubAgents.editSubAgentCommission(this)"></i>';
                        }
                    },
                    {
                        data: "CourseLevel",
                        title: "Level",
                        // "width": "20%"
                    },
                    {
                        data: "CalculationMethod",
                        title: "Method",
                        // "width": "10%"
                    },
                    {
                        data: "MinStudents",
                        title: "Min Stds",
                        // "width": "5%"
                    },
					{
                        data: "Commission",
                        title: "Commission",
                        "mRender": function (data, type, full) {
							var sign='';
							if(full['CalculationMethod']=='Percentage Of Annual Fee' || full['CalculationMethod']=='Percentage Of Commission'){
								sign ='%';
							}else{
								sign='';
							}
                            return full['Commission']+sign;
                        }
                    },
					{
                        data: "CounselorCommission",
                        title: "Counselor",
						"mRender": function (data, type, full) {
							var sign='';
							if(full['CalculationMethod']=='Percentage Of Annual Fee' || full['CalculationMethod']=='Percentage Of Commission'){
								sign ='%';
							}else{
								sign='';
							}
                            return full['CounselorCommission']+sign;
                        }
                    },
					{
                        data: "BranchCommission",
                        title: "Branch",
						"mRender": function (data, type, full) {
							var sign='';
							if(full['CalculationMethod']=='Percentage Of Annual Fee' || full['CalculationMethod']=='Percentage Of Commission'){
								sign ='%';
							}else{
								sign='';
							}
                            return full['BranchCommission']+sign;
                        }
                    },
					{
                        "mData": null,
                        "bSortable": false,
                        // "width": "5%",
                        "mRender": function (data, type, full) {
                            return '<i class="red fa fa-times-circle fa-5 cursor-pointer" data-subagentComId="' + full["ID"] + '" onclick="SubAgents.deleteSubAgCom(this)" style="font-size: 25px;"></i>';
                        }
                    },
					
                ]
		});
        
    },

    manageCommissionsClicked: function (obj) {
        var subAgId = jq331(obj).attr('data-subAgentId');
		jq331('#sub_AgentId').val(subAgId);
		// jq331('#existingCommTab').DataTable().destroy();
		subagenttab.destroy();
		SubAgents.setupSubAgentCommissionElements(subAgId);
        jq331('#commdiv2').show();
        jq331('#agtabdiv').addClass('disabled1');
        animateScrollTo(document.querySelector('#commdiv2'));
    },
	editSubAgentCommission: function (obj) {
        var AgComId = $(obj).attr('data-subagentComId');
		SubAgents.populateSubagentComData(AgComId);       
		
    },
	ClearAgentCommissionForm: function () {
        jq331('#com_id').val('');
		jq331('#subject').val('');
		jq331('#inst-in').val('').trigger('change');
		jq331('#level-in').val('All').trigger('change');
		jq331('#calmethod-in').val('Percentage Of Annual Fee').trigger('change');
		jq331('#minstudent').val('1');
		jq331('#commission').val('');   		
		jq331('#counselor_commission').val('0');   		
		jq331('#branch_commission').val('0');   		
    },
	// SubAgents.deleteSubAgCom(this)
	deleteSubAgCom: function (obj) {
        var AgComId = $(obj).attr('data-subagentComId');
		var sub_AgentId = $('#sub_AgentId').val();
		$.ajax({
			url: 'index.php?module=igec_subagents&action=SubagentsDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=delete&type=igec_subagent_commissions&record='+AgComId,		
			async: true,			
			success : function(result) {				
				// console.log(result);
				subagenttab.destroy();
				SubAgents.setupSubAgentCommissionElements(sub_AgentId);
			}	
		});      
		
    },
	populateSubagentComData: function(AgComId){		
		$.ajax({
			url: 'index.php?module=igec_subagents&action=SubagentsDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=get&type=igec_subagent_commissions&record='+AgComId,		
			async: true,			
			success : function(result) {
				var data = $.parseJSON(result);
				jq331('#com_id').val(data['com_id']);
				jq331('#subject').val(data['subject']);
				jq331('#inst-in').val(data['inst_id']).trigger('change');				
				jq331('#calmethod-in').val(data['calmethod']).trigger('change');
				jq331('#minstudent').val(data['minstudent']);
				jq331('#commission').val(data['commission']);
				jq331('#branch_commission').val(data['branch_commission']);
				jq331('#counselor_commission').val(data['counselor_commission']);
				// jq331('#level-in').val(data['course_level']).trigger('change');
				jq331('#level-in').val(data['course_level']);
			}	
		});
	},
	populateCourseLevel: function(institute_id){		

		$.ajax({
			url: 'index.php?module=igec_subagents&action=SubagentsDataController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=getRelatedCourses&record='+institute_id,		
			async: true,			
			success : function(result) {
				var data = $.parseJSON(result);
				var count = Object.keys(data).length;
				var keys = Object.keys(data);
				var options = '<option value="-1">All</option>';
				for(i=0;i<count;i++){
					var key = keys[i];
					options += '<option value="'+key+'">'+data[key]+'</option>';
					// options += '<option value="'+data[key]+'">'+data[key]+'</option>';
				}
				$('#level-in').html(options);
			}	
		});
	},
	
}