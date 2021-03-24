
$(document).ready(function () {
    
    $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
    $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().hide();
        $('#currency_rate').val('');
        $('#curr_rate_ref_link').val('');

    getCurrencyDetails();
    
    $("#currency_id_select").on("change", function () {
        getCurrencyDetails();
    });
});
function getCurrencyDetails(){
    $('#currency_rate').val('');
    $('#curr_rate_ref_link').val('');
    var currency = $("#currency_id_select").find(':selected').text();
    if (currency == 'US Dollar : $' || currency == 'Great Britain Ponds : £' || currency == 'Pounds : £' || currency == 'Euro : €') {
        $('div[data-label = "LBL_CURRENCY_RATE"]').parent().show();
        $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().show();
    }
    else {
        $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
        $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().hide();
    }
}

