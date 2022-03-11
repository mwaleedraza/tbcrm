<<<<<<< HEAD
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
                console.log(response);
                document.getElementById('category').value=response;
            }
        });
    }); 
=======
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
                console.log(response);
                document.getElementById('category').value=response;
            }
        });
    }); 
>>>>>>> f76da31ca3d45dc2af3729a157f7904548c77879
});