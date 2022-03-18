
$(document).ready(function () {
    debugger;

    $('#accounts_id').change(function () { 
        debugger;
        let id=document.getElementById('accounts_id').value;
        $.ajax({
            type: "GET",
            url: "index.php?module=Tasks&action=getcompanycategory&sugar_body_only=true",
            data:{
                id:id
            },
            success: function (response) {
                debugger;
                console.log(response);
                document.getElementById('category').value=response.trim();
            }
        });
    }); 
});