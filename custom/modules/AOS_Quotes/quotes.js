$(document).ready(function () {
  $('div[data-label = "LBL_QUOTE_VERSION"]').parent().hide();
  $("#billing_contact_id").change(function () {
    var id = $("#billing_contact_id").val();
    if (id == "") {
      $("#referencenumber").val("0");
      return false;
    }
    else {
      $.ajax({
        url:
          "index.php?module=AOS_Quotes&action=GetUserBillingId&sugar_body_only=true&id=" + id,
        //dataType: "json",
        success: function (data) {
          var data = JSON.parse(data);
          $("#referencenumber").val(data[0].refNum);
          $("#prev_quote_no").val(data[0].prevQuote);
          $("#quote_version").val(data[0].version);
        },
      });
    }
  });
});
