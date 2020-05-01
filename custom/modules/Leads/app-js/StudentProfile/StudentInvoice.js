var StudentInvoice = {
    setupInvoiceEventListeners: function () {
        //event listener for save invoice button
        jq331('#saveinvbtn').click(function () {
            StudentInvoice.saveInvoice();
        });
        //setup event listener for invoice input fields
        jq331('.abc').on('input', function () {
            StudentDetails.recalculate();
        });
        // event listener for the new invoice button
        jq331('#newinvbtn').click(function () {
			jq331('.select').val(['-1']).trigger('change');
			jq331('.mySelect').val(['-1']).trigger('change');
			$("#invoice_due_date").val('');
			$("#invcomments").val('');
            jq331('#newinvdiv').show('slow');
        });
		jq331('#cancelinvbtn').click(function () {
            jq331('#newinvdiv').hide('slow');
        });
        //repeater setup for the new-invoice item add button
        jq331('.repeater-default').repeater({
            show: function (setIndexes) {
                //event listeners need to be set again for the newly added repeater-row elements
                jq331('.abc').on('input', function () {
                    StudentDetails.recalculate();
                });
                jq331(this).slideDown(); //show the newly added row
            },
            hide: function (deleteElement) {
                jq331(this).slideUp(deleteElement); //hide the row
                setTimeout(function () {
                    StudentDetails.recalculate(); //update the figures
                }, 500);
            },
        });
		jq331('#discin').on('input', function () {
			console.log("Discount");
			StudentDetails.recalculate();
		});
		jq331('#saveInvoicePayment').click(function () {
			saveNewInvoicePayment(true);//true means close after save
		});
    },

    saveInvoice: function () {
		igec.blockFullPage();
        var invCurrency = jq331('#currencySel').val();
        var invCurrencyLabel = jq331('#currencySel option:selected').text();
        var received_currency_id = jq331('#received_currency_id ').val();
        var contactId = jq331('#contactId').val();
        var invoice_due_date = jq331('#invoice_due_date').val();
		var discount = jq331('#discin').val();
		var discountReason = jq331('#discresin').val();
            if (discount == null || discount == '') {
                discount = 0; //default value
            };
        if (invCurrency == null || invCurrency == '') {
			jq331.unblockUI();
            $("#currencySel").notify("Please Select currency","warn");
            return false;
        };
		if (invoice_due_date == null || invoice_due_date == '') {
			jq331.unblockUI();
            $('#invoice_due_date').notify("Please Enter Due Date",'warn');
            return false;
        };
        var bankAccount = jq331('#bankAccSel').val(); //optional - could be blank?
        var invNotes = jq331('#invcomments').val();
        var invoiceItems = [];
        var i = 1;
        // iterate through visible invoice-items and process these items
        jq331('.repitem:visible').each(function () {
            //debugger;
            var service = jq331(this).find('.serviceSel').val();
            if (service == null || service == '') {
				jq331.unblockUI();
				$(this).notify("please specify Service using dropdown for each Invoice Item.","warn");
                return false;
            }
            var amount = jq331(this).find('.amountin').val();
            if (amount == null || amount == '' || amount < 0) {
				jq331.unblockUI();
				jq331(this).notify("Invalid amount, please review.","warn");
                return false;
            }
            invoiceItems.push({ service: service, amount: amount});
        });
        var subtotal = jq331('#subtotalin').val();
        if (subtotal == null || subtotal == '' || +subtotal < 0) {
			jq331.unblockUI();
			jq331("#subtotalin").notify("Invalid invoice sub-total.","warn");
            return false;
        };
        var tax = jq331('#taxin').val();
        if (tax == null || tax == '') {
            tax = 0; //default value
        };
        var total = jq331('#totalin').val();
        if (total == null || total == '' || +total < 0) {
			jq331.unblockUI();
			jq331("#totalin").notify("Invalid invoice total.","warn");
            return false;
        };
		var data = { 
				 'total_sum':subtotal,'invoice_due_date':invoice_due_date,'invCurrency':invCurrency,
				 'tax_amount' :tax,'subtotal' :total,'contactId' :contactId,'related_bank':bankAccount,'description':invNotes,'sys_calculated_subtotal':total,'invoiceItems':invoiceItems,'discount':discount,'discountReason':discountReason
				 };
		$.ajax({
			type: "POST",
			url: "index.php?module=AOS_Invoices&action=saveStudentInvoice&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'JSON',
			async: true,
			success: function(data) {
				//$('.modal-dialog').dialog().dialog("close");
				if(data){
					console.log("InvoiceData"+data);
					var newrow = '<tr>'
						+ '<td class="td-padding">' +data['Name']+ '</td>'
						+ '<td class="td-padding">'+invCurrencyLabel+'</td>'
						+ '<td class="td-padding">' + total + '</td>'
						+ '<td scope="col" class="td-padding">Unpaid</td>'
						+ '<td class="td-padding">'+data['DUE_DATE']+'</td>'
						+ '<td class="td-padding"><i class="fa fa-credit-card invRecPayment tooltip" title="Recieve payment" style="margin-left:10px;cursor:pointer;" data-id="'+data["ID"]+'" data-currencyName="'+invCurrencyLabel+'" data-currencyID="'+received_currency_id+'" onclick="InvoicePayment(this)"></i></td>'
					+ '</tr>';
					$("#student_invoice_form").trigger("reset");
					jq331('#newinvdiv').hide('slow');
					$('#invoice_table > tbody:last-child').append(newrow);
					jq331.unblockUI();
				}
				else{
					$('#active_invoice_btn').notify("Invoice Already Exist",'warn');
				}
			},
			error: function(request,status,errorThrown) {
				console.log(request+' '+status+' '+errorThrown);
			}
		});
    }
}
function InvoicePayment(obj){
	var currencyname = jq331(obj).attr('data-currencyName');
	var currencyid = jq331(obj).attr('data-currencyID');
	var rec = jq331(obj).attr('data-id');
	$('#InvoicePaymentModal').modal('show');
	$('#payment_form').trigger('reset');
	jq331("#aos_invoices_id").val(rec);
	jq331("#received_currency_name").val(currencyname);
	jq331("#received_currency_id").val(currencyid);
	jq331.ajax({
		type: "POST",
		url: "index.php?module=igec_invoice_payments&action=getInvoicePayments&sugar_body_only=true",
		data: {record :rec},
		// contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		success: function(result) {
			console.log(result);
			jq331("#populatePayments").html(result);
			//delstaff();
		},
		error: function(request,status,errorThrown) {
			console.log(request+' '+status+' '+errorThrown);
		}
	});

}
function saveNewInvoicePayment(closeWhenDone) {
	jq331("#invoice_modal_popup").block();
	if( jq331('#name').val()=='' ){
		jq331("#invoice_modal_popup").unblock();
		$('#name').notify("Please Enter",'warn');
		return false;
	}
	else if( jq331('#date_recieved').val()=='' ){
		jq331("#invoice_modal_popup").unblock();
		$('#date_recieved').notify("Please Enter",'warn');
		return false;
	} 
	else if( jq331('#amount').val()=='' ){
		jq331("#invoice_modal_popup").unblock();
		$('#amount').notify("Please Enter",'warn');
		return false;
	} 
	var file = document.getElementById('filename_file').files[0];
	//append files
	var name = jq331('#name').val();
	var date_recieved = jq331('#date_recieved').val();
	var payment_type = jq331('#payment_type').val();
	var transaction_reference = jq331('#transaction_reference').val();
	var amount = jq331('#amount').val();
	var filename_file = jq331('#filename_file').val();
	var received_currency_id = jq331('#received_currency_id').val();
	var aos_invoices_id = jq331('#aos_invoices_id').val();
	var igec_bank_accounts_id = jq331('#igec_bank_accounts_id').val();
	var description = jq331('#description').val();
	var formdata = new FormData();
	formdata.append('name',name);
	formdata.append('date_recieved',date_recieved);
	formdata.append('payment_type',payment_type);
	formdata.append('transaction_reference',transaction_reference);
	formdata.append('amount',amount);
	formdata.append('file',file);
	formdata.append('filename_file',filename_file);
	formdata.append('received_currency_id',received_currency_id);
	formdata.append('aos_invoices_id',aos_invoices_id);
	formdata.append('igec_bank_accounts_id',igec_bank_accounts_id);
	formdata.append('description',description);
	//var data = {'bean':'igec_sponsor_organization','record':record,'org_id':org_id,'file':file,'file_name':file_name,'fname':fname,'lname':lname,'email1':email1,'phone_mobile':phone_mobile,'phone_work':phone_work,'position':position,'department':department};
	jq331.ajax({
		type: "POST",
		url: "index.php?module=igec_invoice_payments&action=saveNewPayment&sugar_body_only=true",
		data: formdata,
		//contentType: 'application/x-www-form-urlencoded',
		cache : false,
		dataType    : 'json',
		processData: false,
		contentType: false,
		success: function (data) {
			if (typeof data != 'undefined' && data != '') {
				jq331("#invoice_modal_popup").unblock();
				jq331("#populatePayments").html(data);
				jq331("#name").val('');
				jq331("#date_recieved").val('');
				jq331("#payment_type").trigger('change');
				jq331("#transaction_reference").val('');
				jq331("#amount").val('');
				jq331("#description").val('');
				jq331("#description").val('');
				jq331("#filename_file").val('');

			}
		},
		error: function (request, status, errorThrown) {
			console.log(request + ' ' + status + ' ' + errorThrown);
		}
	});
	if (closeWhenDone && closeWhenDone == true) {
		jq331('#createOrgForm').modal('hide');
	};
	// jq331('#note_form').trigger('reset');
}

function showContractEdit(ContractID){
	$('#ContractModal').modal('show');
	jq331.ajax({
		type: "POST",
		url: "index.php?module=igec_student_contracts&action=getContractData&sugar_body_only=true",
		data: {ContractID :ContractID},
		// contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		success: function(result) {
			$('#guardian_name').val(result.GuardianName);
			$('#guardian_mobile').val(result.GuardianMobile);
		},
		error: function(request,status,errorThrown) {
			console.log(request+' '+status+' '+errorThrown);
		}
	});
		jq331('#updateContractbtn').click(function () {
			var guardian_name = $('#guardian_name').val();
			var guardian_mobile = $('#guardian_mobile').val();
			jq331("#contract_modal_popup").block();
			if( jq331('#guardian_name').val()=='' ){
				jq331("#contract_modal_popup").unblock();
				$('#guardian_name').notify("Please Enter",'warn');
				return false;
			}
			else if( jq331('#guardian_mobile').val()=='' ){
				jq331("#contract_modal_popup").unblock();
				$('#guardian_mobile').notify("Please Enter",'warn');
				return false;
			}
			jq331.ajax({
			type: "POST",
			url: "index.php?module=igec_student_contracts&action=updateContractData&sugar_body_only=true",
			data: {ContractID :ContractID,guardian_mobile:guardian_mobile,guardian_name:guardian_name},
			// contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			success: function(result) {
				jq331("#contract_modal_popup").unblock();
				$('#ContractModal').modal('hide');
			},
			error: function(request,status,errorThrown) {
				console.log(request+' '+status+' '+errorThrown);
			}
		});
		
	});
}
