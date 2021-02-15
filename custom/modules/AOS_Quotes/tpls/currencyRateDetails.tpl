<div class="col-md-6">
    <label>Currency Rate: </label><input type="text" name="currency_rate" id="currency_rate">
</div>


<div class="col-md-6">
    <label>Currency Rate Reference Link: </label><input type="text" name="curr_rate_ref_link" id="curr_rate_ref_link">
</div>

{literal}
    <script>
        $(document).ready(function(){
            
            $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
                $('#currency_rate').val('');
                $('#curr_rate_ref_link').val('');
        });
        function getCurrencyDetails(){
            $('#currency_rate').val('');
            $('#curr_rate_ref_link').val('');
            var currency = $("#currency_id_select").val();
            if (currency == '84a72924-24e5-87b3-48bb-600eac4cd8a9' || currency == '85944da1-4774-114d-fcb7-600eacbbc797' || currency == 'e3849805-0b1e-6f46-fd95-600eac01a876'){
                $('div[data-label = "LBL_CURRENCY_RATE"]').parent().show();
            }
            else{
                $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
            }
        }

        $("#currency_id_select").on("change", function(){
            getCurrencyDetails();
        });
    </script>
{/literal}