{literal}
  <link rel="stylesheet" type="text/css" href="custom/modules/Leads/app-assets/vendors/css/forms/selects/select2.css">
  <script src="custom/modules/Leads/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    <script>
        function setDDVal (field_id,field_val){
          $('#'+field_id).val(field_val).trigger('change');
          debugger;
      }
    </script>
    <style>
      #add-more-prod{
        font-size:16px;
        background:none;
        border:1px solid green;
        border-radius: 4px;
        padding: 5px 10px;
        color:green;
        transition: .3s ease;
      }
      #add-more-prod i{
        transform: translateX(-20px);
        font-size:12px;
        margin-left: 10px;
        opacity:0;
        transition:.3s;
      }
      #add-more-prod:hover{
        background:green;
        color:#fff;
      }
      #add-more-prod:hover i{
        transform:rotate(90deg) translateX(0px);
        opacity:1;
      }
      .productRow{
        padding: 10px 0px;
        border-bottom:1px solid #ccc;
      }
    </style>
{/literal}

<h1>Select Products</h1>
<div id="productRowContainer">
  <div class="productRow">
    <label>Select Vendor</label>:
    <!-- Vendor (Company) dropdown -->
    <select id="accounts_id" name="accounts_id">
      <option value=""></option>
      {foreach from=$VENDOR_DATA key=index item=data}
        <option value="{$data.id}">{$data.name}</option>
      {/foreach}
    </select>

    <!-- Product Select -->
    <label style="margin-left:10px;">Products</label>
    <select id="product_id0" name="product_id[]" style="width:150px"></select>

    <!-- SubProducts Select -->
    <label style="margin-left:10px;">Sub Products</label>
    <select id="sub_product_id0" name="sub_product_id[]" style="width:150px"></select>

    <!-- Sub_SubProducts Select -->
    <label style="margin-left:10px;">Sub-Sub Products</label>
    <select id="sub_sub_product_id0" name="sub_sub_product_id[]" style="width:150px"></select>
  </div>
</div>
<div style="margin-top: 2%;">
  <input type="button" id="add-more-prod" onclick="addProductsRow()" value="Add More Products">
</div>

{literal}
  <script type="text/javascript">
    $(document).ready(function(){
      // Initialize Select2
      $('#accounts_id').select2();
     $('#product_id0, #sub_product_id0, #sub_sub_product_id0').select2({
        tags:true,
     });
     
      $("#accounts_id").change(function(){
        makeProductDD(0);
        $("#sub_sub_product_id0 option").remove();
      });

      $("#product_id0").change(function(){
        subProductDD(0);
        $("#sub_sub_product_id0 option").remove();
      });


      $("#sub_product_id0").change(function(){
        sub_SubProductDD(0);
      });

      setTimeout(function(){
        setAllProducts();
      },800);
    });
    function makeProductDD(fieldId){
      var accounts_id = $('#accounts_id').val();
        
        var data = {
            'id': accounts_id
        };
        $.ajax({
            type: 'POST',
            url: 'index.php?module=Leads&action=GetProducts&sugar_body_only=true',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            async: false,
            success: function(data) {
                var data= $.parseJSON(data);
                $('#product_id'+fieldId+' option').remove();
                $('#product_id'+fieldId).append('<option value=""></option>');
                $.each(data, function(i,item){
                    $('#product_id'+fieldId).append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                });
                //var currentProducts = []; //ProductArray
                //if(CurrentContactId!=''){
                //  setDDVal('product_id'+fieldId+'',CurrentContactId[fieldId].id);
                //  debugger;
                //}
              },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
            }
        });
    }
    function subProductDD(fieldId){
      var product_id = $('#product_id'+fieldId).val();
        
        var data = {
            'id': product_id
        };
        
        $.ajax({
            type: 'POST',
            url: 'index.php?module=Leads&action=GetSubProducts&sugar_body_only=true',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            async: false,
            success: function(data) {
                var subData= $.parseJSON(data);
                
                $('#sub_product_id'+fieldId+' option').remove();
                $('#sub_product_id'+fieldId).append('<option value=""></option>');
                $.each(subData, function(i,item){
                    $('#sub_product_id'+fieldId).append('<option value="'+subData[i].id+'">'+subData[i].name+'</option>');
                });
                //var currentProducts = []; //ProductArray
                //for (var i = 0; i < CurrentProductId.length; i++){
                //    currentProducts.push(CurrentProductId[i].id);
                //}
                //    setDDVal('product_id',currentProducts);
              },
            error: function (request, status, errorThrown) {
                console.log(request + ' ' + status + ' ' + errorThrown);
            }
        });
    }

    function sub_SubProductDD(fieldId){
      
      var sub_product_id = $('#sub_product_id'+fieldId).val();
        
      var data = {
          'id': sub_product_id
      };
      
      $.ajax({
          type: 'POST',
          url: 'index.php?module=Leads&action=GetSubProducts&sugar_body_only=true',
          data: data,
          contentType: 'application/x-www-form-urlencoded',
          dataType: 'text',
          async: false,
          success: function(sub_data) {
            
              var sub_subData= $.parseJSON(sub_data);
              
              $('#sub_sub_product_id'+fieldId+' option').remove();
              $("#sub_sub_product_id"+fieldId).append('<option value=""></option>');
              $.each(sub_subData, function(i,item){
                  $('#sub_sub_product_id'+fieldId).append('<option value="'+sub_subData[i].id+'">'+sub_subData[i].name+'</option>');
              });
              
              //var currentProducts = []; //ProductArray
              //for (var i = 0; i < CurrentProductId.length; i++){
              //    currentProducts.push(CurrentProductId[i].id);
              //}
              //    setDDVal('product_id',currentProducts);
            },
          error: function (request, status, errorThrown) {
              console.log(request + ' ' + status + ' ' + errorThrown);
          }
      });
    }

    //Row Counter 
    var productRowNum = 1;

    //Adding Multiple Product Rows
    function addProductsRow(){
      var productRow = '';
      productRow += '<div class="productRow" id="productRow'+productRowNum+'" style="margin-top: 1%;">\n'+
                      '<!-- Product Select -->\n'+
                      '<label style="margin-left:22%;">Products</label>\n'+
                      '<select id="product_id'+productRowNum+'" name="product_id[]" style="width:150px;" onchange="subProductDD('+productRowNum+')"></select>\n'+

                      '<!-- SubProducts Select -->\n'+
                      '<label style="margin-left:10px;">Sub Products</label>\n'+
                      '<select id="sub_product_id'+productRowNum+'" name="sub_product_id[]" style="width:150px" onchange="sub_SubProductDD('+productRowNum+')"></select>\n'+

                      '<!-- Sub_SubProducts Select -->\n'+
                      '<label style="margin-left:10px;">Sub-Sub Products</label>\n'+
                      '<select id="sub_sub_product_id'+productRowNum+'" name="sub_sub_product_id[]" style="width:150px"></select>\n'+

                      '<!-- Delete -->\n'+
                      '<input type="button" id="'+productRowNum+'" value="x" onclick="delProductRow(this.id)">\n'+
                    '</div>';

      $("#productRowContainer").append(productRow);

      //Select2
      $('#product_id'+productRowNum).select2();
      $('#sub_product_id'+productRowNum).select2();
      $('#sub_sub_product_id'+productRowNum).select2();

      makeProductDD(productRowNum);
      //var accountId = $('#accounts_id').val();
      //setDDVal('accounts_id'+productRowNum, accountId);
      productRowNum++;
    }
    

    function delProductRow(id){
      $("#productRow"+id).remove();
      productRowNum--;
    }
    function setAllProducts(){
      
      setDDVal('accounts_id', CurrentVendorId);
      
      if(CurrentProductId != null){
        for (var i = 0; i < CurrentProductId.length; i++){
          if(i > 0){
            addProductsRow();
          }
          setDDVal('product_id'+i, CurrentProductId[i].id);
          setDDVal('sub_product_id'+i, CurrentSubProductId[i].id);
          setDDVal('sub_sub_product_id'+i, CurrentSub_subProductId[i].id);
          
        }
      }
    }
    
  </script>
{/literal}
