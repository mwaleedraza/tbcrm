if (window.location.href.indexOf("lead_id") > -1) {
  var full_url = document.URL;
  var url_array = full_url.split("="); // Split the string into an array with / as separator
  var last_segment = url_array[url_array.length - 1]; // Get the last part of the array (-1)
  var lead_id = last_segment;
  $.ajax({
    url:
      "index.php?module=AOS_Quotes&action=GetCompanyClientNames&sugar_body_only=true&lead_id=" +
      lead_id,
    success: function (data) {
      var dataArr = JSON.parse(data);
      if (data != null) {
        // console.log(dataArr);
        $("#billing_account_id")
          .select2()
          .val(dataArr[0].account_id)
          .trigger("change");
        setTimeout(function () {
          $("#billing_contact_id")
            .select2()
            .val(dataArr[0].contacts_id)
            .trigger("change");
        }, 1500);
      }
    },
  });
}
