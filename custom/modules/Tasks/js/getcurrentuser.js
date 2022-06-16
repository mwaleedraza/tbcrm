
$(document).ready(function () {
    var record_id=document.getElementsByName('record')[0].value;
    $.ajax({
        type: "GET",
        url: "index.php?module=Tasks&action=checkcreatedby&sugar_body_only=true",
        data:{
            record_id:record_id,
        },
        success: function (response) {
            // console.log(response);
            if(response!=1)
            {
                document.getElementById('close_button').style.display='none';
                document.getElementById('close_and_create_new_button').style.display='none';
            }	
        }
    }); 
});