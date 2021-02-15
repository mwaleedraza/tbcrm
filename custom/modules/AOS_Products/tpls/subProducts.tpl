{literal}
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="custom/modules/AOS_Products/app-assets/fonts/font-awesome/css/font-awesome.min.css">
    <style>
        button{
            outline: none;
        }
        .formContainer input[type="text"]{
            width: 80%;
            border: 1px solid #ccc;
            padding: 5px 15px;
            outline:none;
            margin-right: 5px;
        }
        #addSubProduct{
            margin-top: 10px;
        }
        .sub_product_card{
            box-shadow: 0px 0px 8px #999;
            border-radius: 3px;
            padding: 10px 15px;
        }
        .del{
            background-color:#F71C1C;color:white;
        }
        #tableContainer{
            max-height: 400px;
            overflow-y: auto;
            box-shadow: 0px 2px 12px #999;
        }
        #sub_product_table{
            text-align: center;
            padding: 0px 8px;

        }
        #sub_product_table tr{
            transition: .3s;
            border-bottom: 1px solid #ccc;
        }
        #sub_product_table th{
            position: sticky;
            top: 0;
            background-color: #dc940c;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            text-align: center;
        }
        #sub_product_table tr{
            padding: 5px 0px;
        }
        .del-badge, .add-badge{
            background-color: transparent;
            border: none;
            padding: 5px;
            border-radius: 50%;
            font-size: 18px;
            transition: .3s;
            width:40px;
            font-weight: bold;
        }
        .del-badge:hover{
            background: #C92B18;
            color: #fff;
        }
        .add-badge:hover, .add-badge:focus, .add-badge:active{
            background: #6098DC;
            color: #fff;
            border-radius: 50%;
            transform: rotate(90deg); 
        }
        #sub_product_table td li{
            line-height: 20px;
            padding: 3px 0px;
        }
        #sub_product_table td li:hover .fa-times{
            opacity: 1;
            transform: translateX(0px) rotate(90deg);
        }
        span i.fa-times{
            margin-left: 10px;
            transform: translateX(10px);
            color: maroon;
            cursor: pointer;
            transition: .4s;
            opacity: 0;
        }
    </style>
    <script>
        $(document).tooltip();
        
        function fetchRelatedSubProducts(subProductId){
            var id = {'sub_parent_id': subProductId};
            var list = [];
            $.ajax({
                type: 'GET',
                url: "index.php?module=AOS_Products&action=getSubProducts&sugar_body_only=true",
                data: id,
                success: function(subProducts){
                    subProducts = JSON.parse(subProducts);
                    for (var prodNum = 0; prodNum < subProducts.length; prodNum++){
                        $("#sub_" + subProductId + " ul").append('<li id = "'+subProducts[prodNum].id+'">'+subProducts[prodNum].name+'<span><i title="Delete" class="fa fa-times" onclick="deleteProductList(this.id)" id="subDel_'+subProducts[prodNum].id+'"></i></span></li>');
                    }
                }
            });
        }
    </script>
{/literal}

<button class="btn" style="background: #da4453;color: #fff;" id="subProductTrigger" data-toggle="modal" data-target="#subProductModal">Add Sub Products</button>

<!-- Modal for adding Sub Products -->
<div class="modal fade" tabindex="-1" id="subProductModal" role="dialog" aria-labelledby="subProductModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="background-color:#015a9e;">
				<button type="button" onclick="closeModal()" class="close" data-dismiss="modal">
					<span aria-hidden="true" style="color:#fff;">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabelHistory" style="color:#fff;font-weight:500;">Add Sub Products</h4>
			</div>
			<div class="modal-body">
                <form id="subProductsForm">
                    <div class="add-sub-products">
                        <div class="sub-product-container formContainer">
                            <div class="row sub-product" id = "sub-product">
                                <div id = "sub_product_card" class="col-md-12 sub_product_card">
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Name</label><br>
                                        <input type="text" name="sub_product_name" id="sub_product_name" value="" placeholder="Sub Product Name" required>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">SKU</label><br>
                                        <input type="text" name="sub_product_sku" id="sub_product_sku" value="" placeholder="SKU">
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Type</label><br>
                                        <select name="sub_product_type" id="sub_product_type" value="">
                                            <option value=""></option>
                                            <option value="Product/Solution">Product/Solution</option>
                                            <option value="Services">Services</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Description</label><br>
                                        <textarea name="sub_product_description" id="sub_product_description" value=""></textarea>
                                    </div>
                                </div>
                            </div> 
                            <div>
                                <input type="button" id="addSubProduct" onclick="addSubProducts()" value="+ Click here to add more"><span id="notice" style="opacity: 0;transition: .3s;margin-left:10px; color:maroon;font-size:16px;"></span>
                            </div>
                            <div class="saveBox text-center" style="margin-top: 10px;">
                                <input style="background-color:#0FB254" type="button" id="savingSubProducts" onclick="saveSubProducts(''); closeModal();" data-dismiss="modal" value="Save">
                            </div>
                        </div>
                    </div>
                </form>                
            </div>
        </div>
    </div>
</div>







<!-- Modal for adding Sub Products of Sub Products -->
<div class="modal fade" tabindex="-1" id="sub_sub_ProductModal" role="dialog" aria-labelledby="sub_sub_ProductModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="background-color:#015a9e;">
				<button type="button" onclick="closeModal()" class="close" data-dismiss="modal">
					<span aria-hidden="true" style="color:#fff;">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabelHistory" style="color:#fff;font-weight:500;">Add Sub Products</h4>
			</div>
			<div class="modal-body">
                <form id="subProductsForm2">
                    <div class="add-sub-products">
                        <div class="sub-product-container formContainer">
                            <div class="row sub-product" id = "sub-product2">
                                <div id = "sub_product_card" class="col-md-12 sub_product_card">
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Name</label><br>
                                        <input type="text" name="sub_product_name" id="sub_product_name" value="" placeholder="Sub Product Name" required><input type="text" name="sub_hidden_id" id="sub_hidden_id" hidden>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">SKU</label><br>
                                        <input type="text" name="sub_product_sku" id="sub_product_sku" value="" placeholder="SKU">
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Type</label><br>
                                        <select name="sub_product_type" id="sub_product_type" value="">
                                            <option value=""></option>
                                            <option value="Product/Solution">Product/Solution</option>
                                            <option value="Services">Services</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 5px;">
                                        <label for="">Description</label><br>
                                        <textarea name="sub_product_description" id="sub_product_description" value=""></textarea>
                                    </div>
                                </div>
                            </div> 
                            <div>
                                <input type="button" id="addSubProduct" onclick="addSubProducts('sub')" value="+ Click here to add more"><span id="notice" style="opacity: 0;transition: .3s;margin-left:10px; color:maroon;font-size:16px;"></span>
                            </div>
                            <div class="saveBox text-center" style="margin-top: 10px;">
                                <input style="background-color:#0FB254" type="button" id="savingSubProducts" onclick="saveSubProducts('sub'); closeModal();" data-dismiss="modal" value="Save">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>








<div class="subProductsContainer">
    <div style="text-align:center;padding:6px 0px;background-color:mintcream;font-size: 20px;font-weight: bold;color:maroon;">Sub Products</div>
    <div id="tableContainer">
        <table class="table" id="sub_product_table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Sub Products</th>
                    <th>SKU/Part Number</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Add</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody  id="subProductsList">
                {foreach from=$SUB_PRODUCTS key=id item=data}
                    <tr >
                        <td>{$data.name}</td>
                        <td id="sub_{$data.id}">
                            <ul></ul>
                            <script>
                                fetchRelatedSubProducts('{$data.id}');
                            </script>
                        </td>
                        <td>{$data.sub_product_sku}</td>
                        <td>{$data.sub_product_type}</td>
                        <td>{$data.sub_product_description}</td>
                        <td><button id="add_{$data.id}" class="add-badge" style="font-size: 20px;" data-toggle="modal" data-target="#sub_sub_ProductModal">+</button></td>
                        <td><button id="del_{$data.id}" class="del-badge" style="font-size: 20px;" onclick="deleteProductList(this.id)"><i class="far fa-trash-alt"></i></button></td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

{literal}
    <script>

        var subProductNum = 1;
        // Add multiple fields
        function addSubProducts(key) {
            if(key == 'sub'){
                var subProductTitle = subProductNum+1;
                $('#sub-product2').append('<div id = "sub_product_card2'+subProductNum+'" class="col-md-12 sub_product_card2" style="margin-top: 5px;">\n' +
                    '<div class="col-md-12 text-right"><input class="del" type="button" id="'+subProductNum+'" onclick="deleteSubProduct(this.id, \'sub\')" value="X"></div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">Name</label><br>\n' +
                    '<input type="text" name="sub_product_name" id="sub_products_name'+subProductNum+'" value="" placeholder="Sub Product Name" required>\n' +
                    '</div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">SKU</label><br>\n' +
                    '<input type="text" name="sub_product_sku" id="sub_product_sku'+subProductNum+'" value="" placeholder="SKU">\n' +
                    '</div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">Type</label><br>\n' +
                    '<select name="sub_product_type" id="sub_product_type'+subProductNum+'" value="">\n' +
                    '<option value=""></option>\n' +
                    '<option value="Product/Solution">Product/Solution</option>\n' +
                    '<option value="Services">Services</option>\n' +
                    '</select>\n' +
                    '</div>\n' +
                    '<label for="">Description</label><br>\n' +
                    '<textarea name="sub_product_description" id="sub_product_description'+subProductNum+'" value=""></textarea>\n' +
                    '</div>\n' +
                    '</div>');
                subProductNum++;
                //if(subProductNum >= 4){
                //    $('#addSubProduct').css({"pointer-events": "none", "filter": "grayscale(100%)"});
                //    $('#notice').text("Can not add sub products more than 4.");
                //    $('#notice').css("opacity", "1");
                //}
            }
            else{
                var subProductTitle = subProductNum+1;
                $('#sub-product').append('<div id = "sub_product_card'+subProductNum+'" class="col-md-12 sub_product_card" style="margin-top: 5px;">\n' +
                    '<div class="col-md-12 text-right"><input class="del" type="button" id="'+subProductNum+'" onclick="deleteSubProduct(this.id)" value="X"></div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">Name</label><br>\n' +
                    '<input type="text" name="sub_product_name" id="sub_products_name'+subProductNum+'" value="" placeholder="Sub Product Name" required>\n' +
                    '</div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">SKU</label><br>\n' +
                    '<input type="text" name="sub_product_sku" id="sub_product_sku'+subProductNum+'" value="" placeholder="SKU">\n' +
                    '</div>\n' +
                    '<div class="col-md-6" style="margin-top: 5px;">\n' +
                    '<label for="">Type</label><br>\n' +
                    '<select name="sub_product_type" id="sub_product_type'+subProductNum+'" value="">\n' +
                    '<option value=""></option>\n' +
                    '<option value="Product/Solution">Product/Solution</option>\n' +
                    '<option value="Services">Services</option>\n' +
                    '</select>\n' +
                    '</div>\n' +
                    '<label for="">Description</label><br>\n' +
                    '<textarea name="sub_product_description" id="sub_product_description'+subProductNum+'" value=""></textarea>\n' +
                    '</div>\n' +
                    '</div>');
                subProductNum++;
                //if(subProductNum >= 4){
                //    $('#addSubProduct').css({"pointer-events": "none", "filter": "grayscale(100%)"});
                //    $('#notice').text("Can not add sub products more than 4.");
                //    $('#notice').css("opacity", "1");
                //}
            }
        }
        

        //Deleting field
        function deleteSubProduct(id, key){
            if (key == 'sub'){
                $('#sub_product_card2'+id).remove();
                subProductNum--;
                $('#addSubProduct').css({"pointer-events": "auto", "filter": ""});
                $('#notice').text("");
                $('#notice').css("opacity", "0");
            }
            else{
                $('#sub_product_card'+id).remove();
               subProductNum--;
                $('#addSubProduct').css({"pointer-events": "auto", "filter": ""});
                $('#notice').text("");
                $('#notice').css("opacity", "0");
            }
            
        }
        
        $.fn.serializeObject = function() {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } 
                else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        }
        
        //Saving Sub Products
        function saveSubProducts(key){
        
           if(key == 'sub'){
               var form = $("#subProductsForm2").serializeObject(); 
                var id = form.sub_hidden_id.split("_");
                var parent_id = id[1];    
                
                var formData = { 'parent_id' : parent_id,
                                'sub_product_name': form.sub_product_name,
                                'sub_product_sku': form.sub_product_sku,
                                'sub_product_type': form.sub_product_type,
                                'sub_product_description': form.sub_product_description,
                                };
                
                
                $.ajax({
                    type: 'POST',
                    data: formData,
                    url: "index.php?module=AOS_Products&action=saveSubProducts&sugar_body_only=true",
                    success: function(showSubProd){
                        console.log("Success");
                        location.reload();
                    },
                    error: function (request, status, errorThrown) {
                        console.log(request + " " + status + " " + errorThrown);
                    }
                });
           }
           else{
                var url=window.location.href;
                parent_id = url.split("record=");

                var form = $("#subProductsForm").serializeObject();         
                var formData = {'parent_id':parent_id[1], 
                                'sub_product_name': form.sub_product_name,
                                'sub_product_sku': form.sub_product_sku,
                                'sub_product_type': form.sub_product_type,
                                'sub_product_description': form.sub_product_description,
                                };
                
                
                $.ajax({
                    type: 'POST',
                    data: formData,
                    url: "index.php?module=AOS_Products&action=saveSubProducts&sugar_body_only=true",
                    success: function(showSubProd){
                        
                        console.log("Success");
                        location.reload();
                    },
                    error: function (request, status, errorThrown) {
                        console.log(request + " " + status + " " + errorThrown);
                    }
                });
            }
        }

        $(".add-badge").click(function(){
            var hiddenId = $(this).attr("id");
            $("#sub_hidden_id").val(hiddenId);

        });

        function closeModal(){
         $("#subProductModal form")[0].reset();
        }

        //Delete Sub Product List from Table
        function deleteProductList(delId){
            delId = delId.split("_");
            
            var id = {'delId': delId[1]};
            
            $.ajax({
                type: 'POST',
                url: "index.php?module=AOS_Products&action=deleteSubProduct&sugar_body_only=true",
                data: id,
                success: function (del){
                    if(delId[0] == 'subDel'){    
                    
                        var listParent = $("#subDel_"+delId[1]).closest("li");
                        listParent.animate({opacity: '0'}, 100);
                        setTimeout(function(){
                            listParent.remove();
                        }, 200);
                    }
                    else{ 
                        var listParent = $("#del_"+delId[1]).closest("tr");
                        listParent.animate({opacity: '0'}, 100);
                        setTimeout(function(){
                            listParent.remove();
                        }, 200);
                    }


                    
                }
            });
        }
    </script>
{/literal}
