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
            var currency = $("#currency_id_select").find(':selected').text();
            if (currency == 'US Dollars : $' || currency == 'Great Britain Ponds : £' || currency == 'Euro : €'){
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