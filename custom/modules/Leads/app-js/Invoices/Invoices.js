calculationString = '';

var Invoices = {
	recievePaymentClicked: function (obj) {
        var invoiceId = $(obj).attr('data-invId');
        var invTitle = $(obj).attr('data-invtitle');
        var BankAccId = $(obj).attr('data-bankaccid');
        var InvCurrencyId = $(obj).attr('data-currencyid');
        var BalanceAmt = $(obj).attr('data-balanceAmt');
		
        $('#invtabdiv').addClass('disabled1');
		$('#aos_invoices_name').val(invTitle);
		$('#aos_invoices_id').val(invoiceId);
		$('#balance_amount').val(BalanceAmt);
		$('#igec_bank_accounts_id').val(BankAccId);
		for(key in allBankAccounts){
			if(allBankAccounts[key]['0'] == BankAccId){
			$('#igec_bank_accounts_name').val(allBankAccounts[key]['1']);
			}
		}
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
		// var subInvoicesOptions = '';
		Invoices.getSubInvoices(invoiceId);		
		$('#recPaymentForm').modal('show');
    },
	
	getSubInvoices: function (invoice_id) {
		$.ajax({
			url: 'index.php?module=igec_child_invoices&action=getChildInvoices',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&invoice_id='+invoice_id,		
			async: true,			
			success : function(result) {				
				var data = $.parseJSON(result);
				
				var subInvOptions = '<option value="">- Select -</option>';				
				for(key of data){
					if(key['status'] != 'Paid'){
						var amt = Number(key['total_amount']).toFixed(2);
						subInvOptions += '<option value="'+key['id']+'">'+key['name']+' ('+ amt +')</option>';
					}
				}
				$('#subinvoice_id').html(subInvOptions);
			}	
		});		
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
		var invoice_id = $('#aos_invoices_id').val();
        var name = $('#name').val();
        var date_recieved = $('#date_recieved').val();
        var payment_type = $('#payment_type').val();
        var transaction_reference = $('#transaction_reference').val();
        var igec_bank_accounts_id = $('#igec_bank_accounts_id').val();
        var invoice_currency_id = $('#invoice_currency_id').val();
        var received_currency_id = $('#received_currency_id').val();
        // var amount = $('#amount').val(); //Amount in Invoiced Currency
        // var amount_received = $('#amount_received').val(); // Amount in Other Currency
        var description = $('#description').val();
        var subinvoice_id = $('#subinvoice_id').val();
		var data = {
			'invoice_id':invoice_id,'name':name,
			'date_recieved':date_recieved,
			'payment_type':payment_type,
			'transaction_reference':transaction_reference,
			'igec_bank_accounts_id':igec_bank_accounts_id,
			'invoice_currency_id':invoice_currency_id,
			'received_currency_id':received_currency_id,
			'amount':amount, 'amount_received':amount_received,
			'description':description,
			'subinvoice_id':subinvoice_id,
		};	
		$.ajax({
			type: "POST",
			url: "index.php?module=AOS_Invoices&action=CreateCPInvoicePayments&func=save&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'json',
			async: false,
			success: function (result) {				
				window.location.href='index.php?module=AOS_Invoices&action=CPInvoicesListingPage';
				
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
		});
    },
	splitInvoice: function (obj) {
        var invoiceId = $(obj).attr('data-invId');
        var invTitle = $(obj).attr('data-invtitle');
        var InvCurrencyId = $(obj).attr('data-currencyid');
        var BalanceAmt = Number($(obj).attr('data-balanceAmt')).toFixed(2);
        var institute = $(obj).attr('data-institute');
		//Number(key['total_amount']).toFixed(2)
		$('#cinv_invoice_name').val(invTitle);
		$('#cinv_invoice_id').val(invoiceId);
		$('#cinv_total_amount').val(BalanceAmt);
		$('#cinv_institute').val(institute);

		if(InvCurrencyId){
			for (key in allCurrencies) {
				if(allCurrencies[key]['0'] == InvCurrencyId){
					$('#cinv_currency').val(allCurrencies[key]['1']);
					$('#cinv_currency_id').val(InvCurrencyId);
				}
			}
		}else{
			$('#cinv_currency').val('Default');
			$('#cinv_currency_id').val('-99');
		}
		
        $('#invtabdiv').addClass('disabled1');
        $('#splitInvForm').modal('show');
    },
	SplitInvoiceClicked: function (obj) {
        var invoiceId = $(obj).attr('data-invId');
        var invTitle = $(obj).attr('data-invtitle');
        var InvCurrencyId = $(obj).attr('data-currencyid');
        var BalanceAmt = $(obj).attr('data-balanceAmt');
		
        $('#invtabdiv').addClass('disabled1');
		$('#parent_invoice_name').val(invTitle);
		$('#parent_invoice_id').val(invoiceId);
		$('#cinv_balance_amount').val(BalanceAmt);
        $('#splitInvoiceForm').modal('show');
		if(InvCurrencyId){
			for (key in allCurrencies) {
				if(allCurrencies[key]['0'] == InvCurrencyId){
					$('#cinv_currency').val(allCurrencies[key]['1']);
					$('#cinv_currency_id').val(InvCurrencyId);
				}
			}
		}else{
			$('#cinv_currency').val('Default');
			$('#cinv_currency_id').val('-99');
		}
    },
	saveCInvbtnClicked: function () {
        jq331('#SplitInvoiceDiv534').block();
		/* var cinv_amount = $('#cinv_amount').val(); //Amount in Invoiced Currency
		if(!cinv_amount){
			$("#cinv_amount").notify("Amount in Invoiced Currency is Required!");
			return false;
		}
		var cinv_tax = $('#cinv_tax').val(); // Tax Amount
        if(!cinv_tax){
			$("#cinv_tax").notify("Tax Amount is Required!");
			return false;
		} */
		var allCInv = [];
		var splitAmount = 0.00;
		$('.oneChildInv').each(function(i, obj){
			var cinvtitle = $(obj).find('.cinv_title').val();
			var cinv_duedate = $(obj).find('.cinv_duedate').val();
			var cinv_forwarddate = $(obj).find('.cinv_forwarddate').val();
			var cinv_amount = $(obj).find('.cinv_amount').val();
			var cinv_tax = $(obj).find('.cinv_tax').val();
			var cinv_total = $(obj).find('.cinv_total').val();
			var cinv_decsription = $(obj).find('.cinv_decsription').val();
			splitAmount += parseFloat(cinv_total);
			var oneCInv = {
				title: cinvtitle, 
				duedate: cinv_duedate,
				forwarddate: cinv_forwarddate,
				amount: cinv_amount,
				tax: cinv_tax,
				total: cinv_total,
				description: cinv_decsription,
			};
			allCInv.push(oneCInv);
		});
		var cinv_invoice_id = $('#cinv_invoice_id').val();
        var cinv_currency_id = $('#cinv_currency_id').val();
		if($('#cinv_total_amount').val() != splitAmount){
			jq331('#SplitInvoiceDiv534').unblock();
			$("#cinv_total_amount").notify("Split Amount is not equal to Balance Amount!");
			return false;
		}
		
        var data = {
			'child_invoices':allCInv,
			'invoice_id':cinv_invoice_id,
			'currency_id':cinv_currency_id,
		};
		
		$.ajax({
			type: "POST",
			url: "index.php?module=AOS_Invoices&action=CreateChildInvoice&func=save&sugar_body_only=true",
			data: data,
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'json',
			async: false,
			success: function (result) {				
				// console.log(result);
				window.location.href='index.php?module=AOS_Invoices&action=CPInvoicesListingPage';
				
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
		});
    },
	/* recalculate: function (obj) {
        console.log(obj.parent());
    }, */
	ShowSubInvoices: function (obj) {
        $('#invtabdiv').addClass('disabled1');
		var invoice_id = $(obj).attr('data-invid');
		Invoices.populateSubInvoices(invoice_id);
        // $('#subInvdiv2').show();
        // animateScrollTo(document.querySelector('#subInvdiv2'));
    },
	
	populateSubInvoices: function(invoice_id){
		$.ajax({
			url: 'index.php?module=igec_child_invoices&action=getChildInvoices',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&invoice_id='+invoice_id,		
			async: true,			
			success : function(result) {				
				var data = $.parseJSON(result);
				var tableRows = '';
				
				for(key of data){
					inv_currency = '';
					for (key1 in allCurrencies) {
						if(allCurrencies[key1]['0'] == key['currency_id']){
							inv_currency = allCurrencies[key1]['1'];
						}
					}
					if(key['currency_id'] == '-99'){
						inv_currency = 'US Doller';
					}
					
					tableRows += '<tr><td>'+key['name']+'</td><td>'+Number(key['amount']).toFixed(2)+'</td><td>'+Number(key['tax']).toFixed(2)+'</td><td>'+Number(key['total_amount']).toFixed(2)+'</td><td>'+inv_currency+'</td><td>'+key['invoice_due_date']+'</td><td>'+key['invoice_forward_date']+'</td></tr>';
				} 
				$('#ChildInvoicesTable').html(tableRows);
				$('#subInvdiv2').show();
				animateScrollTo(document.querySelector('#subInvdiv2'));
			}	
		});
	},

	disburseClicked: function (obj) {
        $('#invtabdiv').addClass('disabled1');
		var invoice_id = $(obj).attr('data-invid');
		Invoices.populateCommissionDefinitions(invoice_id);
        $('#disbursediv2').show();
        animateScrollTo(document.querySelector('#disbursediv2'));
    },
	populateCommissionDefinitions: function(invoice_id){
		calculationString = '';
		$.ajax({
			url: 'index.php?module=AOS_Invoices&action=getCommissionDefinitions',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&func=getCommissionsForInvoice&invoice_id='+invoice_id,		
			async: true,			
			success : function(result) {
				
				var data = $.parseJSON(result);
				calculationString = data;
				$('#CourseProvider').text(data['Invoice']['account_name']);
				// console.log(data);
				/* Create Agreements table and populate data */
				var tableRows = '';
				var commissions = data['commissions'];
				var invoice = data['Invoice'];
				var opportunity = data['Opportunity'];
				if(commissions['agreements']['User Defined']){
					agreements = commissions['agreements']['User Defined'];
					keys1 = Object.keys(agreements);
					for(key of keys1){
						var row = agreements[key];
						var course = '---';
						if(row['course_name'])
							course = row['course_name'];

						tableRows += '<tr class="border-bottom-success border-custom-color"><td style="padding:4px;">'+row['course_level_name']+'</td><td style="padding:4px;font-size:small;">'+row['course_discipline_name']+'</td><td>'+course+'</td><td>'+row['minimum_students']+'</td><td>---</td><td>'+row['calculation_method']+'</td><td>'+row['real_value']+'</td><td>'+row['standard_value']+'</td></tr>' ;
					}
				}
				
				if(commissions['agreements']['Default']){
					agreements = commissions['agreements']['Default'];
					keys2 = Object.keys(agreements);
					
					for(key of keys2){
						var row = agreements[key];
						var course = '---';
						if(row['course_name'])
							course = row['course_name'];
						var level = 'All';
						if(row['course_level_name'])
							level = row['course_level_name'];
						var discipline = 'All';
						if(row['course_discipline_name'])
							discipline = row['course_discipline_name'];
						
						tableRows += '<tr class="border-bottom-success border-custom-color"><td style="padding:4px;"><span style="color:red">*</span>'+level+'</td><td style="padding:4px;font-size:small;">'+discipline+'</td><td>'+course+'</td><td>'+row['minimum_students']+'</td><td>---</td><td>'+row['calculation_method']+'</td><td>'+row['real_value']+'</td><td>'+row['standard_value']+'</td></tr>' ;
					}
					
				}

				$('#AgreementTable').html(tableRows);
				
				/* Create Commissions For Branch */
				var Branch = commissions['Branch'];
				var BrachCounts = data['StudentCount']['branch'];
				keys = Object.keys(Branch);
				var tableRows = '';
				for(key of keys){
					var row = Branch[key];
					var BranchName = row['sg_name'];
					tableRows += '<tr class="border-bottom-success border-custom-color"><td style="padding:4px;">'+row['calculation_method']+'</td><td>'+row['minimum_students']+'</td><td>'+row['commission']+'</td></tr>'; 
				}
				$('#BranchTable').html(tableRows);
				$('#BranchName').text(BranchName);
				$('#BranchTotal').text(BrachCounts['Total']);
				
				/* Create Commissions For Counselor */
				var Counselor = commissions['Counselor'];
				var CounselorCounts = data['StudentCount']['counselor'];
				keys = Object.keys(Counselor);
				var tableRows = '';
				for(key of keys){
					var row = Counselor[key];
					var CounselorName = row['user_name'];
					tableRows += '<tr class="border-bottom-success border-custom-color"><td style="padding:4px;">'+row['minimum_students']+'</td><td>'+row['calculation_method']+'</td><td>'+row['commission']+'</td></tr>'; 
				}
				$('#CounselorTable').html(tableRows);
				$('#CounselorName').text(CounselorName);
				$('#CounselorTotal').text(CounselorCounts['Total']);
				
				/* Create Commissions For Subagent */
				var Subagent = commissions['Subagent'];
				var SubagentCounts = data['StudentCount']['subagent'];
				keys = Object.keys(Subagent);
				var methods = {"Percentage Of Annual Fee":"% of Annual Fee", "Percentage Of Commission":"% of Commission", "Fixed Amount":"Fixed Amount"};
				var tableRows = '';
				for(key of keys){
					var row = Subagent[key];
					var SubagentName = row['subagent_name'];
					tableRows += '<tr class="border-bottom-success border-custom-color"><td style="padding:4px;">'+row['institution']+'</td><td>'+row['course_level']+'</td><td>'+row['minimum_students']+'</td><td>'+methods[row['calculation_method']]+'</td><td>'+row['commission']+'</td><td>'+row['branch_commission']+'</td><td>'+row['counselor_commission']+'</td></tr>'; 
				}
				$('#SubagentTable').html(tableRows);
				$('#SubagentName').text(SubagentName);
				
				var Counts = '<span class="btn btn-sm btn-danger" style="padding:3px !important;margin: 2px;">Total <span class="badge badge-light" style="color:black">'+SubagentCounts['Total']+'</span></span>';
				// Counts += '<span class="btn btn-danger" style="padding:3px !important;margin: 2px;">'+opportunity['discipline_name']+'<span class="badge badge-light" style="color:black">'+SubagentCounts['discipline']+'</span></span>';
				Counts += '<span class="btn btn-danger" style="padding:3px !important;margin: 2px;">'+opportunity['course_level']+'<span class="badge badge-light" style="color:black">'+SubagentCounts['level']+'</span></span>';
				// Counts += '<span class="btn btn-danger" style="padding:3px !important;margin: 2px;">'+opportunity['course_name']+'<span class="badge badge-light" style="color:black">'+SubagentCounts['course']+'</span></span>';
				Counts += '<span class="btn btn-danger" style="padding:3px !important;margin: 2px;">'+invoice['account_name']+'<span class="badge badge-light" style="color:black">'+SubagentCounts['course_provider']+'</span></span>';
				Counts += '<span class="btn btn-danger" style="padding:3px !important;margin: 2px;">Course Provier & Level<span class="badge badge-light" style="color:black">'+SubagentCounts['cp_level']+'</span></span>';
			
				$('#SubagentStudentCount').html(Counts);
				if(tableRows==''){
					$('.subagentcomDiv').hide();
					$('#subagCommAm_Sys').val('');
					$('#subagCommAm_Act').val('');
				}else{
					$('.subagentcomDiv').show();
				}
				/* Populate Values */
				var Opportunity = data['Opportunity'];
				var Invoice = data['Invoice'];
				console.log('aaaa'+Invoice);
				$('#AOSInvoiceID').val(invoice_id);
				$('#OIAccountID').val(Invoice['account_id']);
				$('#OIContactID').val(Invoice['student_id']);
				$('#OIOpportunityID').val(Invoice['opportunity_id']);
				$('#OICounselorID').val(Opportunity['counselor_id']);
				$('#OIBranchID').val(Opportunity['branch_id']);
				$('#OISubagID').val(Opportunity['subagent_id']);
				
				$('#StudentName').text(Invoice['student_name']);
				$('#AnnualFee').text(Invoice['course_fee']);
				$('#InvID').text(Invoice['invoice_number']);
				$('#AccountName').text(Invoice['account_name']);
				$('#InvoicedAmount').text(parseFloat(Invoice['total_invoiced_amount']).toFixed(2));
				$('#TaxAmount').text(parseFloat(Invoice['tax_amount']).toFixed(2));
				$('#TotalAmount').text(parseFloat(Invoice['total_amount']).toFixed(2));
				$('#AmountPaid').text(parseFloat(Invoice['amount_paid']).toFixed(2));
				$('#CommencedDate').text(Opportunity['commence_date']);
				$('#OppName').text(Opportunity['name']);
				
				
				if(data['subagent_commission']){
					subagentcommission = data['subagent_commission'];
					$('#subagCommAm_Sys').val(parseFloat(subagentcommission['subagent_commission']).toFixed(2));
					$('#officeCommAm_Sys').val(parseFloat(subagentcommission['branch_commission']).toFixed(2));
					$('#officeCommAm_Act').val(parseFloat(subagentcommission['branch_commission']).toFixed(2));
					$('#counsCommAm_Sys').val(parseFloat(subagentcommission['counselor_commission']).toFixed(2));
					$('#counsCommAm_Act').val(parseFloat(subagentcommission['counselor_commission']).toFixed(2));

					/* Calculation Formula */
					// calculations
					// subagentCalc,branchCalc,counselorCalc 
					$('#subagentCalc').text(subagentcommission['calculations']['subagent']);
					$('#branchCalc').text(subagentcommission['calculations']['branch']);
					$('#counselorCalc').text(subagentcommission['calculations']['counselor']);
				}else{
					$('#subagCommAm_Act').val('0');
					if(data['counselor_commission']){
						counselor_commission = data['counselor_commission'];
						$('#counsCommAm_Sys').val(parseFloat(counselor_commission['counselor_commission']).toFixed(2));
						$('#counsCommAm_Act').val(parseFloat(counselor_commission['counselor_commission']).toFixed(2));
						$('#counselorCalc').text(counselor_commission['calculations']['counselor']);
					}else{
						$('#counsCommAm_Sys').val(0);
					}
					// calculations
					if(data['branch_commission']){
						branch_commission = data['branch_commission'];
						$('#officeCommAm_Sys').val(parseFloat(branch_commission['branch_commission']).toFixed(2));
						$('#officeCommAm_Act').val(parseFloat(branch_commission['branch_commission']).toFixed(2));
						$('#branchCalc').text(branch_commission['calculations']['branch']);
					}else{
						$('#officeCommAm_Sys').val(0);
					}
				}
			}	
		});
	},
	saveOugoingInvoices: function(){
		//console.log(calculationString);
		
		AOSInvoiceID = $('#AOSInvoiceID').val();
		SubagCommAmAct = $('#subagCommAm_Act').val();
		OfficeCommAmAct = $('#officeCommAm_Act').val();
		CounsCommAmAct = $('#counsCommAm_Act').val();
		
		if(SubagCommAmAct == ''){
			$("#subagCommAm_Act").notify("Can not be blank, Add 0 or more!");
			return false;
		}
		if(OfficeCommAmAct == ''){
			$("#officeCommAm_Act").notify("Can not be blank, Add 0 or more!");
			return false;
		}
		if(CounsCommAmAct == ''){
			$("#counsCommAm_Act").notify("Can not be blank, Add 0 or more!");
			return false;
		}
		SubagCommAmSys = $('#subagCommAm_Sys').val();
		OfficeCommAmSys = $('#officeCommAm_Sys').val();
		CounsCommAmSys = $('#counsCommAm_Sys').val();

		SubagTaxAm = $('#subagTaxAm').val();
		OfficeTaxAm = $('#officeTaxAm').val();
		CounsTaxAm = $('#counsTaxAm').val();

		OIAccountID = $('#OIAccountID').val();
		OIContactID = $('#OIContactID').val();
		OIOpportunityID = $('#OIOpportunityID').val();
		OICounselorID = $('#OICounselorID').val();
		OIBranchID = $('#OIBranchID').val();
		OISubagID = $('#OISubagID').val();
		jq331('#disbursediv2').block();
		$.ajax({
			url: 'index.php?module=AOS_Invoices&action=createOutgoingInvoices',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			dataType: 'text',
			data: 'sugar_body_only=1&AOSInvoiceID='+AOSInvoiceID+'&SubagCommAmAct='+SubagCommAmAct+'&OfficeCommAmAct='+OfficeCommAmAct+'&CounsCommAmAct='+CounsCommAmAct+'&SubagCommAmSys='+SubagCommAmSys+'&OfficeCommAmSys='+OfficeCommAmSys+'&CounsCommAmSys='+CounsCommAmSys+'&OIAccountID='+OIAccountID+'&OIContactID='+OIContactID+'&OIOpportunityID='+OIOpportunityID+'&OICounselorID='+OICounselorID+'&OIBranchID='+OIBranchID+'&OISubagID='+OISubagID+'&SubagTaxAm='+SubagTaxAm+'&OfficeTaxAm='+OfficeTaxAm+'&CounsTaxAm='+CounsTaxAm,		
			async: true,			
			success: function (result) {
				jq331('#disbursediv2').unblock();
				window.location.href='index.php?module=AOS_Invoices&action=CPInvoicesListingPage';
				
			},
			error: function (request, status, errorThrown) {
				console.log(request + ' ' + status + ' ' + errorThrown);
			}
		});
		
	}
}
