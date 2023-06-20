<?php
    require("custom/modules/AOS_Quotes/jdCreateQuoteCalculationFunctions/jdCreateQuoteCalculationFunctions.php");
?>
<script src="custom/include/UI/app-js/getOptionByHtml.js"></script>
<div>
    <form id="createQuote">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:gray;">
                <span class="btn btn-block" data-toggle="collapse" data-target="#Overview" style="text-align: left;">Overview</span>
            </div>
            <div class="panel-body" id="Overview">
                <br>
                <!-- row-1 -->
                <div class="row edit-view-row">
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Title:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <input type="text" name="name" id="name">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Quote Stage:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <select name="stage" id="stage">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "quote_stage_dom"), "stage", "{$BEAN->stage}");
                                    setDDVal('stage', '{$BEAN->stage}');
                                </script>
                                <!-- <option label="Draft" value="Draft" selected="selected">Draft</option><option label="Negotiation" value="Negotiation">Negotiation</option><option label="Delivered" value="Delivered">Delivered</option><option label="On Hold" value="On Hold">On Hold</option><option label="Confirmed" value="Confirmed">Confirmed</option><option label="Closed Accepted" value="Closed Accepted">Closed Accepted</option><option label="Closed Lost" value="Closed Lost">Closed Lost</option><option label="Closed Dead" value="Closed Dead">Closed Dead</option> -->
                            </select>
                        </div>
                    </div>
                    <!-- row-2 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Valid Until:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <span class="dateTime">
                                <input class="date_input" autocomplete="off" type="text" name="expiration" id="expiration" value="07/01/2023" title="" tabindex="0" size="11" maxlength="10">
                                <button type="button" id="expiration_trigger" class="btn btn-danger" onclick="return false;">
                                    <span class="suitepicon suitepicon-module-calendar" alt="Enter Date"></span>
                                </button>
                            </span>
                            <script>
                                Calendar.setup({
                                    inputField: "expiration",
                                    // form : "EditView",
                                    ifFormat: "%m/%d/%Y %H:%M",
                                    daFormat: "%m/%d/%Y %H:%M",
                                    button: "expiration_trigger",
                                    singleClick: true,
                                    dateStr: "07/01/2023",
                                    startWeekday: 0,
                                    step: 1,
                                    weekNumbers: false
                                });
                            </script>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Invoice Status:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <select name="invoice_status" id="invoice_status" title="">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "invoice_status_dom"), "invoice_status", "{$BEAN->invoice_status}");
                                    setDDVal('stage', '{$BEAN->invoice_status}');
                                </script>
                                <!-- <option label="Not Invoiced" value="Not Invoiced" selected="selected">Not Invoiced</option><option label="Invoiced" value="Invoiced">Invoiced</option> -->
                            </select>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="clear"></div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item"></div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item"></div>
                    <!-- row-3 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Assigned To:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8">
                            <select id="assigned_user_id" name="assigned_user_id" class="col-sm-6"></select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Payment Terms:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <select name="term" id="term" title="">
                                <!-- quote_term_dom -->
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "quote_term_dom"), "term", "{$BEAN->term}");
                                    setDDVal('stage', '{$BEAN->term}');
                                </script>
                                <!-- <option label="Nett 15" value="Nett 15">Nett 15</option><option label="Nett 30" value="Nett 30">Nett 30</option><option label="Advanced" value="Advanced">Advanced</option><option label="After Delivery" value="After Delivery">After Delivery</option> -->
                            </select>
                        </div>
                    </div>
                    <!-- row-4 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Approval Status:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <select name="approval_status" id="approval_status" title="">
                                <!-- approval_status_dom -->
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "approval_status_dom"), "approval_status", "{$BEAN->approval_status}");
                                    setDDVal('stage', '{$BEAN->approval_status}');
                                </script>
                                <!-- <option label="Not Approved" value="Not Approved">Not Approved</option><option label="Approved" value="Approved">Approved</option> -->
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-4 label">
                            <label>Approval Issues:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 ">
                            <textarea id="approval_issue" name="approval_issue" rows="4" cols="60" title="" tabindex="0"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of overview panel -->
        <!-- start of address information panel -->
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:gray;">
                <span class="btn btn-block" data-toggle="collapse" data-target="#AddressInformation" style="text-align: left;">Address Information</span>
            </div>
            <div class="panel-body" id="AddressInformation">
                <br>
                <!-- row-1 -->
                <div class="row edit-view-row">
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Related Company:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select id="billing_account_id" name="billing_account_id" data-select2-id="billing_account_id" class="col-sm-8"></select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Client:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select id="billing_contact_id" name="billing_contact_id" data-select2-id="billing_contact_id" class="col-sm-6">
                                <option>-- Select client --</option>
                            </select>
                        </div>
                    </div>
                    <!-- row-2 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Sale:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select id="lead_id" name="lead_id" data-select2-id="lead_id" class="col-sm-6">
                                <option>-- Select Sale--</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label"></div>
                        <div class="col-xs-12 col-sm-6 edit-view-field "></div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item"></div>
                    <!-- row-3 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">RFQ Ref #</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="text" name="rfq_ref" id="rfq_ref" size="30" value="" title="">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Previous Quote No.:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="text" name="prev_quote_no" id="prev_quote_no" size="30" value="" title="">
                        </div>
                    </div>
                    <!-- row-4 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Payment:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select name="payment" id="payment" title="" class="col-sm-6">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "payment"), "payment", "{$BEAN->payment}");
                                    setDDVal('stage', '{$BEAN->payment}');
                                </script>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">PO To V:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="hidden" name="po_to_v" value="0">
                            <input type="checkbox" id="po_to_v" name="po_to_v" value="1" title="" tabindex="0">
                        </div>
                    </div>
                    <!-- row-5 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Status:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select name="status" id="status" title="" class="col-sm-6">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "status_quote"), "status", "{$BEAN->status}");
                                    setDDVal('stage', '{$BEAN->status}');
                                </script>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Condition:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="hidden" name="condition_c" value="0">
                            <input type="checkbox" id="condition_c" name="condition_c" value="1" title="" tabindex="0">
                        </div>
                    </div>
                    <!-- row-6 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Verified By:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select id="user_id" name="user_id" data-select2-id="user_id" class="col-sm-6">
                                <option>--Select--</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Medium:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select name="medium" id="medium" title="" class="col-sm-6">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "medium_dom"), "medium", "{$BEAN->medium}");
                                    setDDVal('stage', '{$BEAN->medium}');
                                </script>
                            </select>
                        </div>
                    </div>
                    <!-- row-7 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Reference Number:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="text" name="referencenumber" id="referencenumber" size="30" value="" title="">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Your Reference Number:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <input type="text" name="yourreferencenumber" id="yourreferencenumber" size="30" value="" title="">
                        </div>
                    </div>
                    <!-- row-8 -->
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">PDF Text:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <textarea id="pdftext" name="pdftext" rows="4" cols="60" title="" tabindex="0"></textarea>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 edit-view-row-item">
                        <div class="col-xs-12 col-sm-5 label">
                            <label class="fw-bold">Our Firm:</label>
                        </div>
                        <div class="col-xs-12 col-sm-6 edit-view-field ">
                            <select name="ourfirm" id="ourfirm" title="" class="col-sm-6">
                                <script>
                                    getOptionHTML(SUGAR.language.get("app_list_strings", "ourfirm"), "ourfirm", "{$BEAN->ourfirm}");
                                    setDDVal('stage', '{$BEAN->ourfirm}');
                                </script>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <br>     -->
        <!-- end of address information panel -->
        <!-- start of currency panel -->
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:gray;">
                <span class="btn btn-block" data-toggle="collapse" data-target="#currencyPanelContent" style="text-align: left;">Currency</span>
            </div>
            <div class="panel-body" id="currencyPanelContent">
                <br>
                <!-- row-1 -->
                <div class="row edit-view-row">
                    <div class="col-xs-12 col-sm-12 edit-view-row-item">
                        <div class="col-xs-12 col-sm-3 label">
                            <label>Currency:</label>
                        </div>
                        <div class="col-xs-12 col-sm-8 edit-view-field">
                            <select name="currency_id" id="currency_id" class="form-select">
                                <!-- <option value="" disabled>Select</option> -->
                                <option>PKR</option>
                                <option>USD</option>
                                <option>POUND</option>
                                <option>EURO</option>
                            </select>
                        </div>
                    </div>
                    <!-- row-2 -->
                    <div class="col-xs-12 col-sm-12 edit-view-row-item">
                        <div class="col-xs-12 col-sm-3 label">
                            <label>Conversion Rate:</label>
                        </div>
                        <div class="col-xs-12 col-sm-3 edit-view-field">
                            <input type="text" class="form-control" name="currency_rate" id="currency_rate" placeholder="0.00">
                        </div>
                    </div>
                    <!-- row-3 -->
                    <div class="col-xs-12 col-sm-12 edit-view-row-item">
                        <div class="col-xs-12 col-sm-3 label">
                            <label>Convert Currency:</label>
                        </div>
                        <div class="col-xs-12 col-sm-2 edit-view-field">
                            <input class="form-check-input" type="checkbox" value="1" name="convert_currency" id="convert_currency">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of currency panel -->
        <!-- Start of product/service panel -->
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:gray;">
                <span class="btn btn-block" data-toggle="collapse" data-target="#productservice" style="text-align: left;">Products/Services</span>
            </div>
            <div class="panel-body" id="productservice">
                <br>
                <!-- row-1 -->
                <div class="row" style="padding-left: 73px; padding-right: 50px;">
                    <h4 style="background-color:DodgerBlue; color: white;">Product Costing</h4>
                    <!-- This div is for Product Costing -->
                    <div id="forms-container" class="border">
                        <div class="product-form" id="form_s" style="display: none;">
                            <!-- <div class="row"><div class="col-md-1"><label class="fw-bold">S/N
                                        <input type="text" class="form-control" name="number[]" id="number" placeholder="S/N" ></label></div><div class="col-md-2"><label class="fw-bold">Product Name
                                        <input type="text" class="form-control" name="product_id[]" id="product_id" placeholder="Product Name"></label></div><div class="col-md-2"><label class="fw-bold">Sub-Product
                                        <input type="text" class="form-control" name="sub_products[]" id="sub_products" placeholder="Sub-Product"></label></div><div class="col-md-1"><label class="fw-bold">Qty
                                        <input type="text" class="form-control" name="product_qty[]" id="product_qty" placeholder="0" oninput="calculatetotal(),calculatePrice(this),calculateTax()"></label></div><div class="col-md-1"><label class="fw-bold">Unit Cost
                                        <input type="text" class="form-control" name="per_unit_cost[]" id="per_unit_cost" placeholder="0" oninput="calculatetotal(),calculatePrice(this),calculateTax()"></label></div><div class="col-md-1"><label class="fw-bold">Margin
                                        <input type="text"  class="form-control" name="product_margin[]" id="product_margin" placeholder="0" oninput="calculatetotal(),calculatePrice(this),calculateTax()"></label></div><div class="col-md-1"><label class="fw-bold">Unit Price
                                        <input type="text" class="form-control" name="product_unit_price[]" id="product_unit_price" placeholder="0" value readonly="readonly" ></label></div><div class="col-md-1"><label class="fw-bold">Total
                                        <input type="text" class="form-control" name="product_total_price[]" id="product_total_price" placeholder="0" vlaue readonly="readonly" ></label></div><div class="col-md-1 align-self-end"><button type="button" class="btn btn-danger delete-form-btn">-</button></div></div> -->
                            <!-- <div class="row"><div class="col-md-2"><label class="fw-bold"> Product Line Total
                                        <input type="text" class="form-control" placeholder="0.00"></label></div></div> -->
                            <br>
                        </div>
                        <div class="align-right" style="display: flex; justify-content: flex-end;">
                            <button type="button" class="btn btn-primary add-form-btn" onclick="addCode(),calculatetotal()">+</button>
                        </div>
                    </div>
                </div>
                <br>
                <!-- row-2 -->
                <div class="row" style="padding-left: 73px; padding-right: 50px;">
                    <h4 style="background-color:DodgerBlue; color: white;">Service Costing</h4>
                    <div id="forms-container1" class="border">
                        <div class="service-form" id="form_p" style="display: none;">
                            <!-- <div class="row"><div class="col-md-1"><label class="fw-bold">S/N
                                        <input type="text" class="form-control" name="number[]" id="number" placeholder="S/N"></label></div><div class="col-md-2"><label class="fw-bold">Service Description
                                        <input type="text" class="form-control" name="item_description[]" id="item_description" placeholder="Service Description"></label></div><div class="col-md-2"><label class="fw-bold">Total
                                        <input type="text" class="form-control" name="tc_service_total[]" id="tc_service_total" placeholder="Total" oninput="servicetotal()"></label></div><div class="col-md-1 align-self-end"><button type="button" class="btn btn-danger delete-form-btn" onclick="servicetotal()">-</button></div></div> -->
                            <br>
                        </div>
                        <div class="align-right" style="display: flex; justify-content: flex-end;">
                            <button type="button" class="btn btn-primary add-form-btn" onclick="addSCode(),servicetotal()">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<!-- End of product/service panel -->
<!-- Start of taxes panel -->
<div class="panel panel-default">
    <div class="panel-heading" style="background-color:gray;">
        <span class="btn btn-block" data-toggle="collapse" data-target="#taxesPanelContent" style="text-align: left;">Taxes</span>
        </button>
        </p>
    </div>
    <div class="panel-body" id="taxesPanelContent">
        <br>
        <!-- row-1 -->
        <div class="row edit-view-row">
            <div class="row" style="padding-left: 73px;">
                <div class="row border" id="tax">
                    <div class="col-md-5">
                        <h4 style="background-color:DodgerBlue; color: white;">Product</h4>
                        <div class="row">
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">Tax Type <select class="form-select" name="tc_product_tax_type" id="tc_product_tax_type">
                                        <option value="" disabled selected>Select</option>
                                        <script>
                                            getOptionHTML(SUGAR.language.get("app_list_strings", "tc_tax_type_dom"), "tc_product_tax_type", "{$BEAN->tc_product_tax_type}");
                                            setDDVal('stage', '{$BEAN->tc_product_tax_type}');
                                        </script>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">Value <select class="form-select" name="tc_product_tax_value" id="tc_product_tax_value" onchange="calculateTax(),Total()">
                                        <option value="" disabled selected>Select</option>
                                        <script>
                                            getOptionHTML(SUGAR.language.get("app_list_strings", "tc_product_tax_value_dom"), "tc_product_tax_value", "{$BEAN->tc_product_tax_value}");
                                            setDDVal('stage', '{$BEAN->tc_product_tax_value}');
                                        </script>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bold">Amount <input type="text" class="form-control" name="tc_product_tax_amt" id="tc_product_tax_amt" value readonly="readonly">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">Price After GST/PRA <input type="text" class="form-control" name="tc_product_price_after_pra_gst" id="tc_product_price_after_pra_gst" value readonly="readonly">
                                </label>
                            </div>
                        </div>
                        <!-- Tax with WHT tax row for product part -->
                        <div class="row">
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">WHT <select class="form-select" name="tc_product_wht_value" id="tc_product_wht_value" onchange="calculateTax(),profitcal()">
                                        <option value="" disabled selected>Select</option>
                                        <script>
                                            getOptionHTML(SUGAR.language.get("app_list_strings", "tc_product_wht_value_dom"), "tc_product_wht_value", "{$BEAN->tc_product_wht_value}");
                                            setDDVal('stage', '{$BEAN->tc_product_wht_value}');
                                        </script>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-3" style="margin-right: 30px;">
                                <label class="fw-bold">Custom WHT <input type="text" class="form-control" name="tc_product_wht_custom" id="tc_product_wht_custom" oninput="calculateTax(),Total(),profitcal()">
                                </label>
                            </div>
                            <!-- <div class="col-md-3"><label class="fw-bold">Calculated WHT
                                                <input type="text" class="form-control" placeholder="0.00"></label></div>  -->
                            <div class="col-md-3">
                                <label class="fw-bold">Price After WHT <input type="text" class="form-control" name="tc_product_price_after_wht" id="tc_product_price_after_wht" value readonly="readonly" onchange="profitcal()">
                                </label>
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <!-- End of Taxes for products -->
                    <!-- Start of Taxes for services -->
                    <div class="col-md-5">
                        <h4 style=" background-color: DodgerBlue; color: white;">Services</h4>
                        <div class="row">
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">Tax Type <select class="form-select" name="tc_service_tax_type" id="tc_service_tax_type">
                                        <option value="" disabled selected>Select</option>
                                        <script>
                                            getOptionHTML(SUGAR.language.get("app_list_strings", "tc_tax_type_dom"), "tc_service_tax_type", "{$BEAN->tc_service_tax_type}");
                                            setDDVal('stage', '{$BEAN->tc_service_tax_type}');
                                        </script>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">Value <select class="form-select" name="tc_service_tax_value" id="tc_service_tax_value" onchange="calculateserviceTax(),Total()">
                                        <option value="" disabled selected>Select</option>
                                        <option value="17">17%</option>
                                        <option value="5">5%</option>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bold">Amount <input type="text" class="form-control" name="tc_service_tax_amt" id="tc_service_tax_amt" value readonly="readonly">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">Price After GST/PRA <input type="text" class="form-control" name="tc_service_price_after_wht" id="tc_service_price_after_pra_gst" value readonly="readonly">
                                </label>
                            </div>
                        </div>
                        <!-- Tax with WHT tax row for service part -->
                        <div class="row">
                            <div class="col-md-2" style="margin-right: 30px;">
                                <label class="fw-bold">WHT <select class="form-select" name="tc_service_wht_value" id="tc_service_wht_value" onchange="calculateserviceTax(),profitcal()">
                                        <option value="" disabled selected>Select</option>
                                        <script>
                                            getOptionHTML(SUGAR.language.get("app_list_strings", "tc_service_wht_value_dom"), "tc_service_wht_value", "{$BEAN->tc_service_wht_value}");
                                            setDDVal('stage', '{$BEAN->tc_service_wht_value}');
                                        </script>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-3" style="margin-right: 30px;">
                                <label class="fw-bold">Custom WHT <input type="text" class="form-control" name="tc_service_wht_custom" id="tc_service_wht_custom" oninput="calculateserviceTax(),Total(),profitcal()">
                                </label>
                            </div>
                            <!-- <div class="col-md-3"><label class="fw-bold">Calculated WHT
                                                <input type="text" class="form-control" placeholder="0.00"></label></div>  -->
                            <div class="col-md-3">
                                <label class="fw-bold">Price After WHT <input type="text" class="form-control" name="tc_service_price_after_wht" id="tc_service_price_after_wht" value readonly="readonly" onchange="profitcal()">
                                </label>
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <!-- This div to megre product and service -->
                    <div class="col-sm-1">
                        <label class="fw-bold">Merge</label>
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onchange="servicetotal(), calculateserviceTax(), calculateTax(),Total(),profitcal()">
                    </div>
                </div>
                <!-- End of Taxes for services -->
                <!-- End of product and services taxes -->
                <br>
                <!-- This div is for Total of product & serivces-->
                <h4 style="display: inline-block; background-color: DodgerBlue; color: white;">Total</h4>
                <div class="row border">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="fw-bold">Product Total <input type="text" class="form-control" name="product_total" id="product_total" value readonly="readonly">
                                </label>
                            </div>
                            <div class="col-md-3">
                                <label class="fw-bold">Services Total <input type="text" class="form-control" name="service_total" id="service_total">
                                </label>
                            </div>
                            <div class="col-md-5">
                                <label class="fw-bold">Grand Total(Including PRA/GST) <input type="text" class="form-control" name="grand_total" id="grand_total">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of div Total of product & serivces-->
            </div>
        </div>
    </div>
</div>
<!-- end of taxes panel -->
<!-- Start of profit calculation panel -->
<!-- <br> -->
<div class="panel panel-default">
    <div class="panel-heading" style="background-color:gray;">
        <span class="btn btn-block" data-toggle="collapse" data-target="#profitcalculation" style="text-align: left;">Profit Calculation</span>
        </button>
        </p>
    </div>
    <div class="panel-body" id="profitcalculation">
        <br>
        <!-- row-1 -->
        <div class="row edit-view-row">
            <div class="col-xs-12 col-sm-12 edit-view-row-item">
                <div class="col-xs-12 col-sm-5 label">
                    <label>Total Product Cost to Company:</label>
                </div>
                <div class="col-xs-12 col-sm-3 edit-view-field">
                    <input type="text" class="form-control" name="tc_total_product_cost_to_company" id="tc_total_product_cost_to_company" placeholder="0.00">
                </div>
            </div>
            <!-- row-2 -->
            <div class="col-xs-12 col-sm-12 edit-view-row-item">
                <div class="col-xs-12 col-sm-5 label">
                    <label>Product Price After Tax:</label>
                </div>
                <div class="col-xs-12 col-sm-3 edit-view-field">
                    <input type="text" class="form-control" name="tc_product_price_after_tax" id="tc_product_price_after_tax" placeholder="0.00">
                </div>
            </div>
            <!-- row-3 -->
            <div class="col-xs-12 col-sm-12 edit-view-row-item">
                <div class="col-xs-12 col-sm-5 label">
                    <label>Product Margin:</label>
                </div>
                <div class="col-xs-12 col-sm-3 edit-view-field">
                    <input type="text" class="form-control" name="tc_product_margin" id="tc_product_margin" placeholder="0.00">
                </div>
            </div>
            <!-- row-4 -->
            <div class="col-xs-12 col-sm-12 edit-view-row-item">
                <div class="col-xs-12 col-sm-5 label">
                    <label>Service Margin:</label>
                </div>
                <div class="col-xs-12 col-sm-3 edit-view-field">
                    <input type="text" class="form-control" name="tc_service_margin" id="tc_service_margin" placeholder="0.00">
                </div>
            </div>
            <!-- row-5 -->
            <div class="col-xs-12 col-sm-12 edit-view-row-item">
                <div class="col-xs-12 col-sm-5 label">
                    <label>Total Margin:</label>
                </div>
                <div class="col-xs-12 col-sm-3 edit-view-field">
                    <input type="text" class="form-control" name="tc_total_margin" id="tc_total_margin" placeholder="0.00">
                </div>
            </div>
            <!-- End of profit calculation panel -->
        </div>
    </div>
</div>
<br>
<button type="button" class="btn btn-primary savetotal">Save Total</button>
<button type="button" class="btn btn-primary edit">Edit </button>
</form>
</div>
<!--  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>
<script>
    // Product part
    // This is for product costing increment
    function addCode(){
        var formContainer = document.getElementById("forms-container");
        var newForm = `<div class="row">
            <div class="product-form" id="form_">
                <div class="row">
                <div class="col-md-1">
                    <label class="fw-bold">S/N
                    <input type="text" class="form-control" name="number[]" id="number${formCounterab}" placeholder="S/N">
                    </label>
                </div>
                <div class="col-md-2">
                    <label class="fw-bold">Product Name
                    <input type="text" class="form-control" name="product_id[]" id="product_id${formCounterab}" placeholder="Product Name">
                    </label>
                </div>
                <div class="col-md-2">
                    <label class="fw-bold">Sub-Product
                    <input type="text" class="form-control" name="sub_products[]" id="sub_products${formCounterab}" placeholder="Sub-Product">
                    </label>
                </div>
                <div class="col-md-1">
                    <label class="fw-bold">Qty
                    <input type="text" class="form-control" name="product_qty[]" id="product_qty${formCounterab}" placeholder="0">
                    </label>
                </div>
                <div class="col-md-1">
                    <label class="fw-bold">Unit Cost
                    <input type="text" class="form-control" name="per_unit_cost[]" id="per_unit_cost${formCounterab}" placeholder="0">
                    </label>
                </div>
                <div class="col-md-1">
                    <label class="fw-bold">Margin
                    <input type="text" class="form-control" name="product_margin[]" id="product_margin${formCounterab}" placeholder="0">
                    </label>
                </div>
                <div class="col-md-1">
                    <label class="fw-bold">Unit Price
                    <input type="text" class="form-control" name="product_unit_price[]" id="product_unit_price${formCounterab}" placeholder="0" readonly="readonly">
                    </label>
                </div>
                <div class="col-md-1">
                    <label class="fw-bold">Total
                    <input type="text" class="form-control" name="product_total_price[]" id="product_total_price${formCounterab}" placeholder="0" readonly="readonly">
                    </label>
                </div>
                <div class="col-md-1 align-self-end"> 
                    <button type="button" class="btn btn-danger delete-form-btn">-</button>  
                </div>
                </div>
            </div>
            </div>`;

        formContainer.insertAdjacentHTML("beforeend", newForm);
        formCounterab++;
    }
        // End of product costing increment
        // This is for service costing increment
    function addSCode(){
        var formContainer = document.getElementById("forms-container1");
        var newForm = `<div class="row">
            <div class="service-form" id="form_">
                <div class="row">
            <div class="col-md-1">
                <label class="fw-bold">S/N
                <input type="text" class="form-control" name="number[]" id="number${formSCounterab}" placeholder="S/N">
                </label>
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Service Description
                <input type="text" class="form-control" name="item_description[]" id="item_description${formSCounterab}" placeholder="Service Description">
                </label>
            </div>
            <div class="col-md-2">
                <label class="fw-bold">Total
                <input type="text" class="form-control" name="tc_service_total[]" id="tc_service_total${formSCounterab}" placeholder="Total" oninput="servicetotal()">
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
        var margin = parseFloat(form.find('.form-control[name^="product_margin"]').val())/100;
        var unitPrice;
        unitPrice = unitCost;
        if(margin)
        {
            unitPrice = unitCost / (1 - margin);
        }
        var totalPrice = unitPrice * qty;
        
        if (isNaN(totalPrice)) {
            totalPrice= 0; 
        }
        if (isNaN(unitPrice)) {
            unitPrice= 0; 
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
            // var qty = parseFloat(form.find('.form-control[name^="product_qty"]').val());
            // var unitCost = parseFloat(form.find('.form-control[name^="per_unit_cost "]').val());
            // var totalPrice = qty * unitCost;
            var qtyInput = form.find('.form-control[name^="product_qty"]');
            var unitCostInput = form.find('.form-control[name^="per_unit_cost"]');
            var qtyValue = qtyInput.val().trim() !== '' ? parseFloat(qtyInput.val()) : 0;
            var unitCostValue = unitCostInput.val().trim() !== '' ? parseFloat(unitCostInput.val()) : 0;
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
    //Product TAx part to calculate amount and price after gst/pra
    function calculateTax() {
        //  var form = input.closest('.product-tax');
        // var form = $('.Total-form');
        var form = $('.product-tax');
        var  taxtype, piceaftergst,priceafterwht ,pwht,customwht,productvalue;
        taxtype= document.getElementById("tc_product_tax_type").value;
        productvalue = document.getElementById("tc_product_tax_value").value;
        pwht = document.getElementById("tc_product_wht_value").value;
        customwht = document.getElementById("tc_product_wht_custom").value;
        var productsum = calculatetotal();
        productvalue = productsum *(productvalue/100);
        priceaftergst= productvalue + productsum ;
        // console.log('Price after gst/pra:',priceaftergst);
        priceafterwht = priceaftergst*(pwht/100);
        if(customwht)
        {
            priceafterwht = priceaftergst*(customwht/100);
        }
        // console.log(priceafterwht);
        var Pamount =document.getElementById("tc_product_tax_amt");
        var PAgst =document.getElementById("tc_product_price_after_pra_gst");
        var PAwht =document.getElementById("tc_product_price_after_wht");
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
        var  taxtype,piceaftergst,priceafterwht ,pwht,customwht,servicevalue;
        taxtype= document.getElementById("tc_service_tax_type").value;
        servicevalue = document.getElementById("tc_service_tax_value").value;
        pwht = document.getElementById("tc_service_wht_value").value;
        customwht = document.getElementById("tc_service_wht_custom").value;
        var servicesum = servicetotal();
        servicevalue = servicesum*(servicevalue/100);
        priceaftergst= servicevalue + servicesum;
        // console.log(priceaftergst);
        var servicewht = parseFloat(servicetotal());
        //  priceafterwht = servicewht*(pwht/100);
            priceafterwht = priceaftergst*(pwht/100);
        if(customwht)
        {
            priceafterwht = priceaftergst*(customwht/100);
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
    function Total(){
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
        var gt= parseFloat(pt) + parseFloat(st);
        if (isNaN(pt)) {
            pt= 0; 
            }
        if (isNaN(st)) {
            st= 0; 
            }
        if (isNaN(gt)) {
            gt= 0; 
            }
        productTotal.value = pt.toFixed(2);
        serviceTotal.value = st.toFixed(2);
        grandTotal.value = gt.toFixed(2);
    }
    // End of Total of product & service
    function profitcal(){
        var form =$('.profit-calculation');
        var TotalPCost = document.getElementById("tc_total_product_cost_to_company"); 
        var PPaftertax = document.getElementById("tc_product_price_after_tax");
        var Pmargin =   document.getElementById("tc_product_margin");
        var Smargin =  document.getElementById("tc_service_margin");
        var Tmargin = document.getElementById("tc_total_margin");
        //To calculate total product cost
        var totalpcost = parseFloat(calculateProductPrice());
        if (isNaN(totalpcost)) {
            totalpcost = 0; 
            }

        TotalPCost.value =  totalpcost.toFixed(2);
        // console.log("Product price with out margin=" , TotalPCost );

        //To calculate product price after tax
        var pT = parseFloat(calculatetotal());
        var PWHT = calculateTax();
        var second = PWHT[1];
        // console.log('Second Value:', second);
        var productpriceAfterTax = pT - second ;
        // console.log("Product price After Tax=" ,productpriceAfterTax );
        if (isNaN(productpriceAfterTax)) {
            productpriceAfterTax= 0; 
            }
        PPaftertax.value =  productpriceAfterTax.toFixed(2);

        //To calculate product margin
        productmargin = productpriceAfterTax - totalpcost;
        if (isNaN(productmargin)) {
            productmargin= 0; 
            }
        Pmargin.value =  productmargin.toFixed(2);

        //To calculate service margin
        var sT = parseFloat(servicetotal());
        var SWHT = calculateserviceTax();
        var second = SWHT[1];
        console.log('Second Value:', second);
        var servicemargin = sT - second ;
        console.log("Service margin =" ,servicemargin );
        if (isNaN(servicemargin)) {
            servicemargin= 0; 
            }
        Smargin.value =  servicemargin.toFixed(2);

        //To calculate Total margin
        var total = productmargin + servicemargin;
        if (isNaN(total)) {
            total= 0; 
            }
        Tmargin.value = total.toFixed(2);
    }
    // For product costing row clone
    $(document).ready(function() {
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
        var createQuoteFormData  = $('#createQuote').serializeObject();
    var createQuoteFormData = {createQuoteFormData:createQuoteFormData};
    debugger;
        $.ajax({
            url:  "index.php?module=AOS_Quotes&action=saveQuote&sugar_body_only=true",
            method: 'POST',
            data: createQuoteFormData,
            success: function(response) {
                console.log(response);
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
        }else {
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
// End of service costing row clone
</script> -->
