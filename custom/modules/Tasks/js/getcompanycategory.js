
$(document).ready(function () {
    
    $('#accounts_id').change(function () { 
        let id=document.getElementById('accounts_id').value;
        $.ajax({
            type: "GET",
            url: "index.php?module=Tasks&action=getcompanycategory&sugar_body_only=true",
            data:{
                id:id
            },
            success: function (response) {
                console.log(response);
                document.getElementById('category').value=response.trim();
            }
        });
    }); 
    var url=window.location.href;
    if(url.includes('lead_id'))
    {
        debugger;
        var id=url.split('lead_id=');
        $.ajax({
            type: "GET",
            url: "index.php?module=Tasks&action=createtask&sugar_body_only=true",
            data: {
                id:id[1]
            },
            success: function (response) {
                debugger;
                var result=JSON.parse(response);
                console.log(result);
                $('#name').val(result.title);
                $("#accounts_id").select2().val(result.account).trigger('change');
                setTimeout(function () {
                    $("#contact_id").select2().val(result.contact).trigger("change");
                }, 1500);
                $('#description').val(result.description);
            }   
        });
    }
});