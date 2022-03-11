$(document).ready(function () {
    $.ajax({
        type: "GET",
        url: "index.php?module=Tasks&action=getcurrentuser&sugar_body_only=true",
        success: function (response) {
	if(document.getElementById('created_by').getAttribute('data-id-value')!=response)
	{
		document.getElementById('close_button').style.display='none';
		document.getElementById('close_and_create_new_button').style.display='none';
	}	
        }
    }); 

});