
{literal}
<script>
$(document).ready(function () {
    debugger;
    let div=document.createElement('div');
    div.innerHTML='<select name="list_max_entries_per_page" id="list_max_entries_per_page" onblur=change_no_row() ><option value="20">20</option><option value="40">40</option><option value="60">60</option><option value="80">80</option><option value="100">100</option></select>';
    $(div).insertBefore(document.getElementsByClassName('listViewBody'));
   
});
function change_no_row(){
        debugger;
        let row=document.getElementById('list_max_entries_per_page').value;
        console.log(row);
        $.ajax({
            type: "POST",
            url: "index.php?module=Leads&action=change_no_rows&sugar_body_only=true",
            data: {
                row:row
            },
            success: function (response) {
                console.log(response);
                location.reload();
            }
        });
    }
</script>
{/literal}