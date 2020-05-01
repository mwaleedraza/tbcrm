var ManageInstInvoice = {
    manageInvoicesClicked: function (obj) {
        var accountId = $(obj).attr('data-instId');
        var accountName = $(obj).attr('data-instName');
        if (accountName) {
            $('#instNameHd').text(accountName);
        }
        //in real life, we will use the accountId to fetch the invoices from CRM but here i am using dummy data
        $('#moredatadivwrapper').show(); //show to div at the bottom of the Institutes Grid.
        $('#institutesTabDiv').addClass('disabled1'); //disable the clicks on the rest of the page and dim it
        $('#moredatadiv').append('<h3 class="info">List of Invoices</h3>');
        $('#moredatadiv').append('<table id="instituteInvoicesTab" class="table table-striped table-bordered" width="100%"></table >');
        jq331('#instituteInvoicesTab').DataTable({
            data: invoicedDummyData,
            columns: [
                {
                    data: "name",
                    title: "Invoice Name",
                    width: "20%",
                    mRender: function (data, type, full) {
                        debugger;
                        return '<span class="cursor-pointer" onclick="ManageInstInvoice.showInvoiceDetails(this)" style="font-weight:600;" data-invId="' + full["ID"] + '">' + data + '</span>' + '&nbsp;<i class="fa fa-pencil info cursor-pointer" onclick="ManageInstInvoice.editInvoiceClicked(this)"  data-invId="' + full["ID"] + '"></i><br/><span>Bachelor of Computer Science</span>';
                    }
                },
                {
                    data: "total_amt",
                    title: "Amount",
                    width: "10%"
                },
                {
                    data: "due_date",
                    title: "Due Date",
                    width: "10%"
                },
                {
                    data: "status",
                    title: "Status",
                    width: "10%"
                },
                {
                    "mData": null,
                    "bSortable": false,
                    width: "20%",
                    "mRender": function (data, type, full) {
                        return '<button type="button" data-instId="' + data["ID"] + '" onclick="ManageInstStaff.manageStaffClicked(this)" class="btn mr-1 mb-1 btn-info btn-sm">Add Payment</button>'
                        //'<button type="button" data-instId="' + data["ID"] + '" onclick="ManageInstFeedback.manageFeedbackClicked(this)" class="btn mr-1 mb-1 btn-secondary btn-sm">Feedback</button>' +
                        //'<button type="button" data-instId="' + data["ID"] + '" onclick="ManageInstInvoice.manageInvoicesClicked(this)" class="btn mr-1 mb-1 btn-warning btn-sm">Invoices</button>';
                    }
                }
            ]
        });

        animateScrollTo(document.querySelector('#moredatadivwrapper'));
    },

    showInvoiceDetails: function (obj) {
        var invid = $(obj).attr('data-invId');
        $('#invDetailsForm').modal('show');
    },

    editInvoiceClicked: function (obj) {
        var invid = $(obj).attr('data-invId');
        alert('Invoice Edit for ' + invid);
    }
}
var invoicedDummyData = [
    {
        "id": "3971727e-27fd-4383-e574-5c36da1541c5",
        "name": "",
        "date_entered": "2019-01-10 05:41:00",
        "date_modified": "2019-01-10 08:15:27",
        "modified_user_id": 1,
        "created_by": "77234fe9-6bcd-bd86-e729-5c2a05c10463",
        "description": "NULL",
        "deleted": 1,
        "assigned_user_id": "5feb323b-0d0b-f96f-80e4-5c1b4d419623",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "300d8c29-d0a8-3bcd-4979-5c36d73051ef",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 2,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "NULL",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "60468ef2-22e9-bf45-815d-5c36d63c7898",
        "invoice_number": "NULL",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": "NULL",
        "igec_bank_accounts_id": "NULL",
        "system_suggested_commission_ratio": "NULL",
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "cc1600b7-6be9-3278-10c0-5c36fc51d1fc",
        "name": "",
        "date_entered": "2019-01-10 08:05:50",
        "date_modified": "2019-01-10 08:15:27",
        "modified_user_id": 1,
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 1,
        "assigned_user_id": "5feb323b-0d0b-f96f-80e4-5c1b4d419623",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "300d8c29-d0a8-3bcd-4979-5c36d73051ef",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 3,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "NULL",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "9d49bf53-304d-08c5-37df-5c36f7e367a6",
        "invoice_number": "NULL",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "dc058e38-5195-5d7f-a7d5-5c37010aade4",
        "name": "ADMIN1-I-000003",
        "date_entered": "2019-01-10 08:24:04",
        "date_modified": "2019-01-10 11:59:51",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 1,
        "assigned_user_id": "5feb323b-0d0b-f96f-80e4-5c1b4d419623",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 4,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "9d49bf53-304d-08c5-37df-5c36f7e367a6",
        "invoice_number": "NULL",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "ed50806d-e9a4-52ea-a97e-5c373232f32a",
        "name": "GL-COL-I-000003",
        "date_entered": "2019-01-10 11:56:45",
        "date_modified": "2019-01-10 11:56:45",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "300d8c29-d0a8-3bcd-4979-5c36d73051ef",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 8,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "NULL",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "28ae75e3-03ff-1336-183a-5c3712070a0c",
        "invoice_number": "GL-COL-I-000003",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "8cf1ae99-572d-9682-d524-5c3702daccdd",
        "name": "ADMIN1-I-000003",
        "date_entered": "2019-01-10 08:27:45",
        "date_modified": "2019-01-10 11:59:51",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 1,
        "assigned_user_id": "5feb323b-0d0b-f96f-80e4-5c1b4d419623",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 5,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "9d49bf53-304d-08c5-37df-5c36f7e367a6",
        "invoice_number": "NULL",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "3a1866a0-09b3-291c-b47f-5c37024782a4",
        "name": "ADMIN1-I-000003",
        "date_entered": "2019-01-10 08:30:39",
        "date_modified": "2019-01-10 11:59:51",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 1,
        "assigned_user_id": "5feb323b-0d0b-f96f-80e4-5c1b4d419623",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 6,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "9d49bf53-304d-08c5-37df-5c36f7e367a6",
        "invoice_number": "NULL",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "c39c6ca1-42e3-bda5-fec6-5c37037120e5",
        "name": "GL-COL-I-000002",
        "date_entered": "2019-01-10 08:35:12",
        "date_modified": "2019-03-14 11:33:22",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "300d8c29-d0a8-3bcd-4979-5c36d73051ef",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 7,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": "",
        "quote_number": "NULL",
        "quote_date": "2019-01-10",
        "invoice_date": "NULL",
        "due_date": "2019-04-10",
        "status": "Partially Paid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "9d49bf53-304d-08c5-37df-5c36f7e367a6",
        "invoice_number": "GL-COL-I-000002",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "3f66d100-9629-7593-a501-5c485ec078eb",
        "name": "GL-COL-I-000010",
        "date_entered": "2019-01-23 12:30:26",
        "date_modified": "2019-01-23 12:30:26",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "ed76e484-d44c-ffda-4686-5c45b0a29e9d",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 15,
        "total_amt": 4041.6,
        "total_amt_usdollar": 5613.333333,
        "subtotal_amount": 4445.76,
        "subtotal_amount_usdollar": 6174.666667,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 222.29,
        "tax_amount_usdollar": 308.736111,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 5,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4668.05,
        "total_amount_usdollar": 6483.402778,
        "currency_id": "6972d5da-0ffa-1432-a0d3-5bf552627eba",
        "quote_number": "NULL",
        "quote_date": "2019-01-23",
        "invoice_date": "NULL",
        "due_date": "2019-04-23",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "11610bf7-7747-6397-ff9c-5c45ad378f56",
        "invoice_number": "GL-COL-I-000010",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "be8df778-0a9f-2d1c-fd88-5c31b4c08384",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "2e1288eb-4b87-3897-cfae-5c486d3e2d39",
        "name": "GL-COL-I-000011",
        "date_entered": "2019-01-23 13:35:00",
        "date_modified": "2019-01-23 08:57:08",
        "modified_user_id": 1,
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "300d8c29-d0a8-3bcd-4979-5c36d73051ef",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 16,
        "total_amt": 4368,
        "total_amt_usdollar": 4368,
        "subtotal_amount": 4804.8,
        "subtotal_amount_usdollar": 4804.8,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 4804.8,
        "total_amount_usdollar": 4804.8,
        "currency_id": -99,
        "quote_number": "NULL",
        "quote_date": "2019-01-23",
        "invoice_date": "NULL",
        "due_date": "2019-04-23",
        "status": "Partially Paid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "28ae75e3-03ff-1336-183a-5c3712070a0c",
        "invoice_number": "GL-COL-I-000011",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "be8df778-0a9f-2d1c-fd88-5c31b4c08384",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": "NULL",
        "suggested_course_fee": "NULL",
        "system_suggested_commission": "NULL",
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "944bcb29-60ff-db98-6a18-5c4b06dfc069",
        "name": "GL-COL-I-000013",
        "date_entered": "2019-01-25 12:50:08",
        "date_modified": "2019-01-25 12:50:08",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "629b03a5-8d7f-3bdf-c4e0-5c4b02528ff1",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 18,
        "total_amt": 5000,
        "total_amt_usdollar": 5000,
        "subtotal_amount": 5500,
        "subtotal_amount_usdollar": 5500,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 5500,
        "total_amount_usdollar": 5500,
        "currency_id": "f202b2ba-2222-2b85-215c-5c0e4597dc2c",
        "quote_number": "NULL",
        "quote_date": "2019-01-25",
        "invoice_date": "2019-01-25",
        "due_date": "2019-04-25",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "61724115-efbf-8438-6e08-5c4b026cb45c",
        "invoice_number": "GL-COL-I-000013",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": 50000,
        "suggested_course_fee": 43680,
        "system_suggested_commission": 4368,
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "7557e738-8953-0fb8-1e4a-5c4b09e7de75",
        "name": "GL-COL-I-000014",
        "date_entered": "2019-01-25 13:03:55",
        "date_modified": "2019-01-25 13:03:55",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "629b03a5-8d7f-3bdf-c4e0-5c4b02528ff1",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 19,
        "total_amt": 5000,
        "total_amt_usdollar": 5000,
        "subtotal_amount": 5500,
        "subtotal_amount_usdollar": 5500,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 5500,
        "total_amount_usdollar": 5500,
        "currency_id": "6972d5da-0ffa-1432-a0d3-5bf552627eba",
        "quote_number": "NULL",
        "quote_date": "2019-01-25",
        "invoice_date": "2019-01-25",
        "due_date": "2019-04-25",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "61724115-efbf-8438-6e08-5c4b026cb45c",
        "invoice_number": "GL-COL-I-000014",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": 50000,
        "suggested_course_fee": 43680,
        "system_suggested_commission": 4368,
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    },
    {
        "id": "e92b5353-aa99-e20c-fcd4-5c4b092072c8",
        "name": "GL-COL-I-000015",
        "date_entered": "2019-01-25 13:06:49",
        "date_modified": "2019-01-25 13:06:49",
        "modified_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "created_by": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "description": "NULL",
        "deleted": 0,
        "assigned_user_id": "7f6bf3b8-4d05-cb06-37eb-5c2a0183ef9e",
        "billing_account_id": "a716b7ec-eaa8-7aa1-7d4b-5be997328c5f",
        "billing_contact_id": "629b03a5-8d7f-3bdf-c4e0-5c4b02528ff1",
        "billing_address_street": "NULL",
        "billing_address_city": "NULL",
        "billing_address_state": "NULL",
        "billing_address_postalcode": "NULL",
        "billing_address_country": "NULL",
        "shipping_address_street": "NULL",
        "shipping_address_city": "NULL",
        "shipping_address_state": "NULL",
        "shipping_address_postalcode": "NULL",
        "shipping_address_country": "NULL",
        "number": 20,
        "total_amt": 5000,
        "total_amt_usdollar": 6944.444444,
        "subtotal_amount": 5500,
        "subtotal_amount_usdollar": 7638.888889,
        "discount_amount": 0,
        "discount_amount_usdollar": 0,
        "tax_amount": 0,
        "tax_amount_usdollar": 0,
        "shipping_amount": "NULL",
        "shipping_amount_usdollar": 0,
        "shipping_tax": 0,
        "shipping_tax_amt": "NULL",
        "shipping_tax_amt_usdollar": 0,
        "total_amount": 5500,
        "total_amount_usdollar": 7638.888889,
        "currency_id": "6972d5da-0ffa-1432-a0d3-5bf552627eba",
        "quote_number": "NULL",
        "quote_date": "2019-01-25",
        "invoice_date": "2019-01-25",
        "due_date": "2019-04-25",
        "status": "Unpaid",
        "template_ddown_c": "NULL",
        "subtotal_tax_amount": "NULL",
        "subtotal_tax_amount_usdollar": 0,
        "invoice_type": "Provider",
        "opportunity_id": "61724115-efbf-8438-6e08-5c4b026cb45c",
        "invoice_number": "GL-COL-I-000015",
        "invoice_discount_method": "Amount",
        "invoice_discount_value": 0,
        "temp_assigned_user_id": "NULL",
        "commision_ratio": 10,
        "igec_bank_accounts_id": "259775c4-a01e-b315-35f4-5c305cd7fddd",
        "system_suggested_commission_ratio": 10,
        "cp_std_id": "NULL",
        "igec_std_contact_id": "NULL",
        "is_primary": "Yes",
        "service_name": "NULL",
        "course_fee": 50000,
        "suggested_course_fee": 43680,
        "system_suggested_commission": 4368,
        "discount_reason": "NULL",
        "amount_balance": "NULL",
        "amount_paid": "NULL",
        "counselor_id": "NULL",
        "sys_calculated_subtotal": "NULL"
    }
]