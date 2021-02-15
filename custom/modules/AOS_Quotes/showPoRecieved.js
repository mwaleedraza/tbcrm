$(document).ready(function () {
    var stage = $("#stage").val();
    if (stage == "Closed Accepted") {
        $('div[data-label = "LBL_FILENAME"]').parent().show();
    }
    else {
        $('div[data-label = "LBL_FILENAME"]').parent().hide();
    }
    $('#stage').on('change', function () {
        if ($(this).val() == 'Closed Accepted') {
            $('div[data-label = "LBL_FILENAME"]').parent().show();  
        }
        else {
            $('div[data-label = "LBL_FILENAME"]').parent().hide();
        }
    });
});