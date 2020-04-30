YAHOO.util.Event.addListener('company_name', 'change', function(){
    var id=$('#company_name').val();
    alert(id);


    $.ajax({
            url: 'index.php?module=Leads&action=GetRelatedContacts&sugar_body_only=true&id='+id,
                //  dataType: "json",
                // dataType: 'JSON',
             success: function(data) {
              $.parseJSON(data);
                 debugger;
            //    $('#contact_dropdown').val('1');
               $('select#contact_dropdown').append('<option value="0">Select Option</option>');
            //    $.each( data, function(i, val){    
            //     $('select#contact_dropdown').append('<option value="'+ val.id +'">'+ val.subcategory +'</option>');
            // });
            // var aa = json_encode(data);
            
            
            $('select#contact_dropdown').append('<option value="">' + data+ '</option>');
            var len = data.length;
            for(var i=0; i<len; i++){
                var id = data[i].last_name;
              
                $('select#contact_dropdown').append('<option value="">' + id+ '</option>');
            
              }
            // Check result isnt empty
            
                // // Loop through each of the results and append the option to the dropdown
                // $.each(data, function() {
                //   $('select#contact_dropdown').append('<option value="' + product_id + '">' + product_id + '</option>');
                // });
                // var i;
                // for (i = 0; i < data.length; i++) {
                //   text += data[i] + "<br>";
                //   $('select#contact_dropdown').append('<option value="' + data + '">' + data + '</option>');
              //   // }
              //   for(var i = 0; i < data.length; i++) {
              //     var opt = data[i];
              //     // var el = document.createElement("option");
              //     $('select#contact_dropdown').append('<option value="' + opt + '">' + opt + '</option>');
              // }
        
              //  $("#contact_dropdown option[value==3]");
              //  $("#contact_dropdown option[value='Adhoc']").attr("selected", "selected");
              //  $('#contact_dropdown').option("sss");
             }
            });
     });