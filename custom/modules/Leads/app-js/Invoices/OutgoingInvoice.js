var OutgoingInvoice = {
    paymentsClicked: function (obj) {
        var outgoingInvId = $(obj).attr('data-oginvid');
        //in real life, make an ajax call to fetch the Outgoing-Payments against this invoice id.
		OutgoingInvoice.PopulatePaymentsData(outgoingInvId);
        $('#invlistdiv').addClass('disabled1');
    },

    closePaymentsIconClicked: function () {

        $('#invlistdiv').removeClass('disabled1');
        animateScrollTo(document.querySelector('#invlistdiv'));
        $('#paymentsdiv2').hide();
    },
	addPayments: function (obj) {
		//Add new Payment Popup Implementation
		var invoiceId = $(obj).attr('data-oginvid');
        var invTitle = $(obj).attr('data-oginvname');
        var BalanceAmt = $(obj).attr('data-balanceamt');
        var InvCurrencyId = $(obj).attr('data-currencyid');
		$('#oginvname').val(invTitle);
		$('#oginvid').val(invoiceId);
		$('#balance_amount').val(BalanceAmt);
		
		if(InvCurrencyId){
			for (key in allCurrencies) {
				if(allCurrencies[key]['0'] == InvCurrencyId){
					$('#invoice_currency').val(allCurrencies[key]['1']);
					$('#invoice_currency_id').val(InvCurrencyId);
					$('#received_currency_id').val(InvCurrencyId);
				}
			}
		}else{
			$('#invoice_currency').val('Default');
			$('#invoice_currency_id').val('-99');
		}
		
		$('#invlistdiv').addClass('disabled1');
		$('#recPaymentForm').modal('show');
    },
	savePaymentbtnClicked: function () {
        jq331('#RecPaymentsDiv534').block();
		var amount = $('#amount').val(); //Amount in Invoiced Currency
		if(!amount){
			$("#amount").notify("Amount in Invoiced Currency is Required!");
			return false;
		}
		var amount_received = $('#amount_received').val(); // Amount in Other Currency
        if(!amount_received){
			$("#amount_received").notify("Amount in Received Currency is Required!");
			return false;
		}
		var invoice_id = $('#oginvid').val();
        var name = $('#name').val();
        var date_recieved = $('#date_recieved').val();
        var payment_type = $('#payment_type').val();
        var transaction_reference = $('#transaction_reference').val();
        var bank_account_number = $('#bank_account_number').val();
        var bank_account_name = $('#bank_account_name').val();
        var invoice_currency_id = $('#invoice_currency_id').val();
        var received_currency_id = $('#received_currency_id').val();
        var description = $('#description').val();
		var data = {
			'invoice_id':invoice_id,'name':name,
			'date_recieved':date_recieved,
			'payment_type':payment_type,
			'transaction_reference':transaction_reference,
			'bank_account_number':bank_account_number,
			'bank_account_name':bank_account_name,
			'invoice_currency_id':invoice_currency_id,
			'received_currency_id':received_currency_id,
			'amount':amount, 'amount_received':amount_received,
			'description':description,
		};	
		$.ajax({
			type: "POST",
			url: "index.php?module=igec_outgoing_invoices&action=OutgoingInvoiceController&func=savePayment&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'json',
			async: false,
			success: function (result) {				
				window.location.href='index.php?module=igec_outgoing_invoices&action=OutgoingInvoiceListing';
				
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
			// jq331('#paymentsdiv2').unblock();
		});
    },
	PopulatePaymentsData: function (InvoiceId) {
		$.ajax({
			url: 'index.php?module=igec_outgoing_invoices&action=OutgoingInvoiceController',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=getOutgoingPayments&outGoingInvId='+InvoiceId,		
			async: true,			
			success : function(result) {				
				var data = $.parseJSON(result);
				var tableRows = '';
				
				for(key of data){
					inv_currency = '';
					rec_currency = '';
					for (key1 in allCurrencies) {
						if(allCurrencies[key1]['0'] == key['currency_id']){
							inv_currency = allCurrencies[key1]['1'];
						}
						if(allCurrencies[key1]['0'] == key['received_currency_id']){
							rec_currency = allCurrencies[key1]['1'];
						}
						
					}
					if(key['currency_id'] == '-99'){
						inv_currency = 'US Doller';
					}
					if(key['received_currency_id'] == '-99'){
						rec_currency = 'US Doller';
					}
					tableRows += '<tr><td>'+key['name']+'</td><td>'+key['payment_type']+'</td><td>'+key['transaction_reference']+'</td><td>'+inv_currency+'</td><td>'+Number(key['amount']).toFixed(2)+'</td><td>'+rec_currency+'</td><td>'+Number(key['amount_received']).toFixed(2)+'</td></tr>';
				} 
				$('#PaymentsTable').html(tableRows);
				$('#paymentsdiv2').show();
				animateScrollTo(document.querySelector('#paymentsdiv2'));
			}	
		});
    }
	
}