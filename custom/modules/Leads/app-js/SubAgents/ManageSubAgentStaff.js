var ManageSubAgentStaff = {
    manageStaffClicked: function (obj) {
		var subAgId = jq331(obj).attr('data-subAgentId');
		jq331('#sub_AgentId').val(subAgId);
		// jq331('#existingCommTab').DataTable().destroy();
		subagenttab.destroy();
		SubAgents.setupSubAgentCommissionElements(subAgId);
		getStaff(subAgId);
        jq331('#staffdiv2').show();
        jq331('#agtabdiv').addClass('disabled1');
        animateScrollTo(document.querySelector('#staffdiv2'));
    },
	saveNewStaffClicked: function (obj) {
		igec.blockFullPage();
			if( jq331('#first_name').val()=='' ){
				jq331.unblockUI();
				jq331("#first_name").css({'background' : '#c50e27'});
				$("#first_name").notify("Required","warn");
				return false;
			}
			else if( jq331('#last_name').val()=='' ){
				jq331.unblockUI();
				jq331("#last_name").css({'background' : '#c50e27'});
				$("#last_name").notify("Required","warn");
				return false;
			}
			var file = document.getElementById('photo_file').files[0];
			var subagent_id = jq331('#subagent_id').val();
			var file_name = jq331('#photo').val();
			var fname = jq331('#first_name').val();
			var lname = jq331('#last_name').val();
			var email1 = jq331('#email1').val();
			var phone_mobile = jq331('#phone_mobile').val();
			var phone_work= jq331('#phone_work').val();
			var position= jq331('#position').val();
			var department= jq331('#department').val();
			var formdata = new FormData();
			formdata.append('subagent_id',subagent_id);
			formdata.append('file',file);
			formdata.append('file_name',file_name);
			formdata.append('fname',fname);
			formdata.append('lname',lname);
			formdata.append('email1',email1);
			formdata.append('phone_mobile',phone_mobile);
			formdata.append('phone_work',phone_work);
			formdata.append('position',position);
			formdata.append('department',department);
			jq331.ajax({
				type: "POST",
				url: "index.php?module=igec_sponsor_organization&action=saveNewSubAgentStaff&sugar_body_only=true",
				data: formdata,
				//contentType: 'application/x-www-form-urlencoded',
				cache : false,
				dataType    : 'json',
				processData: false,
				contentType: false,
				success: function (data) {
					if (typeof data != 'undefined' && data != '') {
						var src='';
						if(file_name != "" && file_name != null){
							src='igecStaffImages/'+data;
						}else{
							src='custom/include/UI/app-assets/images/man.png';
						}
						var newdiv= '<div class="col-sm-4"><div class="card border-teal border-lighten-2"><span data-staffid="'+data+'" class="fa fa-times cursor-pointer delstaff" style="text-align: right;"></span><div class="text-center"><div class=""><img src="'+src+'" class="rounded-circle  height-150" alt="Card image" style="width:150px;height:150px;"></div><div class="card-body"><h4 class="card-title">'+fname+' '+lname+'</h4><h6 class="card-subtitle text-muted">'+position+'</h6><h6 class="grey">'+email1+'</h6></div></div></div></div>';
						jq331(".populateStaff").append(newdiv);
						$("#upload_img").trigger("reset");
						$('#imagePreview').css('background-image', 'url("custom/include/UI/app-assets/images/man.png")');
						jq331('#subagent_id').val(subagent_id);
						delstaff();
						jq331.unblockUI();
					}
					
				},
				error: function (request, status, errorThrown) {
					console.log(request + ' ' + status + ' ' + errorThrown);
				}
			});
			// jq331('#note_form').trigger('reset');
		},

    manageStaffClicked2: function (obj) {
        var accountId = $(obj).attr('data-instId');
        //now that we have the account Id, call to CRM to fetch the Staff data for the selected Account(Institute)
        //and show the popup dialog 'Manage Staff' - prepopulated with the data we get from CRM.
        $('#manageInstStaffForm').modal('show');
    }
}
var dummyStaffData = [
    {
        "name": "Muhammad Saleh",
        "position": "Counselor",
        "email": "ms@yahoo.com",
        "pic": "../app-assets/images/prof.jpg"
    },
    {
        "name": "Sultan Haroon",
        "position": "Counselor",
        "email": "sh@yahoo.com",
        "pic": "../app-assets/images/prof.jpg"
    }
]
function getStaff(rec){
	jq331("#subagent_id").val(rec);
	jq331("#photo_file").change(function () {
		readURL(this);
		jq331("#photo").val(jq331("#photo_file").val());
	});
	jq331.ajax({
		type: "POST",
		url: "index.php?module=igec_sponsor_organization&action=getSubAgentStaffData&sugar_body_only=true",
		data: {record :rec},
		// contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		success: function(result) {
			jq331(".populateStaff").html(result);
			jq331("#subagent_id").val(rec);
			delstaff();
		},
		error: function(request,status,errorThrown) {
			console.log(request+' '+status+' '+errorThrown);
		}
	});

}
function delstaff(){
	$('.delstaff').click(function () {
		var staffid = $(this).attr('data-staffid');
		swal({
			title: 'Are you sure?',
			text: "You won't be able to revert this!",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
			jq331.ajax({
				type: "POST",
				url: "index.php?module=igec_sponsor_organization&action=delStaffData&sugar_body_only=true",
				data: {delid :staffid},
				// contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				success: function(result) {
					console.log("Deleted Successfully");
				},
				error: function(request,status,errorThrown) {
					console.log(request+' '+status+' '+errorThrown);
				}
			});
			jq331(this).parent().parent().remove();
			//if delete to crm is ok, remove from fontend as well
			
		})
	});
}

//image upload
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			jq331('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
			jq331('#imagePreview').hide();
			jq331('#imagePreview').fadeIn(650);
		}
		reader.readAsDataURL(input.files[0]);
	}
}