<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>
<link rel="stylesheet" type="text/css" href="custom/include/UI/app-assets/Select2/css/select2.css"/>
<script src="custom/include/UI/app-assets/Select2/select2.js"></script>
<script>
// Product part
// This is for product costing increment
var formCounterab = '0';
var formSCounterab = '0';
function addCode() {
	var formContainer = document.getElementById("forms-container");
	var newForm = `<div class="row">
        <div class="product-form" id="form_p">
            <div class="row">
            <div class="col-md-1">
                <label class="fw-bold">S/N</label>
                <input type="text" class="form-control" name="number" id="number${formCounterab}" placeholder="S/N">
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Product Name</label>
				<input name="AOS_Products_Quotes_Id" id="AOS_Products_Quotes_Id${formCounterab}" hidden>
				<input name="AOS_Products_Quotes_name" id="AOS_Products_Quotes_name${formCounterab}" hidden>
                <select class="product_id form-control" name="product_id" data-counter="${formCounterab}" id="product_id${formCounterab}">

                </select>
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Sub-Product</label>
				<input name="sub_product_name" id="sub_product_name${formCounterab}" hidden>
				<select class="form-control" name="sub_products" data-counter="${formCounterab}" id="sub_products${formCounterab}" class="col-sm-6">
                </select>
                
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Qty</label>
                <input type="text" class="form-control" name="product_qty" id="product_qty${formCounterab}" placeholder="0">
                
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Unit Cost</label>
                <input type="text" class="form-control" name="per_unit_cost" id="per_unit_cost${formCounterab}" placeholder="0">
                
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Margin</label>
                <input type="text" class="form-control" name="product_margin" id="product_margin${formCounterab}" placeholder="0">
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Unit Price</label>
                <input type="text" class="form-control" name="product_unit_price" id="product_unit_price${formCounterab}" placeholder="0" readonly="readonly">
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Total </label>
                <input type="text" class="form-control" name="product_total_price" id="product_total_price${formCounterab}" placeholder="0" readonly="readonly">
            </div>
            <div class="col-md-1 align-self-end"> 
                <button type="button" class="prod_d btn btn-danger delete-form-btn" counter="${formCounterab}" onclick="deleted_line_item(this,'prod_d')">-</button>  
            </div>
            </div>
        </div>
        </div>`;

	formContainer.insertAdjacentHTML("beforeend", newForm);
	fetchAllProducts(formCounterab);
	// fetchAllSubProducts(formCounterab);
	// on change of product slect sub product (product_id)
	$('.product_id').on('change',function(){
		// console.log(this);
		fetchAllSubProducts(this);
		debugger;
		// var billing_account_id = $('#billing_account_id').val();
		// fetchAllClients(billing_account_id);
	});
	$('#product_id'+formCounterab).select2();
	$('#sub_products'+formCounterab).select2();
	// increment in counter of line items row
	formCounterab++;
}
// End of product costing increment
// This is for service costing increment
function addSCode() {
	var formContainer = document.getElementById("forms-container1");
	var newForm = `<div class="row">
        <div class="service-form" id="form_s">
            <div class="row">
        <div class="col-md-1">
            <label class="fw-bold">S/N
			<input name="AOS_Products_Quotes_service_Id" id="AOS_Products_Quotes_service_Id${formSCounterab}" hidden>
			<input name="AOS_Products_Quotes_service_name" id="AOS_Products_Quotes_service_name${formSCounterab}" hidden>
			<input type="checkbox" name="is_service" id="is_service${formSCounterab}" hidden>
            <input type="text" class="form-control" name="number" id="number${formSCounterab}" placeholder="S/N" hidden>
            </label>
        </div>
        <div class="col-md-2">
            <label class="fw-bold">Service Description
            <input type="text" class="form-control" name="item_description" id="item_description${formSCounterab}" placeholder="Service Description">
            </label>
        </div>
        <div class="col-md-2">
            <label class="fw-bold">Total
            <input type="text" class="form-control" name="tc_service_total" id="tc_service_total${formSCounterab}" placeholder="Total" oninput="servicetotal()">
            </label>
        </div>
        <div class="col-md-1 align-self-end">
            <button type="button" class="serv_d btn btn-danger delete-form-btn" onclick="deleted_line_item(this,'serv_d')">-</button>
        </div>
        </div>
        </div>
        </div>
        </div>`;

	formContainer.insertAdjacentHTML("beforeend", newForm);
	$('#is_service'+formSCounterab).attr('checked',true);
	// $('#is_service'+formSCounterab).val('1');
	formSCounterab++;
}

// End service costing increment
// Calculate the Unit Price and Total of a single row for product costing
function calculatePrice(input) {
	var form = $(input).closest('.product-form');
	var qty = parseFloat(form.find('.form-control[name^="product_qty"]').val());
	var unitCost = parseFloat(form.find('.form-control[name^="per_unit_cost"]').val());
	var margin = parseFloat(form.find('.form-control[name^="product_margin"]').val()) / 100;
	var unitPrice;
	unitPrice = unitCost;
	if (margin) {
		unitPrice = unitCost / (1 - margin);
	}
	var totalPrice = unitPrice * qty;

	if (isNaN(totalPrice)) {
		totalPrice = 0;
	}
	if (isNaN(unitPrice)) {
		unitPrice = 0;
	}
	form.find('.form-control[name^="product_unit_price"]').val(unitPrice.toFixed(2));
	form.find('.form-control[name^="product_total_price"]').val(totalPrice.toFixed(2));
}
//This function will return the product total price with out adding margin
function calculateProductPrice() {
	var productForms = $('.product-form');
	var productPrice = 0;
	productForms.each(function() {
		var form = $(this);
		var qtyInput = form.find('.form-control[name^="product_qty"]');
		var unitCostInput = form.find('.form-control[name^="per_unit_cost"]');
		var qtyValue = parseFloat(qtyInput.val()) || 0;
		var unitCostValue = parseFloat(unitCostInput.val()) || 0;
		var totalPrice = qtyValue * unitCostValue;
		productPrice += totalPrice;

	});
	return productPrice;
}
// End of calculation of  Unit Price and Total of a single row for product costing
// Calculate the Toatal of all rows price for product costing  
function calculatetotal() {
	var productsum = 0;
	$('.form-control[name^="product_total_price"]').each(function() {
		// productsum += parseFloat($(this).val());
		var value = $(this).val();
		if (value === '') {
			value = 0; // Treat empty values as zero
		}
		productsum += parseFloat(value);
	});
	// $('.total-price').text(productsum.toFixed(2));
	// console.log('Total product sum:', productsum);
	return productsum;
}
$(document).ready(function() {
	var CurrentUrl = window.location.href;
	var split_url=CurrentUrl.split("record=")
	var recordID = split_url[1];
	// if(recordID){
	// 	fetchRecordData(recordID);
	// }
	// End of the total of all row price for product costing
	$('#forms-container').on('input', '.form-control', function() {
		calculatePrice(this);
		calculatetotal();
		calculateTax();
		Total();
		profitcal();
	});
	$('#forms-container1').on('input', '.form-control', function() {
		servicetotal();
		calculateserviceTax();
		calculateTax();
		Total();
		profitcal();
	});
	// For product costing row clone
	// $(document).ready(function() {
	fetchAllUsers();
	fetchAllCompanies();
	// fetchAllClients();
	// fetchAllLeads();
	$('#assigned_user_id').select2();
	$('#user_id').select2();
	$('#billing_account_id').select2();
	$('#billing_contact_id').select2();
	// $('#lead_id').select2();
	formCounterab = 0;
	formSCounterab = 0;
	$('#forms-container').on('click', '.delete-form-btn', function() {
		$(this).closest('.product-form').remove();
		calculatePrice(this);
		calculatetotal();
		calculateTax();
		Total();
		profitcal();
	});
	// End of product costing row clone
	//save total
	$('.savetotal').click(function(e) {
		var CurrentUrl = window.location.href;
		var split_url=CurrentUrl.split("record=")
		var recordID = split_url[1];
		var name = document.getElementById("name").value;
		var expiration = document.getElementById("expiration").value;
		var stage = document.getElementById("stage").value;
		// var lead_id = document.getElementById("lead_id").value;
		var user_id = document.getElementById("user_id").value;

		var nameInput = document.getElementById("name");
		var expirationInput = document.getElementById("expiration");
		var stageInput = document.getElementById("stage");
		// var leadIdInput = document.getElementById("lead_id");
		var userIdInput = document.getElementById("user_id");

		nameInput.addEventListener("input", removeBorder);
		expirationInput.addEventListener("change", removeBorder);
		stageInput.addEventListener("change", removeBorder);
		// leadIdInput.addEventListener("change", removeBorder);
		userIdInput.addEventListener("change", removeBorder);
		function removeBorder() {
			this.style.border = "";
		}
		if (!name || !expiration || !stage || !user_id) {
			e.preventDefault();
			alert("Please fill in all required fields.");
				if (!name) {
					$('#name').css('border', '2px solid red');
				}
				if (!expiration) {
					$('#expiration').css('border', '2px solid red');
				}
				if (!stage) {
					$('#stage').css('border', '2px solid red');
				}
				// if (!lead_id) {
				// 	$('.lead_id_box').css('border', '2px solid red');
				// }
				if (!user_id) {
					$('.user_id_box').css('border', '2px solid red');
				}
			}else {
				var createQuoteFormData = $('#createQuote').serializeObject();
				var createQuoteFormData = {
					createQuoteFormData: createQuoteFormData,
					recordID:recordID
				};
				debugger;
				// loader
				$('#spinner-div').show();//Load button clicked show spinner
				$.ajax({
					url: "index.php?module=AOS_Quotes&action=saveQuote&sugar_body_only=true",
					method: 'POST',
					data: createQuoteFormData,
					success: function(response){
						debugger;
						console.log(response);
						response  = JSON.parse(response);
						if (response['status'] == '200' && response['record_id'] != '') {
							window.location.href = "index.php?module=AOS_Quotes&action=DetailView&record="+response['record_id'];
							$('#spinner-div').hide();//Request is complete so hide spinner
						}
					},
					error: function(xhr, status, error) {
						console.error('Error saving data:', error);
					}
				});
			}
	});
	$('#forms-container1').on('click', '.delete-form-btn', function() {
		$(this).closest('.service-form').remove();
		servicetotal();
		calculateserviceTax();
		calculateTax();
		Total();
		profitcal();
	});
	document.getElementById("flexCheckDefault").addEventListener("change", function() {
		var mergeCheckbox = this;
		if (mergeCheckbox.checked) {
			var taxtype = document.getElementById("tc_product_tax_type").value;
			var productvalue = document.getElementById("tc_product_tax_value").value;
			var pwht = document.getElementById("tc_product_wht_value").value;
			var customwht = document.getElementById("tc_product_wht_custom").value;

			document.getElementById("tc_service_tax_type").value = taxtype;
			document.getElementById("tc_service_tax_value").value = productvalue;
			document.getElementById("tc_service_wht_value").value = pwht;
			document.getElementById("tc_service_wht_custom").value = customwht;
			calculatePrice(this);
			calculatetotal();
			calculateTax();
			Total();
			profitcal();
		} else {
			document.getElementById("tc_service_tax_type").value = "";
			document.getElementById("tc_service_tax_value").value = "";
			document.getElementById("tc_service_wht_value").value = "";
			document.getElementById("tc_service_wht_custom").value = "";
			calculatePrice(this);
			calculatetotal();
			calculateTax();
			Total();
			profitcal();
		}
	});
	// fetch name by selecting of company name
	$('#billing_account_id').on('change', function() {
		var billing_account_id = $('#billing_account_id').val();
		fetchAllClients(billing_account_id);
	});
	// fetch data of record 
	<?php
		// var_dump($_SERVER['HTTP_REFERER']);
		if(isset($_SERVER['HTTP_REFERER'])) {
			$record_id = explode("record=",$_SERVER['HTTP_REFERER']);
			$recordID = $record_id['1'];
		}else{
			echo "Not Able to Get Record Details";
			die;
		}
	?>
		if(recordID){
			fetchRecordData(recordID);
		}
});
// fetch all users
function fetchAllUsers() {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllUsers&sugar_body_only=true",
		method: 'GET',
		async:false,
		success: function(response) {
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#assigned_user_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
				$('#user_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// fetch all Companies
function fetchAllCompanies(billing_account_id) {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllCompanies&sugar_body_only=true",
		method: 'GET',
		async:false,
		success: function(response) {
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#billing_account_id').append("<option value='" + item.id + "'>" + item.name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// fetch all contacts
function fetchAllClients(billing_account_id){
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllClients&sugar_body_only=true",
		method: 'GET',
		async:false,
		data: {data:billing_account_id},
		success: function(response) {
			$('#billing_contact_id').empty();
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#billing_contact_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// // fetch all leads
// function fetchAllLeads() {
// 	$.ajax({
// 		url: "index.php?module=AOS_Quotes&action=fetchAllLeads&sugar_body_only=true",
// 		async:false,
// 		method: 'GET',
// 		success: function(response) {
// 			response = JSON.parse(response);
// 			$.each(response, function(i, item) {
// 				$('#lead_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
// 			});
// 		},
// 		error: function(xhr, status, error) {
// 			console.error('Error saving data:', error);
// 		}
// 	});
// }
// Fetch all products
function fetchAllProducts(formCounterab) {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllProducts&sugar_body_only=true",
		method: 'GET',
		async:false,
		success: function(response) {
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#product_id' + formCounterab).append("<option value='" + item.id + "'>" + item.name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// fetch all subproducts
function fetchAllSubProducts(lineItemRow) {
	// $('#product_id'+formCounterab).val();
	var pid = lineItemRow.id;
	var formCounterab = pid.slice(-1);
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllSubProducts&sugar_body_only=true",
		async:false,
		method: 'GET',
		data: {data:$('#'+pid).val()},
		success: function(response) {
			$('#sub_products' + formCounterab).empty();
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#sub_products' + formCounterab).append("<option value='" + item.id + "'>" + item.name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// End of service costing row clone
//Product TAx part to calculate amount and price after gst/pra
function calculateTax() {
	//  var form = input.closest('.product-tax');
	// var form = $('.Total-form');
	var form = $('.product-tax');
	var taxtype, piceaftergst, priceafterwht, pwht, customwht, productvalue;
	taxtype = document.getElementById("tc_product_tax_type").value;
	productvalue = document.getElementById("tc_product_tax_value").value;
	pwht = document.getElementById("tc_product_wht_value").value;
	customwht = document.getElementById("tc_product_wht_custom").value;
	var productsum = calculatetotal();
	productvalue = productsum * (productvalue / 100);
	priceaftergst = productvalue + productsum;
	// console.log('Price after gst/pra:',priceaftergst);
	priceafterwht = priceaftergst * (pwht / 100);
	if (customwht) {
		priceafterwht = priceaftergst * (customwht / 100);
	}
	// console.log(priceafterwht);
	var Pamount = document.getElementById("tc_product_tax_amt");
	var PAgst = document.getElementById("tc_product_price_after_pra_gst");
	var PAwht = document.getElementById("tc_product_price_after_wht");
	Pamount.value = productvalue.toFixed(2);
	PAgst.value = priceaftergst.toFixed(2);
	PAwht.value = priceafterwht.toFixed(2);
	//  return Pamount.value;
	//  return PAwht.value;
	return [Pamount.value, PAwht.value];
}
//End of product tax part to calculate the amount and price after gst/pra
// End of product part tax part
// Service Tax part
// Calculate the sum of all the total of all rows of service part
function servicetotal() {
	var servicesum = 0;
	$('.form-control[name^="tc_service_total"]').each(function() {
		var value = $(this).val();
		if (value === '') {
			value = 0;
		}
		servicesum += parseFloat(value);
	});
	// $('.total-price').text(productsum.toFixed(2));
    
	// console.log('Total product sum:', servicesum);
	return servicesum;
}
//End to Calculate the sum of all the total of all rows of service part
//Service Tax part to calculate amount and price after gst/pra
function calculateserviceTax() {
	//  var form = input.closest('.service-tax');
	var form = $('.service-tax');
	var taxtype, piceaftergst, priceafterwht, pwht, customwht, servicevalue;
	taxtype = document.getElementById("tc_service_tax_type").value;
	servicevalue = document.getElementById("tc_service_tax_value").value;
	pwht = document.getElementById("tc_service_wht_value").value;
	customwht = document.getElementById("tc_service_wht_custom").value;
	var servicesum = servicetotal();
	servicevalue = servicesum * (servicevalue / 100);
	priceaftergst = servicevalue + servicesum;
	// console.log(priceaftergst);
	var servicewht = parseFloat(servicetotal());
	//  priceafterwht = servicewht*(pwht/100);
	priceafterwht = priceaftergst * (pwht / 100);
	if (customwht) {
		priceafterwht = priceaftergst * (customwht / 100);
	}
	var Samount = document.getElementById("tc_service_tax_amt");
	var SAgst = document.getElementById("tc_service_price_after_pra_gst");
	var SAwht = document.getElementById("tc_service_price_after_wht");
	Samount.value = servicevalue.toFixed(2);
	SAgst.value = priceaftergst.toFixed(2);
	SAwht.value = priceafterwht.toFixed(2);

	return [Samount.value, SAwht.value];
}
//End of Service Tax part to calculate amount and price after gst/pra
// End of serice tax part
// Total of product & service
function Total() {
	var form = $('.Total-form');
	// var productTotal = form.find('input[placeholder="PT"]');
	var productTotal = document.getElementById("product_total");
	var serviceTotal = document.getElementById("service_total");
	var grandTotal = document.getElementById("grand_total");
	// var serviceTotal = form.find('input[placeholder="ST"]').get(0);
	// var grandTotal = form.find('input[placeholder="GT"]').get(0);
	// now get the 4 variables value productsum + productvalue, servicesum+servicevalue
	var productSum = calculatetotal();
	var productValue = calculateTax();
	var pt = parseFloat(productSum) + parseFloat(productValue);
	var serviceSum = servicetotal();
	var serviceValue = calculateserviceTax();
	var st = parseFloat(serviceSum) + parseFloat(serviceValue);
	var gt = parseFloat(pt) + parseFloat(st);
	if (isNaN(pt)) {
		pt = 0;
	}
	if (isNaN(st)) {
		st = 0;
	}
	if (isNaN(gt)) {
		gt = 0;
	}
	productTotal.value = pt.toFixed(2);
	serviceTotal.value = st.toFixed(2);
	grandTotal.value = gt.toFixed(2);
}
// End of Total of product & service
function profitcal() {
	var form = $('.profit-calculation');
	var TotalPCost = document.getElementById("tc_total_product_cost_to_company");
	var PPaftertax = document.getElementById("tc_product_price_after_tax");
	var Pmargin = document.getElementById("tc_product_margin");
	var Smargin = document.getElementById("tc_service_margin");
	var Tmargin = document.getElementById("tc_total_margin");
	//To calculate total product cost
	var totalpcost = parseFloat(calculateProductPrice());
	if (isNaN(totalpcost)) {
		totalpcost = 0;
	}

	TotalPCost.value = totalpcost.toFixed(2);
	// console.log("Product price with out margin=" , TotalPCost );

	//To calculate product price after tax
	var pT = parseFloat(calculatetotal());
	var PWHT = calculateTax();
	var second = PWHT[1];
	// console.log('Second Value:', second);
	var productpriceAfterTax = pT - second;
	// console.log("Product price After Tax=" ,productpriceAfterTax );
	if (isNaN(productpriceAfterTax)) {
		productpriceAfterTax = 0;
	}
	PPaftertax.value = productpriceAfterTax.toFixed(2);

	//To calculate product margin
	productmargin = productpriceAfterTax - totalpcost;
	if (isNaN(productmargin)) {
		productmargin = 0;
	}
	Pmargin.value = productmargin.toFixed(2);

	//To calculate service margin
	var sT = parseFloat(servicetotal());
	var SWHT = calculateserviceTax();
	var second = SWHT[1];
	console.log('Second Value:', second);
	var servicemargin = sT - second;
	console.log("Service margin =", servicemargin);
	if (isNaN(servicemargin)) {
		servicemargin = 0;
	}
	Smargin.value = servicemargin.toFixed(2);

	//To calculate Total margin
	var total = productmargin + servicemargin;
	if (isNaN(total)) {
		total = 0;
	}
	Tmargin.value = total.toFixed(2);
}
function deleted_line_item(element,line_i){
	if(line_i=='prod_d'){
		var AOS_Products_Quotes_Id = element.attributes['data-AOS_Products_Quotes_Id'].textContent;
		var AOS_Products_Quotes_Id_del = AOS_Products_Quotes_Id;
	} else if(line_i=='serv_d'){
		var aos_products_quotes_service_id = element.attributes['data-aos_products_quotes_service_id'].textContent;
		var AOS_Products_Quotes_Id_del = aos_products_quotes_service_id;
	}
	debugger;
	// var AOS_Products_Quotes_Id_del = $('#AOS_Products_Quotes_Id'+formCounterab).val();
	var AOS_Products_Quotes_Id_del = {
		AOS_Products_Quotes_Id_del: AOS_Products_Quotes_Id_del
		};
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=AOS_Products_Quotes_del&sugar_body_only=true",
		method: 'POST',
		data: AOS_Products_Quotes_Id_del,
		async:false,
		success: function(response) {
			debugger;
			var response = JSON.parse(response);
			if(response['status']=='200'){
				alert('deleted');
			} else{
				alert('ERROR');
			}
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// function to get all related records
function fetchRecordData(id){
	var recordID = {
			id: id
		};
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchQuoteData&sugar_body_only=true",
		method: 'GET',
		data: recordID,
		async:false,
		success: function(response) {
		
			response = JSON.parse(response);
			var name = response.AOS_Quotes[0]['name'];
			var stage = response.AOS_Quotes[0]['stage'];
			var expiration = response.AOS_Quotes[0]['expiration'];
			var invoice_status = response.AOS_Quotes[0]['invoice_status'];
			var assigned_user_id = response.AOS_Quotes[0]['assigned_user_id'];
			var term = response.AOS_Quotes[0]['term'];
			var approval_status = response.AOS_Quotes[0]['approval_status'];
			var approval_issue = response.AOS_Quotes[0]['approval_issue'];
			var billing_account_id = response.AOS_Quotes[0]['billing_account_id'];
			var billing_contact_id = response.AOS_Quotes[0]['billing_contact_id'];
			// var lead_id = response.AOS_Quotes[0]['lead_id'];
			var rfq_ref = response.AOS_Quotes[0]['rfq_ref'];
			var prev_quote_no = response.AOS_Quotes[0]['prev_quote_no'];
			var payment = response.AOS_Quotes[0]['payment'];
			var po_to_v = response.AOS_Quotes[0]['po_to_v'];
			var status = response.AOS_Quotes[0]['status'];
			var condition_c = response.AOS_Quotes[0]['condition_c'];
			var user_id = response.AOS_Quotes[0]['user_id'];
			var medium = response.AOS_Quotes[0]['medium'];
			var referencenumber = response.AOS_Quotes[0]['referencenumber'];
			var yourreferencenumber = response.AOS_Quotes[0]['yourreferencenumber'];
			var pdftext = response.AOS_Quotes[0]['pdftext'];
			var ourfirm = response.AOS_Quotes[0]['ourfirm'];
			var tc_product_tax_type = response.AOS_Quotes[0]['tc_product_tax_type'];
			var tc_product_tax_value = response.AOS_Quotes[0]['tc_product_tax_value'];
			var tc_product_tax_amt = response.AOS_Quotes[0]['tc_product_tax_amt'];
			var tc_product_price_after_pra_gst = response.AOS_Quotes[0]['tc_product_price_after_pra_gst'];
			var tc_product_wht_type = response.AOS_Quotes[0]['tc_product_wht_type'];
			var tc_product_wht_value = response.AOS_Quotes[0]['tc_product_wht_value'];
			var tc_product_wht_custom = response.AOS_Quotes[0]['tc_product_wht_custom'];
			var tc_product_price_after_wht = response.AOS_Quotes[0]['tc_product_price_after_wht'];
			var tc_service_tax_type = response.AOS_Quotes[0]['tc_service_tax_type'];
			var tc_service_tax_value = response.AOS_Quotes[0]['tc_service_tax_value'];
			var tc_service_tax_amt = response.AOS_Quotes[0]['tc_service_tax_amt'];
			var tc_service_price_after_pra_gst = response.AOS_Quotes[0]['tc_service_price_after_pra_gst'];
			var tc_service_wht_value = response.AOS_Quotes[0]['tc_service_wht_value'];
			var tc_service_wht_custom = response.AOS_Quotes[0]['tc_service_wht_custom'];
			var tc_service_price_after_wht = response.AOS_Quotes[0]['tc_service_price_after_wht'];
			var product_total = response.AOS_Quotes[0]['product_total_price'];
			var currency_id = response.AOS_Quotes[0]['currency_id'];
			var currency_rate = response.AOS_Quotes[0]['currency_rate'];
			var convert_currency = response.AOS_Quotes[0]['convert_currency'];
			var tc_total_product_cost_to_company = response.AOS_Quotes[0]['tc_total_product_cost_to_company'];
			var tc_product_price_after_tax = response.AOS_Quotes[0]['tc_product_price_after_tax'];
			var tc_product_margin = response.AOS_Quotes[0]['tc_product_margin'];
			var tc_service_margin = response.AOS_Quotes[0]['tc_service_margin'];
			var tc_total_margin = response.AOS_Quotes[0]['tc_total_margin'];
			var tc_product_total = response.AOS_Quotes[0]['tc_product_total'];
			var tc_service_total = response.AOS_Quotes[0]['tc_service_total'];
			var tc_grand_total = response.AOS_Quotes[0]['tc_grand_total'];
			if (po_to_v === '1') {
				$('#po_to_v').prop('checked', true);
			}else{
				$('#po_to_v').prop('checked', false);
			}
			if (condition_c === '1') {
				$('#condition_c').prop('checked', true);
			} else{
				$('#condition_c').prop('checked', false);
			}
			if (convert_currency === '1') {
				$('#convert_currency').prop('checked', true);
			} else{
				$('#convert_currency').prop('checked', false);
			}
			$("#invoice_status").val(invoice_status).change();
			$("#assigned_user_id").val(assigned_user_id).change();
			$("#term").val(term).change();
			$("#approval_status").val(approval_status).change();
			$("#approval_issue").val(approval_issue).change();
			$("#billing_account_id").val(billing_account_id).change();
			$("#billing_contact_id").val(billing_contact_id).change();
			// $("#lead_id").val(lead_id).change();
			$("#payment").val(payment).change();
			// $("#po_to_v").val(po_to_v);
			$("#status").val(status).change();
			// $("#condition_c").val(condition_c);
			$("#user_id").val(user_id).change();
			$("#medium").val(medium).change();
			$("#ourfirm").val(ourfirm).change();
			$("#tc_product_tax_type").val(tc_product_tax_type).change();
			$("#tc_product_tax_value").val(tc_product_tax_value).change();
			$("#tc_product_wht_value").val(tc_product_wht_value).change();
			$("#tc_service_wht_value").val(tc_service_wht_value).change();

			$("#name").val(name);
			$("#stage").val(stage);
			$("#expiration").val(expiration);
			$("#rfq_ref").val(rfq_ref);
			$("#prev_quote_no").val(prev_quote_no);
			$("#referencenumber").val(referencenumber);
			$("#yourreferencenumber").val(yourreferencenumber);
			$("#pdftext").val(pdftext);
			$("#tc_product_tax_amt").val(tc_product_tax_amt);
			$("#tc_product_price_after_pra_gst").val(tc_product_price_after_pra_gst);
			$("#tc_product_wht_custom").val(tc_product_wht_custom);
			$("#tc_product_price_after_wht").val(tc_product_price_after_wht);
			$("#tc_service_tax_type").val(tc_service_tax_type);
			$("#tc_service_tax_value").val(tc_service_tax_value);
			$("#tc_service_tax_amt").val(tc_service_tax_amt);
			$("#tc_service_price_after_pra_gst").val(tc_service_price_after_pra_gst);
			$("#tc_service_wht_custom").val(tc_service_wht_custom);
			$("#tc_service_price_after_wht").val(tc_service_price_after_wht);
			$("#product_total").val(product_total);
			$("#currency_id").val(currency_id);
			$("#currency_rate").val(currency_rate);
			// $("#convert_currency").val(convert_currency);
			$("#tc_total_product_cost_to_company").val(tc_total_product_cost_to_company);
			$("#tc_product_price_after_tax").val(tc_product_price_after_tax);
			$("#tc_product_margin").val(tc_product_margin);
			$("#tc_service_margin").val(tc_service_margin);
			$("#tc_total_margin").val(tc_total_margin);
			
			$("#product_total").val(tc_product_total);
			$("#service_total").val(tc_service_total);
			$("#grand_total").val(tc_grand_total);
			
			// line items
			var lineItemCount = response.aos_products_quotes.length;
			var p='0';
			for (var i = 0; i < lineItemCount; i++) {
				var item = response.aos_products_quotes[i];

			
				if(item['is_service']!="1"){
					$('.add-form-btn_p').click();
					var AOS_Products_Quotes_Id = item['id'];
					var AOS_Products_Quotes_name = item['name'];
					var sub_product_name = item['sub_product_name'];
					var number = item['number'];
					var product_id = item['product_id'];
					var product_qty = item['product_qty'];
					var sub_product = item['sub_products'];
					var per_unit_cost = item['per_unit_cost'];
					var product_margin = item['product_margin'];
					var product_unit_price = item['product_unit_price'];
					var product_total_price = item['product_total_price'];
					// set values
					$("#number"+[p]).val(number);
					$("#AOS_Products_Quotes_Id"+[p]).val(AOS_Products_Quotes_Id);
					$("#AOS_Products_Quotes_name"+[p]).val(AOS_Products_Quotes_name);
					$("#sub_product_name"+[p]).val(sub_product_name);
					$("#product_id"+[p]).val(product_id).change();
					$("#product_qty"+[p]).val(product_qty);
					$("#sub_products"+[p]).val(sub_product).change();
					$("#per_unit_cost"+[p]).val(per_unit_cost);
					$("#product_margin"+[p]).val(product_margin);
					$("#product_unit_price"+[p]).val(product_unit_price);
					$("#product_total_price"+[p]).val(product_total_price);
					//set data att in del button for remving row
					$('.prod_d').attr('data-AOS_Products_Quotes_Id', AOS_Products_Quotes_Id);
					// console.log(productId);
					p++;
				}
			}
			// line items services
			var lineItemServicesCount = response.aos_products_quotes.length;
			var j='0';
			for (var i = 0; i < lineItemServicesCount; i++){
				var item = response.aos_products_quotes[i];
				if(item['is_service']=="1"){	
					$('.add-form-btn_s').click();
					var AOS_Products_Quotes_Id = item['id'];
					var AOS_Products_Quotes_name = item['name'];
					var number = item['number'];
					var is_service = item['is_service'];
					var item_description = item['item_description'];
					var tc_service_total = item['tc_service_total'];
					// set values
					$("#numberS"+[j]).val(number);
					$("#AOS_Products_Quotes_service_Id"+[j]).val(AOS_Products_Quotes_Id);
					$("#AOS_Products_Quotes_service_name"+[p]).val(AOS_Products_Quotes_name);
					$("#is_service"+[j]).val(is_service);
					$("#item_description"+[j]).val(item_description);
					$("#tc_service_total"+[j]).val(tc_service_total);
					//set data att in del button for remving row
					$('.serv_d').attr('data-AOS_Products_Quotes_service_Id', AOS_Products_Quotes_Id);
					j++;
				}
			}
			// $.each(response, function(i, item) {
			// 	$('#assigned_user_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
			// 	$('#user_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
			// });
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
</script>
