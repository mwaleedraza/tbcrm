<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>
<link rel="stylesheet" type="text/css" href="custom/include/UI/app-assets/Select2/css/select2.css"/>
<script src="custom/include/UI/app-assets/Select2/select2.js"></script>
<script>
// Product part
// This is for product costing increment
function addCode() {
	var formContainer = document.getElementById("forms-container");
	var newForm = `<div class="row">
        <div class="product-form" id="form_p">
            <div class="row">
            <div class="col-md-1">
                <label class="fw-bold">S/N
                <input type="text" class="form-control" name="number" id="number${formCounterab}" placeholder="S/N">
                </label>
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Product Name</label>
                <select class="product_id form-control" name="product_id" data-counter="${formCounterab}" id="product_id${formCounterab}">
                </select>
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Sub-Product
                <select class="form-control" name="sub_products" data-counter="${formCounterab}" id="sub_products${formCounterab}" class="col-sm-6">
                </select>
                </label>
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Qty
                <input type="text" class="form-control" name="product_qty" id="product_qty${formCounterab}" placeholder="0">
                </label>
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Unit Cost
                <input type="text" class="form-control" name="per_unit_cost" id="per_unit_cost${formCounterab}" placeholder="0">
                </label>
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Margin
                <input type="text" class="form-control" name="product_margin" id="product_margin${formCounterab}" placeholder="0">
                </label>
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Unit Price
                <input type="text" class="form-control" name="product_unit_price" id="product_unit_price${formCounterab}" placeholder="0" readonly="readonly">
                </label>
            </div>
            <div class="col-md-1">
                <label class="fw-bold">Total
                <input type="text" class="form-control" name="product_total_price" id="product_total_price${formCounterab}" placeholder="0" readonly="readonly">
                </label>
            </div>
            <div class="col-md-1 align-self-end"> 
                <button type="button" class="btn btn-danger delete-form-btn">-</button>  
            </div>
            </div>
        </div>
        </div>`;

	formContainer.insertAdjacentHTML("beforeend", newForm);
	fetchAllProducts(formCounterab);
	fetchAllSubProducts(formCounterab);
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
            <input type="text" class="form-control" name="number" id="number${formSCounterab}" placeholder="S/N">
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
            <button type="button" class="btn btn-danger delete-form-btn" onclick="servicetotal()">-</button>
        </div>
        </div>
        </div>
        </div>
        </div>`;

	formContainer.insertAdjacentHTML("beforeend", newForm);
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
	fetchAllClients();
	fetchAllLeads();
	$('#assigned_user_id').select2();
	$('#user_id').select2();
	$('#billing_account_id').select2();
	$('#billing_contact_id').select2();
	$('#lead_id').select2();
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
	$('.savetotal').click(function() {
		var createQuoteFormData = $('#createQuote').serializeObject();
		var createQuoteFormData = {
			createQuoteFormData: createQuoteFormData
		};
		$.ajax({
			url: "index.php?module=AOS_Quotes&action=saveQuote&sugar_body_only=true",
			method: 'POST',
			data: createQuoteFormData,
			success: function(response) {
				console.log(response);
				if (response['status'] == '200' && record_id != '') {
					window.location = "index.php?module=AOS_Quotes&action=DetailView&record=" + record_id;
				}
				debugger;
			},
			error: function(xhr, status, error) {
				console.error('Error saving data:', error);
			}
		});
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
});
// fetch all users
function fetchAllUsers() {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllUsers&sugar_body_only=true",
		method: 'GET',
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
function fetchAllCompanies() {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllCompanies&sugar_body_only=true",
		method: 'GET',
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
function fetchAllClients() {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllClients&sugar_body_only=true",
		method: 'GET',
		success: function(response) {
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
// fetch all leads
function fetchAllLeads() {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllLeads&sugar_body_only=true",
		method: 'GET',
		success: function(response) {
			response = JSON.parse(response);
			$.each(response, function(i, item) {
				$('#lead_id').append("<option value='" + item.id + "'>" + item.last_name + "</option>");
			});
		},
		error: function(xhr, status, error) {
			console.error('Error saving data:', error);
		}
	});
}
// Fetch all products
function fetchAllProducts(formCounterab) {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllProducts&sugar_body_only=true",
		method: 'GET',
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

function fetchAllSubProducts(formCounterab) {
	$.ajax({
		url: "index.php?module=AOS_Quotes&action=fetchAllSubProducts&sugar_body_only=true",
		method: 'GET',
		success: function(response) {
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
</script>
