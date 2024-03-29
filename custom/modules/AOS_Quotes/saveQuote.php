<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

global $db,$bean;
// declarations
$responseArr = array();
// $createQuoteFormData = $_POST['createQuoteFormData'];
// fetch all data
$recordID = $_POST['recordID'];
$product_total = $_POST['createQuoteFormData']['product_total'];
$service_total = $_POST['createQuoteFormData']['service_total'];
$grand_total = $_POST['createQuoteFormData']['grand_total'];
$tc_total_product_cost_to_company = $_POST['createQuoteFormData']['tc_total_product_cost_to_company'];
$tc_product_price_after_tax = $_POST['createQuoteFormData']['tc_product_price_after_tax'];
$tc_product_margin = $_POST['createQuoteFormData']['tc_product_margin'];
$tc_service_margin = $_POST['createQuoteFormData']['tc_service_margin'];
$tc_total_margin = $_POST['createQuoteFormData']['tc_total_margin'];
$ssn = $_POST['createQuoteFormData']['ssn'];
$service_name = $_POST['createQuoteFormData']['service_name'];
$service_line_price = $_POST['createQuoteFormData']['service_line_price'];
$currency_id = $_POST['createQuoteFormData']['currency_id'];
$currency_rate = $_POST['createQuoteFormData']['currency_rate'];
$convert_currency = $_POST['createQuoteFormData']['convert_currency'];
$tc_product_tax_type = $_POST['createQuoteFormData']['tc_product_tax_type'];
$tc_product_tax_value  = $_POST['createQuoteFormData']['tc_product_tax_value'];
$tc_product_tax_amt = $_POST['createQuoteFormData']['tc_product_tax_amt'];
$tc_product_price_after_pra_gst = $_POST['createQuoteFormData']['tc_product_price_after_pra_gst'];
$tc_product_wht_value = $_POST['createQuoteFormData']['tc_product_wht_value'];
$tc_product_wht_custom = $_POST['createQuoteFormData']['tc_product_wht_custom'];
$tc_product_price_after_wht = $_POST['createQuoteFormData']['tc_product_price_after_wht'];
$tc_service_tax_type = $_POST['createQuoteFormData']['tc_service_tax_type'];
$tc_service_tax_value = $_POST['createQuoteFormData']['tc_service_tax_value'];
$tc_service_tax_amt = $_POST['createQuoteFormData']['tc_service_tax_amt'];
$tc_service_price_after_pra_gst = $_POST['createQuoteFormData']['tc_service_price_after_pra_gst'];
$tc_service_wht_value = $_POST['createQuoteFormData']['tc_service_wht_value'];
$tc_service_wht_custom = $_POST['createQuoteFormData']['tc_service_wht_custom'];
$tc_service_price_after_wht = $_POST['createQuoteFormData']['tc_service_price_after_wht'];
$name = $_POST['createQuoteFormData']['name'];
$stage = $_POST['createQuoteFormData']['stage'];
$expiration = $_POST['createQuoteFormData']['expiration'];
$invoice_status = $_POST['createQuoteFormData']['invoice_status'];
$assigned_user_id = $_POST['createQuoteFormData']['assigned_user_id'];
$term = $_POST['createQuoteFormData']['term'];
$approval_status = $_POST['createQuoteFormData']['approval_status'];
$approval_issue = $_POST['createQuoteFormData']['approval_issue'];
$billing_account_id = $_POST['createQuoteFormData']['billing_account_id'];
$billing_contact_id = $_POST['createQuoteFormData']['billing_contact_id'];
$lead_id = $_POST['createQuoteFormData']['lead_id'];
$rfq_ref = $_POST['createQuoteFormData']['rfq_ref'];
$prev_quote_no = $_POST['createQuoteFormData']['prev_quote_no'];
$payment = $_POST['createQuoteFormData']['payment'];
$po_to_v = $_POST['createQuoteFormData']['po_to_v'];
// $status = $_POST['createQuoteFormData']['status'];
$condition_c = $_POST['createQuoteFormData']['condition_c'];
$user_id = $_POST['createQuoteFormData']['user_id'];
$medium = $_POST['createQuoteFormData']['medium'];
$product_short_code = $_POST['createQuoteFormData']['product_short_code'];
$referencenumber = $_POST['createQuoteFormData']['referencenumber'];
$yourreferencenumber = $_POST['createQuoteFormData']['yourreferencenumber'];
$pdftext= $_POST['createQuoteFormData']['pdftext'];
$ourfirm = $_POST['createQuoteFormData']['ourfirm'];
// Products line items 
$sn = $_POST['createQuoteFormData']['sn'];
$product_id = $_POST['createQuoteFormData']['product_id'];
$AOS_Products_Quotes_name = $_POST['createQuoteFormData']['AOS_Products_Quotes_name'];
$AOS_Products_Quotes_Id = $_POST['createQuoteFormData']['AOS_Products_Quotes_Id'];
$sub_products = $_POST['createQuoteFormData']['sub_products'];
$sub_product_name = $_POST['createQuoteFormData']['sub_product_name'];
$product_qty = $_POST['createQuoteFormData']['product_qty'];
$per_unit_cost = $_POST['createQuoteFormData']['per_unit_cost'];
$product_margin = $_POST['createQuoteFormData']['product_margin'];
$product_unit_price = $_POST['createQuoteFormData']['product_unit_price'];
$product_total_price = $_POST['createQuoteFormData']['product_total_price'];
// service line items
$number = $_POST['createQuoteFormData']['number'];
$AOS_Products_Quotes_service_Id = $_POST['createQuoteFormData']['AOS_Products_Quotes_service_Id'];
$AOS_Products_Quotes_service_name = $_POST['createQuoteFormData']['AOS_Products_Quotes_service_name'];
$item_description = $_POST['createQuoteFormData']['item_description'];
$is_service = $_POST['createQuoteFormData']['is_service'];
$tc_service_total = $_POST['createQuoteFormData']['tc_service_total'];

// Quotes Saving
// if recordID is not null then update otherwise it's new reord
if($recordID==''){
    $AOS_QuotesBean = BeanFactory::newBean('AOS_Quotes');
}else{
    $AOS_QuotesBean = BeanFactory::getBean('AOS_Quotes',$recordID);
}
    $quote_date = date("Y-m-d", strtotime($AOS_QuotesBean->date_entered));
    $AOS_QuotesBean->jd_quote_date = $quote_date;
    $AOS_QuotesBean->name = $name;
    $AOS_QuotesBean->stage = $stage;
    $AOS_QuotesBean->expiration = $expiration;
    $AOS_QuotesBean->invoice_status = $invoice_status;
    $AOS_QuotesBean->assigned_user_id = $assigned_user_id;
    $AOS_QuotesBean->term = $term;
    $AOS_QuotesBean->approval_status = $approval_status;
    $AOS_QuotesBean->approval_issue = $approval_issue;
    $AOS_QuotesBean->billing_account_id = $billing_account_id;
    $AOS_QuotesBean->billing_contact_id = $billing_contact_id;
    $AOS_QuotesBean->lead_id = $lead_id;
    $AOS_QuotesBean->rfq_ref = $rfq_ref;
    $AOS_QuotesBean->prev_quote_no = $prev_quote_no;
    $AOS_QuotesBean->payment = $payment;
    $AOS_QuotesBean->po_to_v = $po_to_v;
    // $AOS_QuotesBean->status = $status;
    $AOS_QuotesBean->condition_c = $condition_c;
    $AOS_QuotesBean->user_id = $user_id;
    $AOS_QuotesBean->medium = $medium;
    $AOS_QuotesBean->product_short_code = $product_short_code;
    $AOS_QuotesBean->referencenumber = $referencenumber;
    $AOS_QuotesBean->yourreferencenumber = $yourreferencenumber;
    $AOS_QuotesBean->pdftext = $pdftext;
    $AOS_QuotesBean->ourfirm = $ourfirm;
    $AOS_QuotesBean->currency_id = $currency_id;
    $AOS_QuotesBean->currency_rate = $currency_rate;
    $AOS_QuotesBean->convert_currency = $convert_currency;
    $AOS_QuotesBean->tc_total_product_cost_to_company = $tc_total_product_cost_to_company;
    $AOS_QuotesBean->tc_product_price_after_tax = $tc_product_price_after_tax;
    $AOS_QuotesBean->tc_product_margin = $tc_product_margin;
    $AOS_QuotesBean->tc_service_margin = $tc_service_margin;
    $AOS_QuotesBean->tc_total_margin = $tc_total_margin;
    $AOS_QuotesBean->tc_product_tax_type = $tc_product_tax_type;
    $AOS_QuotesBean->tc_product_tax_value = $tc_product_tax_value;
    $AOS_QuotesBean->tc_product_tax_amt = $tc_product_tax_amt;
    $AOS_QuotesBean->tc_product_price_after_pra_gst = $tc_product_price_after_pra_gst;
    $AOS_QuotesBean->tc_product_wht_value = $tc_product_wht_value;
    $AOS_QuotesBean->tc_product_wht_custom = $tc_product_wht_custom;
    $AOS_QuotesBean->tc_product_price_after_wht = $tc_product_price_after_wht;
    $AOS_QuotesBean->tc_service_tax_type = $tc_service_tax_type;
    $AOS_QuotesBean->tc_service_tax_value = $tc_service_tax_value;
    $AOS_QuotesBean->tc_service_tax_amt = $tc_service_tax_amt;
    $AOS_QuotesBean->tc_service_price_after_pra_gst = $tc_service_price_after_pra_gst;
    $AOS_QuotesBean->tc_service_wht_value = $tc_service_wht_value;
    $AOS_QuotesBean->tc_service_wht_custom = $tc_service_wht_custom;
    $AOS_QuotesBean->tc_service_price_after_wht = $tc_service_price_after_wht;
    $AOS_QuotesBean->tc_grand_total = $grand_total;
    $AOS_QuotesBean->tc_product_total = $product_total;
    $AOS_QuotesBean->tc_service_total = $service_total;
    $AOS_QuotesBean->save();
    if($AOS_QuotesBean->id){
        global $db,$bean;
        // // start of checking deleted records
        // $aos_products_quotesArr = array();
        // $query2 = "SELECT id FROM aos_products_quotes WHERE parent_id = '$AOS_QuotesBean->id' AND deleted='0'";
        // $aos_products_quotes = $db->query($query2);
        // while ($aos_products_quotesRows = $db->fetchByAssoc($aos_products_quotes)) {
        //     array_push($aos_products_quotesArr, $aos_products_quotesRows['id']);
        // }
        // $deleted_products = array_diff($aos_products_quotesArr,$AOS_Products_Quotes_Id);
        // $deleted_products = array_values($deleted_products);
        // // var_dump($deleted_products);
        // for ($i=0; $i <= count($deleted_products); $i++) {
        //     $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$deleted_products[$i]);
        //     $AOS_Products_QuotesBEAN->deleted='1';
        //     $AOS_Products_QuotesBEAN->save();
        // }
        // // end of checking deleted records
        // products Line items saving
        if($product_id){
            if(is_array($product_id)){
                for ($i=0; $i < count($product_id); $i++) {
                    // if($is_service[$i]!='on' || $is_service[$i]!='1'){
                        if($AOS_Products_Quotes_Id[$i] ==''){
                            $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
                        }else{
                            $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_Id[$i]);
                            $productName = $AOS_Products_QuotesBEAN->name;
                        }
                        $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
                        $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
                        // fetch product name
                        $fetchProduct_nameQuery = "SELECT name FROM aos_products where deleted = '0' AND  id='".$product_id[$i]."'";
                        $fetchProduct_nameQueryResult = $GLOBALS['db']->query($fetchProduct_nameQuery);
                        while ($row = $GLOBALS['db']->fetchByAssoc($fetchProduct_nameQueryResult)) {
                            $productName = $row['name'];
                        }
                        // $AOS_Products_QuotesBEAN->number = $sn[$i];
                        $AOS_Products_QuotesBEAN->name = $productName;
                        $AOS_Products_QuotesBEAN->number = $number[$i];
                        $AOS_Products_QuotesBEAN->product_id = $product_id[$i];
                        $AOS_Products_QuotesBEAN->sub_products = $sub_products[$i];
                        $AOS_Products_QuotesBEAN->sub_product_name = $sub_product_name[$i];
                        $AOS_Products_QuotesBEAN->product_qty = $product_qty[$i];
                        $AOS_Products_QuotesBEAN->per_unit_cost = $per_unit_cost[$i];
                        $AOS_Products_QuotesBEAN->product_unit_price = $product_unit_price[$i];
                        $AOS_Products_QuotesBEAN->product_total_price = $product_total_price[$i];
                        $AOS_Products_QuotesBEAN->product_margin = $product_margin[$i];

                        // $AOS_Products_QuotesBEAN->number = $number[$i];
                        // $AOS_Products_QuotesBEAN->item_description = $item_description[$i];
                        // $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total[$i];
                        // var_dump($AOS_Products_QuotesBEAN->name);
                        // die;
                        if (!empty($AOS_Products_QuotesBEAN)){
                            // echo 'AOS_Products_QuotesBEAN';
                            // echo $i;
                            if($AOS_Products_QuotesBEAN->save()){
                                $responseArr['products'] = 'saved';
                                $productName = '';
                            }
                        }
                    // }
                }
                // // start of checking deleted records
                // $aos_products_quotesArr = array();
                // $query2 = "SELECT id FROM aos_products_quotes WHERE parent_id = '$AOS_QuotesBean->id' AND deleted='0'";
                // $aos_products_quotes = $db->query($query2);
                // while ($aos_products_quotesRows = $db->fetchByAssoc($aos_products_quotes)) {
                //     array_push($aos_products_quotesArr, $aos_products_quotesRows['id']);
                // }
                // $deleted_products = array_diff($aos_products_quotesArr,$AOS_Products_Quotes_Id);
                // $deleted_products = array_values($deleted_products);
                // // var_dump($deleted_products);
                // for ($i=0; $i <= count($deleted_products); $i++) {
                //     $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$deleted_products[$i]);
                //     $AOS_Products_QuotesBEAN->deleted='1';
                //     $AOS_Products_QuotesBEAN->save();
                // }
                // // end of checking deleted records
            } else{
                // if($is_service!='on' || $is_service!='1'){
                    if($AOS_Products_Quotes_Id ==''){
                        $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
                    }else{
                        $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_Id);
                        $productName = $AOS_Products_QuotesBEAN->name;
                    }
                    $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
                    $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
                    $AOS_Products_QuotesBEAN->number = $sn;
                    // fetch product name
                    $fetchProduct_nameQuery = "SELECT name FROM aos_products where deleted = '0' AND  id='".$product_id."'";
                    $fetchProduct_nameQueryResult = $GLOBALS['db']->query($fetchProduct_nameQuery);
                    while ($row = $GLOBALS['db']->fetchByAssoc($fetchProduct_nameQueryResult)) {
                        $productName = $row['name'];
                    }
                    $AOS_Products_QuotesBEAN->name = $productName;
                    $AOS_Products_QuotesBEAN->number = $number;
                    $AOS_Products_QuotesBEAN->product_id = $product_id;
                    $AOS_Products_QuotesBEAN->sub_products = $sub_products;
                    $AOS_Products_QuotesBEAN->product_qty = $product_qty;
                    $AOS_Products_QuotesBEAN->per_unit_cost = $per_unit_cost;
                    $AOS_Products_QuotesBEAN->product_unit_price = $product_unit_price;
                    $AOS_Products_QuotesBEAN->product_total_price = $product_total_price;
                    $AOS_Products_QuotesBEAN->product_margin = $product_margin;

                    // $AOS_Products_QuotesBEAN->number = $number[$i];
                    // $AOS_Products_QuotesBEAN->item_description = $item_description[$i];
                    // $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total[$i];
                    // var_dump($AOS_Products_QuotesBEAN->name);
                    // die;
                    if (!empty($AOS_Products_QuotesBEAN)){
                        if($AOS_Products_QuotesBEAN->save()){
                            $responseArr['products'] = 'saved';
                            $productName = '';
                        }
                    }
                // }
                // // start of checking deleted records
                // $aos_products_quotesArr = array();
                // $query2 = "SELECT id FROM aos_products_quotes WHERE parent_id = '$AOS_QuotesBean->id' AND deleted='0'";
                // $aos_products_quotes = $db->query($query2);
                // while ($aos_products_quotesRows = $db->fetchByAssoc($aos_products_quotes)) {
                //     array_push($aos_products_quotesArr, $aos_products_quotesRows['id']);
                // }
                // $deleted_products = array_diff($aos_products_quotesArr,$AOS_Products_Quotes_Id);
                // $deleted_products = array_values($deleted_products);
                // // var_dump($deleted_products);
                // for ($i=0; $i <= count($deleted_products); $i++) {
                //     $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$deleted_products[$i]);
                //     $AOS_Products_QuotesBEAN->deleted='1';
                //     $AOS_Products_QuotesBEAN->save();
                // }
                // // end of checking deleted records

            }
        }
        // if($is_service){
        //     if(is_array($product_id)){
        //         for ($i=0; $i < count($is_service); $i++) {
        //             if($is_service[$i]=='on' || $is_service[$i]=='1'){
        //                 if($AOS_Products_Quotes_Id[$i] ==''){
        //                     $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
        //                 }else{
        //                     $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_Id[$i]);
        //                 }
        //                 $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
        //                 $AOS_Products_QuotesBEAN->name = $item_description[$i];
        //                 $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
        //                 $AOS_Products_QuotesBEAN->number = $sn[$i];
        //                 $AOS_Products_QuotesBEAN->is_service = $is_service[$i];
        //                 $AOS_Products_QuotesBEAN->item_description = $item_description[$i];
        //                 $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total[$i];
        //                 if($AOS_Products_QuotesBEAN->save()){
        //                     $responseArr['services'] = 'saved';
        //                 }
        //             }
        //         }
        //     } else{
        //         if($is_service=='on' || $is_service[$i]=='1'){
        //             if($AOS_Products_Quotes_Id ==''){
        //                 $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
        //             }else{
        //                 $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_Id);
        //             }
        //             $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
        //             $AOS_Products_QuotesBEAN->name = $item_description;
        //             $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
        //             $AOS_Products_QuotesBEAN->number = $sn;
        //             $AOS_Products_QuotesBEAN->is_service = $is_service;
        //             $AOS_Products_QuotesBEAN->item_description = $item_description;
        //             $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total;
        //             if($AOS_Products_QuotesBEAN->save()){
        //                 $responseArr['services'] = 'saved';
        //             }
        //         }
        //     }
        // }
        // service line items
        if($item_description){
            if(is_array($item_description)){
                for ($i=0; $i < count($item_description); $i++){
                    if($is_service[$i]=='on' || $is_service[$i] == '1'){
                        if($is_service[$i]=='on' || $is_service[$i] == '1'){
                            $is_service[$i]='1';
                        } else{
                            $is_service[$i] = '0';
                        }
                        if($AOS_Products_Quotes_service_Id[$i] == ''){
                            $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
                        }else{
                            $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_service_Id[$i]);
                        }
                        $AOS_Products_QuotesBEAN->name = $AOS_Products_Quotes_service_name[$i];
                        // $AOS_Products_QuotesBEAN->name = $item_description[$i];
                        $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
                        $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
                        $AOS_Products_QuotesBEAN->number = $number[$i];
                        $AOS_Products_QuotesBEAN->is_service = $is_service[$i];
                        $AOS_Products_QuotesBEAN->item_description = $item_description[$i];
                        $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total[$i];
                        $AOS_Products_QuotesBEAN->product_total_price = $tc_service_total[$i];
                        if($AOS_Products_QuotesBEAN->save()){
                            $responseArr['services'] = 'saved';
                        }   
                        // $AOS_Products_QuotesBEAN->id;
                    }
                }
            } else{
                if($is_service=='on' || $is_service=='1'){
                    if($AOS_Products_Quotes_service_Id ==''){
                        $AOS_Products_QuotesBEAN = BeanFactory::newBean('AOS_Products_Quotes');
                    }else{
                        $AOS_Products_QuotesBEAN = BeanFactory::getBean('AOS_Products_Quotes',$AOS_Products_Quotes_service_Id);
                    }
                    $AOS_Products_QuotesBEAN->parent_id = $AOS_QuotesBean->id;
                    $AOS_Products_QuotesBEAN->name = $AOS_Products_Quotes_service_name;
                    // $AOS_Products_QuotesBEAN->name = $item_description;
                    $AOS_Products_QuotesBEAN->parent_type = 'AOS_Quotes';
                    // $AOS_Products_QuotesBEAN->number = $sn;
                    $AOS_Products_QuotesBEAN->number = $number;
                    $AOS_Products_QuotesBEAN->is_service = $is_service;
                    $AOS_Products_QuotesBEAN->item_description = $item_description;
                    $AOS_Products_QuotesBEAN->tc_service_total = $tc_service_total;
                    $AOS_Products_QuotesBEAN->product_total_price = $tc_service_total;
                    if($AOS_Products_QuotesBEAN->save()){
                        $responseArr['services'] = 'saved';
                    }
                }
                // var_dump($AOS_Products_QuotesBEAN->id);
            }
        }
        $responseArr['status'] = '200';
        $responseArr['record_id'] = $AOS_QuotesBean->id;
        // header("Location: /index.php?module=AOS_Quotes&action=DetailView&record=".$AOS_QuotesBean->id);
        echo json_encode($responseArr);
    } else{
        echo 'quote not saved';
    }
        // $sql1 = "INSERT INTO  aos_products_quotes(product_total, service_total, grand_total, total_product_cost_to_company, product_price_after_tax, product_margin, service_margin, total_margin , product_id, product_name, sub_products, product_qty, per_unit_cost, product_line_margin, per_unit_price, product_line_total, currency_id, currency_rate, convert_currency, service_id, service_description, service_line_total, name, quote_stage, valid_until, invoice_status, assigned_user_id, payment_term, approval_status, approval_issue, realted_company, client, sale, rfq_ref, prev_quote_no, payment, po_to_v, status, condition_c, user_id, medium, referencenumber, yourreferencenumber, pdftext, ourfirm) 
        //          VALUES ('$product_total', '$service_total',' $grand_total', '$total_product_cost_to_company', '$product_price_after_tax', '$product_margin', '$service_margin', '$total_margin', '$sn', '$productNames','$subProducts', '$quantities', '$unitCosts', '$margins', '$listPrices', '$totalPrices', '$currency_type', '$currency_rate', '$convert_currency', '$ssn', '$service_name', '$service_line_price',  '$name', '$quote_stage', '$valid_until', '$invoice_status', '$assigned_user_id', '$payment_term', '$approval_status', '$approval_issue', '$realted_company', '$client', '$sale', '$rfq_ref', '$prev_quote_no', '$payment', '$po_to_v', '$status', '$condition_c', '$user_id', '$medium', '$referencenumber', '$yourreferencenumber', '$pdftext', '$ourfirm')";
        //         $result1 = mysqli_query($conn, $sql1);

        // $sql2 = "INSERT INTO  aos_quotes(product_tax_type, product_tax_value, product_tax_amt, product_price_after_pra_gst, product_wht_value, product_wht_custom, product_price_after_wht, service_tax_type, service_tax_value, service_tax_amt, service_price_after_pra_gst, service_wht_value, service_wht_custom, service_price_after_wht) 
        //          VALUES ('$productTaxType', '$productTaxPercentage','$productTaxAmount', '$productPriceAfterTax', '$productWhtAmount', '$productWhtCustom', '$productPriceAfterWht', '$serviceTaxType', '$serviceTaxPercentage', '$serviceTaxAmount', '$servicePriceAfterTax', '$serviceWhtAmount', '$serviceWhtCustom', '$servicePriceAfterWht')";
        //         $result2 = mysqli_query($conn, $sql2);

        // if ($result1 && $result2) {
        //     $response = array('success' => true, 'message' => 'Data saved successfully!');
        //     echo json_encode($response);
        // } else {
        //     $response = array('success' => false, 'message' => 'Error saving data: ' . mysqli_error($conn));
        //     echo json_encode($response);
        // }

//end of total

?>
