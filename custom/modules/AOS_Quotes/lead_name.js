if (window.location.href.indexOf('lead_id') > -1){
  var full_url = document.URL;
  var url_array = full_url.split('=') // Split the string into an array with / as separator
  var last_segment = url_array[url_array.length-1];  // Get the last part of the array (-1)
  var lead_id=last_segment;
  $.ajax({
          url: 'index.php?module=AOS_Quotes&action=GetLeadName&sugar_body_only=true&lead_id='+lead_id,
          success: function(data) {
            $('#lead_name').val(data);
            var dataArr=JSON.parse(data);
            if (data !=null){
              var first_name = dataArr[0].first_name;
              var last_name = dataArr[0].last_name;
              if(first_name != null & last_name !=null){
              $("#lead_name").val(first_name+' '+last_name);
              $("#lead_id").val(dataArr[0].id);
             }
             else {
               $("#lead_name").val(last_name);
               $("#lead_id").val(dataArr[0].id);

             }
           }
           }
         });
  }
