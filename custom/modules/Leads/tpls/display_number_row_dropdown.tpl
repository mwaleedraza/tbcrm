
{literal}
<script>
$(document).ready(function () {
    if(document.getElementsByClassName('list view').length>0)
    {
        let div=document.createElement('div');
        div.innerHTML='<select name="list_max_entries_per_page" id="list_max_entries_per_page" onchange=change_no_row()><option value="2">2</option><option value="40">40</option><option value="60">60</option><option value="80">80</option><option value="100">100</option></select>';
        $(div).insertBefore(document.getElementsByClassName('listViewBody'));
        $.ajax({
                type: "POST",
                url: "index.php?module=Leads&action=get_no_rows&sugar_body_only=true",
                success: function (response) {
                    document.getElementById('list_max_entries_per_page').value=response;
                    // location.reload(); 
                }
            });
    }
   
});
function change_no_row(){
    if(document.getElementsByClassName('list view'))
    {
        let row=document.getElementById('list_max_entries_per_page').value;
        console.log(row);
        $.ajax({
            type: "POST",
            url: "index.php?module=Leads&action=change_no_rows&sugar_body_only=true",
            data: {
                row:row
            },
            success: function (response) {
                document.getElementById('list_max_entries_per_page').value=response;
                setTimeout(() => { location.reload() }, 3000);
            }
        });
    }
    }
</script>
{/literal}