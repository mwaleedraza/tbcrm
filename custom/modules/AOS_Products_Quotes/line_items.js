/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

$(document).ready(function () {
  

  $.getScript('custom/modules/AOS_Products_Quotes/app-assets/vendors/js/forms/select/select2.full.min.js');
  
  // Redirecting to ListView;
  document.querySelectorAll('#SAVE').forEach(item => {
    item.addEventListener('click', event => {
      //handle click
      if (moduleName == 'AOS_Quotes') {

        setTimeout(function () { window.location.href = "index.php?module=AOS_Quotes&action=ListView"; }, 400);
      }
      else if (moduleName == 'AOS_Invoices') {
        setTimeout(function () { window.location.href = "index.php?module=AOS_Invoices&action=ListView"; }, 400);
      }
    });
  });

  //Validating profit margin value
  // $("#ourcost_profit_margin").on("blur", function () {
  //   var profitVal = $(this).val();
  //   if (!(profitVal > 0 && profitVal < 100)) {
  //     alert('Enter profit margin between 0 and 100');
  //   }
  //   else {
  //     $('.per_unit_cost').focus();
  //     $('.per_unit_cost').blur();
  //   }
  // });

  // displaying currency options
  $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
  $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().hide();
  $('div[data-label = "LBL_CONVERT_CURRENCY"]').parent().hide();
    getCurrencyDetails();
    
    $("#currency_id_select").on("change", function () {
      getCurrencyDetails();
      $('.per_unit_cost').focus();
      $('.per_unit_cost').blur();
    });
  
  $('#currency_rate').val(getCurrencyRate);
  $('#curr_rate_ref_link').val(getCurrencyLink);
  $('#convert_currency').change(function () {
  
  $('.per_unit_cost').focus();
  $('.per_unit_cost').blur();
});
});

function getCurrencyDetails(){
  var currency = $("#currency_id_select").find(':selected').text();
  if (currency == 'US Dollars : $' || currency == 'US Dollar : $' || currency == 'Great Britain Ponds : £' || currency == 'Pounds : £' || currency == 'Euro : €') {
      $('div[data-label = "LBL_CURRENCY_RATE"]').parent().show();
    $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().show();
    $('div[data-label = "LBL_CONVERT_CURRENCY"]').parent().show();
    $('#convertCurrencyDiv').css('display', 'inline-block');
  }
  else {
      $('div[data-label = "LBL_CURRENCY_RATE"]').parent().hide();
      $('div[data-label = "LBL_CURR_RATE_REF_LINK"]').parent().hide();
      $('div[data-label = "LBL_CONVERT_CURRENCY"]').parent().hide();
    $('#convertCurrencyDiv').css('display', 'none');
      $('#currency_rate').val('');
      $('#curr_rate_ref_link').val('');
  }

  //line_item table overflow control
  $("div[field=line_items]").css({ "overflow-x": "auto" });
}

var lineno;
var prodln = 0;
var servln = 0;
var groupn = 0;
var group_ids = {};

// to update marginInPKR field
$("#currency_rate").blur(function () {
  $('.per_unit_cost').focus();
  $('.per_unit_cost').blur();
});
// $('#convert_currency').on("change", function () {
//   
//   $('.per_unit_cost').focus();
//   $('.per_unit_cost').blur();
// });

// $("#product_per_unit_cost" + prodln).on('change', function () {
//   var newPerUnitCost = $(this).val();
//   $('#product_base_cost' + prodln).val(newPerUnitCost);
//   
// });

/**
 * Load Line Items
 */

function insertLineItems(product,group){

  var type = 'product_';
  var ln = 0;
  var current_group = 'lineItems';
  var gid = product.group_id;

  if(typeof group_ids[gid] === 'undefined'){
    current_group = insertGroup();
    group_ids[gid] = current_group;
    for(var g in group){
      if(document.getElementById('group'+current_group + g) !== null){
        document.getElementById('group'+current_group + g).value = group[g];
      }
    }
  } else {
    current_group = group_ids[gid];
  }

  if(product.product_id != '0' && product.product_id !== ''){
    ln = insertProductLine('product_group'+current_group,current_group);
    type = 'product_';
  } else {
    ln = insertServiceLine('service_group'+current_group,current_group);
    type = 'service_';
  }

  for(var p in product){
    if(document.getElementById(type + p + ln) !== null){
      if (product[p] !== '' && isNumeric(product[p]) && p !== 'vat' && p !== 'product_id' && p !== 'name' && p !== "part_number" && p !== "description" && p !== "item_description") {
        document.getElementById(type + p + ln).value = format2Number(product[p]);
      } else {
        document.getElementById(type + p + ln).value = product[p];
      }
    }
  }

  calculateLine(ln,type);

}


/**
 * Insert product line
 */

function insertProductLine(tableid, groupid) {

  if(!enable_groups){
    tableid = "product_group0";
  }

  if (document.getElementById(tableid + '_head') !== null) {
    document.getElementById(tableid + '_head').style.display = "";
  }

  var vat_hidden = document.getElementById("vathidden").value;
  var discount_hidden = document.getElementById("discounthidden").value;
  var tax_type_hidden = document.getElementById("taxTypeHidden").value;
  var gst_dropdown = document.getElementById("gstDropdown").value;
  var pra_dropdown = document.getElementById("praDropdown").value;
  var wht_dropdown = document.getElementById("whtDropdown").value;

  // sqs_objects["product_name[" + prodln + "]"] = {
  //   "form": "EditView",
  //   "method": "query",
  //   "modules": ["AOS_Products"],
  //   "group": "or",
  //   "field_list": ["name", "id", "cost", "price", "description", "currency_id"],
  //   "populate_list": ["product_name[" + prodln + "]", "product_product_id[" + prodln + "]", "product_product_cost_price[" + prodln + "]", "product_product_list_price[" + prodln + "]", "product_item_description[" + prodln + "]", "product_currency[" + prodln + "]"],
  //   "required_list": ["product_id[" + prodln + "]"],
  //   "conditions": [{
  //     "name": "name",
  //     "op": "like_custom",
  //     "end": "%",
  //     "value": ""
  //   }],
  //   "order": "name",
  //   "limit": "30",
  //   "post_onblur_function": "formatListPrice(" + prodln + ");",
  //   "no_match_text": "No Match"
  // };
  // sqs_objects["product_part_number[" + prodln + "]"] = {
  //   "form": "EditView",
  //   "method": "query",
  //   "modules": ["AOS_Products"],
  //   "group": "or",
  //   "field_list": ["part_number", "name", "id","cost", "price","description","currency_id"],
  //   "populate_list": ["product_part_number[" + prodln + "]", "product_name[" + prodln + "]", "product_product_id[" + prodln + "]",  "product_product_cost_price[" + prodln + "]", "product_product_list_price[" + prodln + "]", "product_item_description[" + prodln + "]", "product_currency[" + prodln + "]"],
  //   "required_list": ["product_id[" + prodln + "]"],
  //   "conditions": [{
  //     "name": "part_number",
  //     "op": "like_custom",
  //     "end": "%",
  //     "value": ""
  //   }],
  //   "order": "name",
  //   "limit": "30",
  //   "post_onblur_function": "formatListPrice(" + prodln + ");",
  //   "no_match_text": "No Match"
  // };

  tablebody = document.createElement("tbody");
  tablebody.style = 'margin-top: 20px;';
  tablebody.id = "product_body" + prodln;
  document.getElementById(tableid).appendChild(tablebody);


  var x = tablebody.insertRow(-1);  
  x.id = 'product_line' + prodln;

  var a = x.insertCell(0);
  a.innerHTML = "<input type='text' name='product_product_qty[" + prodln + "]' id='product_product_qty" + prodln + "'  value='' title='' tabindex='116' onblur='Quantity_format2Number(" + prodln + ");calculateLine(" + prodln + ",\"product_\");' class='product_qty'>";

  var b = x.insertCell(1);
  // b.innerHTML = "<input class='sqsEnabled product_name' autocomplete='off' type='text' name='product_name[" + prodln + "]' id='product_name" + prodln + "' maxlength='50' value='' title='' tabindex='116' value=''><input type='hidden' name='product_product_id[" + prodln + "]' id='product_product_id" + prodln + "'  maxlength='50' value=''>";
  b.innerHTML = "<select style='width: 150px;' onchange='setProductValue(" + prodln + ");subProductDD(" + prodln + ")' class='product_name'  name='product_name[" + prodln + "]' id='product_name" + prodln + "'></select><input type='hidden' name='product_product_id[" + prodln + "]' id='product_product_id" + prodln + "'  maxlength='50' value=''>";

  getProductOption(prodln);

  var q = x.insertCell(2);
  q.style.padding = "0px 5px";
  q.innerHTML = "<select tabindex='116' onchange='sub_SubProductDD(" + prodln + "); saveSubProductName("+prodln+");' id='product_sub_products" + prodln + "' name='product_sub_products[" + prodln + "]' style='margin-right:5px;width:180px' class='sub_products'></select><input type='hidden' id='product_sub_product_name"+prodln +"' name='product_sub_product_name["+prodln +"]' maxlength='50' value=''>";
  $('.sub_products').select2();

  var r = x.insertCell(3);
  r.style.padding = "0px 5px";
  r.innerHTML = "<select tabindex='116' onchange=' saveSub_SubProductName("+prodln+");' id='product_sub_sub_products" + prodln + "' name='product_sub_sub_products[" + prodln + "]' style='margin-right:5px;width:180px' class='sub_sub_products'></select><input type='hidden' id='product_sub_sub_product_name"+prodln +"' name='product_sub_sub_product_name["+prodln +"]' maxlength='50' value=''>";
  $('.sub_sub_products').select2();


  var b1 = x.insertCell(4);
  // b1.innerHTML = "<input class='sqsEnabled product_part_number' autocomplete='off' type='text' name='product_part_number[" + prodln + "]' id='product_part_number" + prodln + "' maxlength='50' value='' title='' tabindex='116' value=''>";

  var b2 = x.insertCell(5);
  // b2.innerHTML = "<button title='" + SUGAR.language.get('app_strings', 'LBL_SELECT_BUTTON_TITLE') + "' accessKey='" + SUGAR.language.get('app_strings', 'LBL_SELECT_BUTTON_KEY') + "' type='button' tabindex='116' class='button product_part_number_button' value='" + SUGAR.language.get('app_strings', 'LBL_SELECT_BUTTON_LABEL') + "' name='btn1' onclick='openProductPopup(" + prodln + ");'><span class=\"suitepicon suitepicon-action-select\"></span></button>";
  //aizaz hasan work here moving fields after sub product down
  var z = tablebody.insertRow(-1);
  var per_unit = z.insertCell(0);
  // per_unit.style = "padding:20px 5px 0px 5px";
  per_unit.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_per_unit_cost_label'>Unit Cost</span><br>";
  per_unit.innerHTML += "<input style='width: 80px;' type='text' name='product_per_unit_cost[" + prodln + "]' id='product_per_unit_cost" + prodln + "' maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' oninput='setBaseCost(" + prodln + ",\"product_\")' class='per_unit_cost'>";
  per_unit.innerHTML += "<input type='text' name='product_base_cost[" + prodln + "]' id='product_base_cost" + prodln + "' maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' class='base_cost' hidden>";
  per_unit.style.padding = "0px 5px";

  if (typeof currencyFields !== 'undefined') {
    currencyFields.push("product_per_unit_cost" + prodln);
  }

  var prod_margin = z.insertCell(1);
  prod_margin.style.padding = "0px 5px";
  prod_margin.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_product_margin_label'>Margin (%)</span><br>";
  prod_margin.innerHTML += "<input style='width: 80px;' type='text' name='product_product_margin[" + prodln + "]' id='product_product_margin" + prodln + "' maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_product_margin'>";
  prod_margin.style.padding = "0px 5px";


  var c = z.insertCell(2);
  c.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_wht_amt_label'>Unit Price</span><br>";
  c.innerHTML += "<input type='text' name='product_product_list_price[" + prodln + "]' id='product_product_list_price" + prodln + "' maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_list_price' readonly><input type='hidden' name='product_product_cost_price[" + prodln + "]' id='product_product_cost_price" + prodln + "' value=''  />";
  c.style.padding = "0px 5px";

  if (typeof currencyFields !== 'undefined'){

    currencyFields.push("product_product_list_price" + prodln);
    currencyFields.push("product_product_cost_price" + prodln);

  }

  var d = z.insertCell(3);
  d.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_wht_amt_label'>Discount</span><br>";
  d.innerHTML += "<input type='text' name='product_product_discount[" + prodln + "]' id='product_product_discount" + prodln + "'  maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_discount_text'><input type='hidden' name='product_product_discount_amount[" + prodln + "]' id='product_product_discount_amount" + prodln + "' value=''  />";
  d.innerHTML += "<select tabindex='116' name='product_discount[" + prodln + "]' id='product_discount" + prodln + "' onchange='calculateLine(" + prodln + ",\"product_\");' class='product_discount_amount_select'>" + discount_hidden + "</select>";
  d.style.padding = "0px 5px";

  var e = z.insertCell(4);
  e.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_wht_amt_label'>Total Price</span><br>";
  e.innerHTML += "<input type='text' name='product_product_total_price[" + prodln + "]' id='product_product_total_price_tax_excl" + prodln + "' maxlength='50' value='' title='' tabindex='116' readonly='readonly' onblur='calculateLine(" + prodln + ",\"product_\");' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_total_price' >";
  e.style.padding = "0px 5px";

  var f = z.insertCell(5);
  f.innerHTML += "<input type='text' name='product_product_unit_price[" + prodln + "]' id='product_product_unit_price" + prodln + "' maxlength='50' value='' title='' tabindex='116' readonly='readonly' onblur='calculateLine(" + prodln + ",\"product_\");' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_unit_price' hidden>";

  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("product_product_unit_price" + prodln);
  }
  //end
  var x1 = tablebody.insertRow(-1);
  x1.id = 'product_line_wht' + prodln;

  var f = x1.insertCell(0);
  f.style = "padding:20px 5px 0px 5px";
  f.innerHTML = "<span style='vertical-align: top;margin-top: 10px' class='product_wht_amt_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_VAT_AMT') +"</span><br>";
  f.innerHTML += "<select type='text' style='width:100px;' name='product_wht_amt[" + prodln + "]' id='product_wht_amt" + prodln + "' maxlength='250' value='' title='' class='product_wht_amt_text' onchange='calculateLine(" + prodln + ",\"product_\");'>" + wht_dropdown + "</select>";

  if (typeof currencyFields !== 'undefined') {
    currencyFields.push("product_vat_amt" + prodln);
  }

  var p = x1.insertCell(1);
  p.style = "padding:20px 5px 0px 5px";
  p.innerHTML = "<span style='vertical-align: top;' class='product_wht_custom_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_WHT_CUSTOM') +"</span><br>";
  p.innerHTML += "<input tabindex='116' style='width:100px' name='product_wht_custom[" + prodln + "]' id='product_wht_custom" + prodln + "' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_wht_custom' placeholder='Custom WHT'>";

  var x2 = tablebody.insertRow(-1);
  x2.id = 'product_line_taxation' + prodln;

  var k = x2.insertCell(0);
  k.style = "padding:20px 5px 0px 5px";
  k.innerHTML = "<span style='vertical-align: top;' class='product_product_tax_type_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_TAX_TYPE') +"</span><br>";
  // k.innerHTML = "<input type='text' name='product_tax_type[" + prodln + "]' id='product_tax_type" + prodln + "'  maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + prodln + ",\"product_\");' onblur='calculateLine(" + prodln + ",\"product_\");' class='product_tax_type'><input type='hidden' name='product_product_tax_type[" + prodln + "]' id='product_product_tax_type" + prodln + "' value=''  />";
  k.innerHTML += "<select onchange='setTaxType(" + prodln + "); calculateLine(" + prodln + ", \"product_\");' tabindex='116' name='product_product_tax_type[" + prodln + "]' id='product_tax_type" + prodln + "' class='product_tax_type_select'>" + tax_type_hidden + "</select>";


  var l = x2.insertCell(1);
  l.style = "padding:20px 5px 0px 5px";
  l.innerHTML = "<span style='vertical-align: top;' class='product_gst_percentage_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_GST_PERCENTAGE') +"</span><br>";
  l.innerHTML += "<select style='display:none;width:100px' type='text' name='product_gst_percentage[" + prodln + "]'  id='product_gst_percentage" + prodln + "' '>" + gst_dropdown + "</select>"

  var o = x2.insertCell(2);
  o.style = "padding:20px 5px 0px 5px";
  o.innerHTML = "<span style='vertical-align: top;' class='product_gst_custom_percentage_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_GST_CUSTOM_PERCENTAGE') +"</span><br>";
  o.innerHTML += "<input style='display:none;width:100px;' onblur='calculateLine(" + prodln + ",\"product_\");' onblur='calculateLine(" + prodln + ",\"product_\");' type='number'  min='1' max='100' name='product_gst_custom_percentage[" + prodln + "]' id='product_gst_custom_percentage" + prodln + "' placeholder='Custom GST'>"

  var m = x2.insertCell(3);
  m.style = "padding:20px 5px 0px 5px";
  m.innerHTML = "<span style='vertical-align: top;' class='product_pra_percentage_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_PRA_PERCENTAGE') +"</span><br>";
  m.innerHTML += "<select style='display:none;width:100px;' type='text' name='product_pra_percentage[" + prodln + "]' id='product_pra_percentage" + prodln + "' >" + pra_dropdown + "</select>";

  
  var n = x2.insertCell(4);
  n.style = "padding:20px 5px 0px 5px";
  n.innerHTML = "<span span style='vertical-align: top;' class='product_pra_custom_percentage_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_PRA_CUSTOM_PERCENTAGE') +"</span><br>";
  n.innerHTML += "<input  style='display:none;width:100px;' onblur='calculateLine(" + prodln + ",\"product_\");' type='number' min='1' max='100' name='product_pra_custom_percentage[" + prodln + "]' id='product_pra_custom_percentage" + prodln + "' placeholder='Custom PRA'>"


  var x3 = tablebody.insertRow(-1);
  x3.id = 'product_line_total' + prodln;

  var g = x3.insertCell(0);
  g.style = "padding:20px 5px 0px 5px";
  g.innerHTML = "<span style='vertical-align: top;' class='product_total_price_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_TOTAL_PRICE') +"</span><br>";
  g.innerHTML += "<input type='text' style='width:100px;' name='product_product_total_price[" + prodln + "]' id='product_product_total_price" + prodln + "' maxlength='50' value='' title='' tabindex='116' readonly='readonly' class='product_total_price'><input type='hidden' name='product_group_number[" + prodln + "]' id='product_group_number" + prodln + "' value='" + groupid + "'>";

  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("product_product_total_price" + prodln);
  }

  var p2 = x3.insertCell(1);
  p2.style = 'padding: 20px 5px 0px 5px;';
  p2.innerHTML = "<span style='vertical-align: top;' class='product_vat_amt_label'>WHT Tax</span><br>";
  p2.innerHTML += "<input style='width:100px;' type='text' name='product_vat_amt[" + prodln + "]' id='product_vat_amt" + prodln + "' maxlength='250' value='' title='' tabindex='116' readonly='readonly' class='product_vat_amt'>";

  // var p3 = x3.insertCell(2);
  // p3.style = "padding:20px 5px 0px 5px";
  // p3.innerHTML = "<span style='vertical-align: top;' class='product_product_price_after_tax'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_PRICE_AFTER_TAX') +"</span><br>";
  // p3.innerHTML += "<input style='width:100px;' type='text' name='product_product_price_after_tax[" + prodln + "]' id='product_product_price_after_tax" + prodln + "' maxlength='250' value='' title='' tabindex='116' readonly='readonly' class='product_price_after_tax'>";

  var p4 = x3.insertCell(2);
  p4.style = "padding:20px 5px 0px 5px";
  p4.innerHTML = "<span style='vertical-align: top;' class='product_profit_margin_label'>"+ SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_PROFIT_MARGIN') +"</span><br>";
  p4.innerHTML += "<input style='width:100px;' type='text' name='product_product_profit_margin[" + prodln + "]' id='product_product_profit_margin" + prodln + "' maxlength='250' value='' title='' tabindex='116' readonly='readonly' class='product_profit_margin'>";

  var p5 = x3.insertCell(3);
  p5.style = "padding:20px 5px 0px 5px";
  p5.innerHTML = "<span style='vertical-align: top;' class='product_gst_label'>GST</span><br>";
  p5.innerHTML += "<input style='width:100px;' type='text' name='product_product_gst[" + prodln + "]' id='product_product_gst" + prodln + "' maxlength='250' value='' title='' tabindex='116' readonly='readonly' class='product_profit_gst'>";

  var h = x.insertCell(4);
  h.innerHTML = "<input type='hidden' name='product_currency[" + prodln + "]' id='product_currency" + prodln + "' value=''><input type='hidden' name='product_deleted[" + prodln + "]' id='product_deleted" + prodln + "' value='0'><input type='hidden' name='product_id[" + prodln + "]' id='product_id" + prodln + "' value=''><button type='button' id='product_delete_line" + prodln + "' class='button product_delete_line' value='" + SUGAR.language.get(module_sugar_grp1, 'LBL_REMOVE_PRODUCT_LINE') + "' tabindex='116' onclick='markLineDeleted(" + prodln + ",\"product_\")'><span class=\"suitepicon suitepicon-action-clear\"></span></button><br>";


  enableQS(true);
  //QSFieldsArray["EditView_product_name"+prodln].forceSelection = true;

  var y = tablebody.insertRow(-1);
  y.id = 'product_note_line' + prodln;

  var h1 = y.insertCell(0);
  h1.colSpan = "5";
  h1.style.color = "rgb(68,68,68)";
  h1.innerHTML = "<span style='vertical-align: top;' class='product_item_description_label'>" + SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_DESCRIPTION') + " :&nbsp;&nbsp;</span>";
  h1.innerHTML += "<textarea tabindex='116' name='product_item_description[" + prodln + "]' id='product_item_description" + prodln + "' rows='2' cols='23' class='product_item_description'></textarea>&nbsp;&nbsp;";

  var i = y.insertCell(1);
  i.colSpan = "5";
  i.style.color = "rgb(68,68,68)";
  i.innerHTML = "<span style='vertical-align: top;' class='product_description_label'>"  + SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_NOTE') + " :&nbsp;</span>";
  i.innerHTML += "<textarea tabindex='116' name='product_description[" + prodln + "]' id='product_description" + prodln + "' rows='2' cols='23' class='product_description'></textarea>&nbsp;&nbsp;"

  addToValidate('EditView','product_product_id'+prodln,'id',true,"Please choose a product");

  addAlignedLabels(prodln, 'product');

  prodln++;

  return prodln - 1;
}

var addAlignedLabels = function(ln, type) {
  if(typeof type == 'undefined') {
    type = 'product';
  }
  if(type != 'product' && type != 'service') {
    console.error('type could be "product" or "service" only');
  }
  var labels = [];
  $('tr#'+type+'_head td').each(function(i,e){
    if(type=='product' && $(e).attr('colspan')>1) {
      for(var i=0; i<parseInt($(e).attr('colspan')); i++) {
        if(i==0) {
          labels.push($(e).html());
        } else {
          labels.push('');
        }
      }
    } else {
      labels.push($(e).html());
    }
  });
  $('tr#'+type+'_line'+ln+' td').each(function(i,e){
    $(e).prepend('<span class="alignedLabel">'+labels[i]+'</span>');
  });
}


/**
 * Open product popup
 */
function openProductPopup(ln){

  lineno=ln;
  var popupRequestData = {
    "call_back_function" : "setProductReturn",
    "form_name" : "EditView",
    "field_to_name_array" : {
      "id" : "product_product_id" + ln,
      "name" : "product_name" + ln,
      "description" : "product_item_description" + ln,
      // "part_number" : "product_part_number" + ln,
      "cost" : "product_product_cost_price" + ln,
      "price" : "product_product_list_price" + ln,
      "currency_id" : "product_currency" + ln
    }
  };

  open_popup('AOS_Products', 800, 850, '', true, true, popupRequestData);

}

function setProductReturn(popupReplyData){
  set_return(popupReplyData);
  formatListPrice(lineno);
}

function formatListPrice(ln){

  if (typeof currencyFields !== 'undefined'){
    var product_currency_id = document.getElementById('product_currency' + ln).value;
    product_currency_id = product_currency_id ? product_currency_id : -99;//Assume base currency if no id
    var product_currency_rate = get_rate(product_currency_id);
    var dollar_product_price = ConvertToDollar(document.getElementById('product_product_list_price' + ln).value, product_currency_rate);
    document.getElementById('product_product_list_price' + ln).value = format2Number(ConvertFromDollar(dollar_product_price, lastRate));
    var dollar_product_cost = ConvertToDollar(document.getElementById('product_product_cost_price' + ln).value, product_currency_rate);
    document.getElementById('product_product_cost_price' + ln).value = format2Number(ConvertFromDollar(dollar_product_cost, lastRate));
  }
  else
  {
    document.getElementById('product_product_list_price' + ln).value = format2Number(document.getElementById('product_product_list_price' + ln).value);
    document.getElementById('product_product_cost_price' + ln).value = format2Number(document.getElementById('product_product_cost_price' + ln).value);
  }

  calculateLine(ln,"product_");
}


/**
 * Insert Service Line
*/

function insertServiceLine(tableid, groupid) {

  var pra_dropdown = document.getElementById("praDropdown").value;
  var wht_dropdown = document.getElementById("whtDropdown").value;

  if(!enable_groups){
    tableid = "service_group0";
  }
  if (document.getElementById(tableid + '_head') !== null) {
    document.getElementById(tableid + '_head').style.display = "";
  }

  var vat_hidden = document.getElementById("vathidden").value;
  var discount_hidden = document.getElementById("discounthidden").value;

  tablebody = document.createElement("tbody");
  tablebody.id = "service_body" + servln;
  document.getElementById(tableid).appendChild(tablebody);

  var x = tablebody.insertRow(-1);
  x.id = 'service_line' + servln;

  var a = x.insertCell(0);
  a.colSpan = "4";
  a.innerHTML = "<textarea name='service_name[" + servln + "]' id='service_name" + servln + "'  cols='64' title='' tabindex='116' class='service_name'></textarea><input type='hidden' name='service_product_id[" + servln + "]' id='service_product_id" + servln + "'  maxlength='50' value='0'>";

  var a1 = x.insertCell(1);
  a1.innerHTML = "<input type='text' name='service_product_list_price[" + servln + "]' id='service_product_list_price" + servln + "' maxlength='50' value='' title='' tabindex='116'   onblur='calculateLine(" + servln + ",\"service_\");' class='service_list_price'>";

  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("service_product_list_price" + servln);
  }

  var a2 = x.insertCell(2);
  a2.innerHTML = "<input type='text' name='service_product_discount[" + servln + "]' id='service_product_discount" + servln + "'  maxlength='50' value='' title='' tabindex='116' onblur='calculateLine(" + servln + ",\"service_\");' onblur='calculateLine(" + servln + ",\"service_\");' class='service_discount_text'><input type='hidden' name='service_product_discount_amount[" + servln + "]' id='service_product_discount_amount" + servln + "' value=''/>";
  a2.innerHTML += "<select tabindex='116' name='service_discount[" + servln + "]' id='service_discount" + servln + "' onchange='calculateLine(" + servln + ",\"service_\");' class='service_discount_select'>" + discount_hidden + "</select>";

  var b = x.insertCell(3);
  b.innerHTML = "<input type='text' name='service_product_unit_price[" + servln + "]' id='service_product_unit_price" + servln + "' maxlength='50' value='' title='' tabindex='116'   onblur='calculateLine(" + servln + ",\"service_\");' class='service_unit_price' hidden>";

  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("service_product_unit_price" + servln);
  }
  var g = x.insertCell(4);
  g.innerHTML = "<select style='width:100px;' type='text' name='service_pra_percentage[" + servln + "]' id='service_pra_percentage" + servln + "' >" + pra_dropdown + "</select>";

  var f = x.insertCell(5);
  f.innerHTML = "<input  style='width:100px;position: relative;float: right;margin-left: 5px;margin-right: 8px;margin-top: 0px;' onblur='calculateLine(" + servln + ",\"service_\");' type='number' min='1' max='100' name='service_pra_custom_percentage[" + servln + "]' id='service_pra_custom_percentage" + servln + "' placeholder='Custom PRA'>"


  var c = x.insertCell(6);
  c.innerHTML = "<input type='text' name='service_vat_amt[" + servln + "]' id='service_vat_amt" + servln + "' maxlength='250' value='' title='' tabindex='116' readonly='readonly' class='service_vat_text'>";
  c.innerHTML += "<select name='service_service_wht_amt[" + servln + "]' id='service_service_wht_amt" + servln + "' maxlength='250' tabindex='116' class='service_service_wht_amt_text'>" + wht_dropdown + "</select>";
  // c.innerHTML += "<select tabindex='116' name='service_vat[" + servln + "]' id='service_vat" + servln + "' onchange='calculateLine(" + servln + ",\"service_\");' class='service_vat_select'>" + vat_hidden + "</select>";
  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("service_vat_amt" + servln);
  }

  var g = x.insertCell(7);
  g.innerHTML = "<input tabindex='116' style='width: 100px; ' name='service_service_wht_custom[" + servln + "]' id='service_service_wht_custom" + servln + "' onblur='calculateLine(" + servln + ", \"service_\");' class='service_service_wht_custom' placeholder='Custom WHT'>";

  var e = x.insertCell(8);
  e.innerHTML = "<input type='text' name='service_product_total_price[" + servln + "]' id='service_product_total_price" + servln + "' maxlength='50' value='' title='' tabindex='116' readonly='readonly' class='service_total_price'><input type='hidden' name='service_group_number[" + servln + "]' id='service_group_number" + servln + "' value='"+ groupid +"'>";

  if (typeof currencyFields !== 'undefined'){
    currencyFields.push("service_product_total_price" + servln);
  }
  var f = x.insertCell(9);
  f.innerHTML = "<input type='hidden' name='service_deleted[" + servln + "]' id='service_deleted" + servln + "' value='0'><input type='hidden' name='service_id[" + servln + "]' id='service_id" + servln + "' value=''><button type='button' class='button service_delete_line' id='service_delete_line" + servln + "' value='" + SUGAR.language.get(module_sugar_grp1, 'LBL_REMOVE_PRODUCT_LINE') + "' tabindex='116' onclick='markLineDeleted(" + servln + ",\"service_\")'><span class=\"suitepicon suitepicon-action-clear\"></span></button><br>";

  addAlignedLabels(servln, 'service');

  servln++;

  return servln - 1;
}


/**
 * Insert product Header
 */

function insertProductHeader(tableid){
  tablehead = document.createElement("thead");
  tablehead.id = tableid +"_head";
  tablehead.style.display="none";
  document.getElementById(tableid).appendChild(tablehead);

  var x=tablehead.insertRow(-1);
  x.id='product_head';

  var a=x.insertCell(0);
  a.style.color="rgb(68,68,68)";
  a.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_QUANITY');

  var b=x.insertCell(1);
  b.style.color="rgb(68,68,68)";
  b.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_NAME');
  
  var q=x.insertCell(2);
  q.style.color = "rgb(68,68,68)";
  q.style.padding = "0px 5px";
  q.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_SUB_PRODUCTS');

  var r = x.insertCell(3);
  r.style.color = "rgb(68,68,68)";
  r.style.padding = "0px 5px";
  r.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_SUB_SUB_PRODUCTS');

  var b1 = x.insertCell(4);
  b1.colSpan = "2";
  b1.style.color="rgb(68,68,68)";
  // b1.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_PART_NUMBER');

  var per_unit = x.insertCell(5);
  per_unit.style.color = "rgb(68,68,68)";
  // per_unit.style.padding = "0px 10px";
  // per_unit.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PER_UNIT_COST');

  var prod_margin = x.insertCell(6);
  prod_margin.style.color = "rgb(68,68,68)";
  prod_margin.style.padding = "0px 5px";
  // prod_margin.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_MARGIN');

  var c = x.insertCell(7);
  c.style.color="rgb(68,68,68)";
  // c.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_LIST_PRICE');

  var d = x.insertCell(8);
  d.style.color="rgb(68,68,68)";
  // d.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_DISCOUNT_AMT');

  var e = x.insertCell(9);
  e.style.color="rgb(68,68,68)";
  // e.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_UNIT_PRICE');
  
  // var k = x.insertCell(10);
  // k.style.color = "rgb(68,68,68)";
  // k.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_TAX_TYPE');

  // var l = x.insertCell(11);
  // l.style.color = "rgb(68,68,68)";
  // l.style.padding = "0px 10px";
  // l.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_GST_PERCENTAGE');

  // var n = x.insertCell(12);
  // n.style.color = "rgb(68,68,68)";
  // n.style.padding = "0px 10px";
  // n.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_GST_CUSTOM_PERCENTAGE');

  // var m = x.insertCell(13);
  // m.style.color = "rgb(68,68,68)";
  // m.style.padding = "0px 10px";
  // m.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRA_PERCENTAGE');

  // var n = x.insertCell(14);
  // n.style.color = "rgb(68,68,68)";
  // n.style.padding = "0px 10px";
  // n.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRA_CUSTOM_PERCENTAGE');

  // var x1=tablehead.insertRow(-1);
  // x1.id = 'wht_head';

  // var f = x1.insertCell(0);
  // f.style.color="rgb(68,68,68)";
  // f.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_VAT_AMT');

  
  // var i = x1.insertCell(1);
  // i.style.color = "rgb(68,68,68)";
  // i.style.padding = "0px 10px";
  // i.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_WHT_CUSTOM');

  // var g = x.insertCell(10);
  // g.style.color="rgb(68,68,68)";
  // g.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_TOTAL_PRICE');

  // var p2 = x.insertCell(11);
  // p2.style.color="rgb(68,68,68)";
  // p2.style.padding="0px 5px";
  // p2.style.borderLeft="2px solid #555";
  // p2.innerHTML = 'Tax';
  
  // // var p3 = x.insertCell(19);
  // // p3.style.color="rgb(68,68,68)";
  // // p3.style.padding="0px 5px";
  // // p3.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_PRICE_AFTER_TAX');
  
  // var p4 = x.insertCell(12);
  // p4.style.color="rgb(68,68,68)";
  // p4.style.padding="0px 5px";
  // p4.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_PROFIT_MARGIN');
  
  // var p5 = x.insertCell(13);
  // p5.style.color="rgb(68,68,68)";
  // p5.style.padding="0px 5px";
  // p5.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_PRODUCT_PROFIT_MARGIN_PKR');
  

  var h = x.insertCell(10);
  h.style.color = "rgb(68,68,68)";
  h.innerHTML = '&nbsp;';
}


/**
 * Insert service Header
 */

function insertServiceHeader(tableid){
  tablehead = document.createElement("thead");
  tablehead.id = tableid +"_head";
  tablehead.style.display="none";
  document.getElementById(tableid).appendChild(tablehead);

  var x=tablehead.insertRow(-1);
  x.id='service_head';

  var a=x.insertCell(0);
  a.colSpan = "4";
  a.style.color="rgb(68,68,68)";
  a.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_NAME');

  var b=x.insertCell(1);
  b.style.color="rgb(68,68,68)";
  b.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_LIST_PRICE');

  var c=x.insertCell(2);
  c.style.color="rgb(68,68,68)";
  c.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_DISCOUNT');

  var d=x.insertCell(3);
  d.style.color="rgb(68,68,68)";
  // d.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_PRICE');

  var h = x.insertCell(4);
  h.style.color = "rgb(68,68,68)";
  h.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_PRA_PERCENTAGE');

  var g = x.insertCell(5);
  g.style.color = "rgb(68,68,68)";
  g.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_PRA_CUSTOM_PERCENTAGE');

  var e = x.insertCell(6);
  e.style.color="rgb(68,68,68)";
  e.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_VAT_AMT');

  var e = x.insertCell(7);
  e.style.color = "rgb(68,68,68)";
  e.innerHTML = SUGAR.language.get(module_sugar_grp1, 'LBL_SERVICE_WHT_CUSTOM');

  var f = x.insertCell(8);
  f.style.color="rgb(68,68,68)";
  f.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_TOTAL_PRICE');

  var g = x.insertCell(9);
  g.style.color="rgb(68,68,68)";
  g.innerHTML='&nbsp;';
}

/**
 * Insert Group
 */

function insertGroup()
{

  if(!enable_groups && groupn > 0){
    return;
  }
  var tableBody = document.createElement("tr");
  tableBody.id = "group_body"+groupn;
  tableBody.className = "group_body";
  document.getElementById('lineItems').appendChild(tableBody);

  var a=tableBody.insertCell(0);
  a.colSpan="100";
  var table = document.createElement("table");
  table.id = "group"+groupn;
  table.className = "group";

  table.style.whiteSpace = 'nowrap';

  a.appendChild(table);



  tableheader = document.createElement("thead");
  table.appendChild(tableheader);
  var header_row=tableheader.insertRow(-1);


  if(enable_groups){
    var header_cell = header_row.insertCell(0);
    header_cell.scope="row";
    header_cell.colSpan="8";
    header_cell.innerHTML=SUGAR.language.get(module_sugar_grp1, 'LBL_GROUP_NAME')+":&nbsp;&nbsp;<input name='group_name[]' id='"+ table.id +"name' maxlength='255'  title='' tabindex='120' type='text' class='group_name'><input type='hidden' name='group_id[]' id='"+ table.id +"id' value=''><input type='hidden' name='group_group_number[]' id='"+ table.id +"group_number' value='"+groupn+"'>";

    var header_cell_del = header_row.insertCell(1);
    header_cell_del.scope="row";
    header_cell_del.colSpan="2";
    header_cell_del.innerHTML="<span title='" + SUGAR.language.get(module_sugar_grp1, 'LBL_DELETE_GROUP') + "' style='float: right;'><a style='cursor: pointer;' id='deleteGroup' tabindex='116' onclick='markGroupDeleted("+groupn+")' class='delete_group'><span class=\"suitepicon suitepicon-action-clear\"></span></a></span><input type='hidden' name='group_deleted[]' id='"+ table.id +"deleted' value='0'>";
  }



  var productTableHeader = document.createElement("thead");
  table.appendChild(productTableHeader);
  var productHeader_row=productTableHeader.insertRow(-1);
  var productHeader_cell = productHeader_row.insertCell(0);
  productHeader_cell.colSpan="100";
  var productTable = document.createElement("table");
  productTable.id = "product_group"+groupn;
  productTable.className = "product_group";
  productHeader_cell.appendChild(productTable);

  insertProductHeader(productTable.id);

  var serviceTableHeader = document.createElement("thead");
  table.appendChild(serviceTableHeader);
  var serviceHeader_row=serviceTableHeader.insertRow(-1);
  var serviceHeader_cell = serviceHeader_row.insertCell(0);
  serviceHeader_cell.colSpan="100";
  var serviceTable = document.createElement("table");
  serviceTable.id = "service_group"+groupn;
  serviceTable.className = "service_group";
  serviceHeader_cell.appendChild(serviceTable);

  insertServiceHeader(serviceTable.id);


  tablefooter = document.createElement("tfoot");
  table.appendChild(tablefooter);
  var footer_row=tablefooter.insertRow(-1);
  var footer_cell = footer_row.insertCell(0);
  footer_cell.scope="row";
  footer_cell.colSpan="20";
  footer_cell.innerHTML="<input type='button' tabindex='116' class='button add_product_line' value='"+SUGAR.language.get(module_sugar_grp1, 'LBL_ADD_PRODUCT_LINE')+"' id='"+productTable.id+"addProductLine' onclick='insertProductLine(\""+productTable.id+"\",\""+groupn+"\")' />";
  footer_cell.innerHTML+=" <input type='button' tabindex='116' class='button add_service_line' value='"+SUGAR.language.get(module_sugar_grp1, 'LBL_ADD_SERVICE_LINE')+"' id='"+serviceTable.id+"addServiceLine' onclick='insertServiceLine(\""+serviceTable.id+"\",\""+groupn+"\")' />";
  if(enable_groups){
    footer_cell.innerHTML+="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_TOTAL_AMT')+":</label><input name='group_total_amt[]' id='"+ table.id +"total_amt' class='group_total_amt' maxlength='26' value='' title='' tabindex='120' type='text' readonly></span>";

    var footer_row2=tablefooter.insertRow(-1);
    var footer_cell2 = footer_row2.insertCell(0);
    footer_cell2.scope="row";
    footer_cell2.colSpan="20";
    footer_cell2.innerHTML="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_DISCOUNT_AMOUNT')+":</label><input name='group_discount_amount[]' id='"+ table.id +"discount_amount' class='group_discount_amount' maxlength='26' value='' title='' tabindex='120' type='text' readonly></label>";

    var footer_row3=tablefooter.insertRow(-1);
    var footer_cell3 = footer_row3.insertCell(0);
    footer_cell3.scope="row";
    footer_cell3.colSpan="20";
    footer_cell3.innerHTML="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_SUBTOTAL_AMOUNT')+":</label><input name='group_subtotal_amount[]' id='"+ table.id +"subtotal_amount' class='group_subtotal_amount'  maxlength='26' value='' title='' tabindex='120' type='text' readonly></span>";

    var footer_row4=tablefooter.insertRow(-1);
    var footer_cell4 = footer_row4.insertCell(0);
    footer_cell4.scope="row";
    footer_cell4.colSpan="20";
    footer_cell4.innerHTML="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_TAX_AMOUNT')+":</label><input name='group_tax_amount[]' id='"+ table.id +"tax_amount' class='group_tax_amount' maxlength='26' value='' title='' tabindex='120' type='text' readonly></span>";

    if(document.getElementById('subtotal_tax_amount') !== null){
      var footer_row5=tablefooter.insertRow(-1);
      var footer_cell5 = footer_row5.insertCell(0);
      footer_cell5.scope="row";
      footer_cell5.colSpan="20";
      footer_cell5.innerHTML="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_SUBTOTAL_TAX_AMOUNT')+":</label><input name='group_subtotal_tax_amount[]' id='"+ table.id +"subtotal_tax_amount' class='group_subtotal_tax_amount' maxlength='26' value='' title='' tabindex='120' type='text' readonly></span>";

      if (typeof currencyFields !== 'undefined'){
        currencyFields.push("" + table.id+ 'subtotal_tax_amount');
      }
    }

    var footer_row6=tablefooter.insertRow(-1);
    var footer_cell6 = footer_row6.insertCell(0);
    footer_cell6.scope="row";
    footer_cell6.colSpan="20";
    footer_cell6.innerHTML="<span class='totals'><label>"+SUGAR.language.get(module_sugar_grp1, 'LBL_GROUP_TOTAL')+":</label><input name='group_total_amount[]' id='"+ table.id +"total_amount' class='group_total_amount'  maxlength='26' value='' title='' tabindex='120' type='text' readonly></span>";

    if (typeof currencyFields !== 'undefined'){
      currencyFields.push("" + table.id+ 'total_amt');
      currencyFields.push("" + table.id+ 'discount_amount');
      currencyFields.push("" + table.id+ 'subtotal_amount');
      currencyFields.push("" + table.id+ 'tax_amount');
      currencyFields.push("" + table.id+ 'total_amount');
    }
  }
  groupn++;
  return groupn -1;
}

/**
 * Mark Group Deleted
 */

function markGroupDeleted(gn)
{
  document.getElementById('group_body' + gn).style.display = 'none';

  var rows = document.getElementById('group_body' + gn).getElementsByTagName('tbody');

  for (x=0; x < rows.length; x++) {
    var input = rows[x].getElementsByTagName('button');
    for (y=0; y < input.length; y++) {
      if (input[y].id.indexOf('delete_line') != -1) {
        input[y].click();
      }
    }
  }
}

/**
 * Mark line deleted
 */

function markLineDeleted(ln, key)
{
  // collapse line; update deleted value
  document.getElementById(key + 'body' + ln).style.display = 'none';
  document.getElementById(key + 'deleted' + ln).value = '1';
  document.getElementById(key + 'delete_line' + ln).onclick = '';
  var groupid = 'group' + document.getElementById(key + 'group_number' + ln).value;

  if(checkValidate('EditView',key+'product_id' +ln)){
    removeFromValidate('EditView',key+'product_id' +ln);
  }

  calculateTotal(groupid);
  calculateTotal();
}


/**
 * Calculate Line Values
 */

function setBaseCost(ln, key) {
  var setCost = $("#" + key + "per_unit_cost" + ln).val();
  $("#" + key + "base_cost" + ln).val(setCost);
}

function calculateLine(ln, key) {
  if (key == 'service_') {
    $("#" + key + "pra_percentage" + ln).val('5');
    $("#" + key + "service_wht_amt" + ln).val('3');
  }


  
  //Currency Calculation
  var conversionRateCheck = $('#convert_currency').is(':checked');
  if (conversionRateCheck) {
    
    var currency = $("#currency_id_select").find(':selected').text();
    if (currency == 'US Dollars : $' || currency == 'US Dollar : $' || currency == 'Great Britain Ponds : £' || currency == 'Pounds : £' || currency == 'Euro : €') {
      var curr_rate = $('#currency_rate').val();
      var perUnitCost = unformat2Number($("#" + key + "per_unit_cost" + ln).val());
      if ($('#' + key + 'base_cost' + ln).val() == '') {
        $('#' + key + 'base_cost' + ln).val(perUnitCost);
        
      }
    
      var baseCost = $('#' + key + 'base_cost' + ln).val();
      if (curr_rate <= '0' || curr_rate == '') {
        var defaultValue = baseCost * 1;
        
        $("#" + key + "per_unit_cost" + ln).val(format2Number(defaultValue));
      }
      else {
        var convertedVal = baseCost * curr_rate;
        
        $("#" + key + "per_unit_cost" + ln).val(format2Number(convertedVal));
      }
    
    }
  }
  else {
    var currency = $("#currency_id_select").find(':selected').text();
    if (currency == 'US Dollars : $' || currency == 'US Dollar : $' || currency == 'Great Britain Ponds : £' || currency == 'Pounds : £' || currency == 'Euro : €') {
      var curr_rate = $('#currency_rate').val();
      var perUnitCost = unformat2Number($("#" + key + "per_unit_cost" + ln).val());
      if ($('#' + key + 'base_cost' + ln).val() == '') {
        $('#' + key + 'base_cost' + ln).val(perUnitCost);
        
      }
      var baseCost = $('#' + key + 'base_cost' + ln).val();
      var defaultValue = baseCost * 1;
      $("#" + key + "per_unit_cost" + ln).val(format2Number(defaultValue));
    }
  }
  
  // Margin Profit Calculations
  var profitMargin = $("#" + key + "product_margin" + ln).val();
  var per_unit_cost = $("#" + key + "per_unit_cost" + ln).val();
  per_unit_cost = unformat2Number(per_unit_cost);
  
  
  if (profitMargin >= 0 && profitMargin <= 100) {
    if (profitMargin == 0 ||profitMargin == '') {
      
      $("#" + key + "product_list_price" + ln).val(format2Number(per_unit_cost));
    }
    else {
      profitMarginpercentage =1- (profitMargin / 100);
      profitMargin=(per_unit_cost)/profitMarginpercentage;
      var productSalePrice = profitMargin;
      document.getElementById(key+'product_profit_margin'+ln).value=productSalePrice-$("#" + key + "per_unit_cost" + ln).val();
      document.getElementById(key+'product_profit_margin'+ln).value=productSalePrice-$("#" + key + "per_unit_cost" + ln).val();
      $("#" + key + "product_list_price" + ln).val(format2Number(productSalePrice.toFixed(2)));
      $("#" + key + "product_total_price_tax_excl" + ln).val(format2Number(productSalePrice.toFixed(2)));
    }
  }
  else if (per_unit_cost != '') {
    $("#" + key + "product_list_price" + ln).val(format2Number(per_unit_cost));
  }
  var required = 'product_list_price';
  if(document.getElementById(key + required + ln) === null){
    required = 'product_unit_price';
  }
  
  //end of profit margin calculation
  // if (document.getElementById(key + 'name' + ln).value === '' || document.getElementById(key + required + ln).value === ''){
  //   return;
  // }

if(key === "product_" && document.getElementById(key + 'product_qty' + ln) !== null && document.getElementById(key + 'product_qty' + ln).value === ''){
  document.getElementById(key + 'product_qty' + ln).value =1;
}

var productUnitPrice = unformat2Number(document.getElementById(key + 'product_unit_price' + ln).value);
if(document.getElementById(key + 'product_list_price' + ln).value !== null && document.getElementById(key + 'product_discount' + ln).value !== null && document.getElementById(key + 'discount' + ln).value !== null){
  var listPrice = get_value(key + 'product_list_price' + ln);
  var discount = get_value(key + 'product_discount' + ln);
  var dis = document.getElementById(key + 'discount' + ln).value;
  if(dis == 'Amount')
  {
      if(discount > listPrice)
      {
        document.getElementById(key + 'product_discount' + ln).value = listPrice;
        discount = listPrice;
        
      }
      productUnitPrice = listPrice - discount;
      document.getElementById(key+'product_total_price_tax_excl'+ln).value=productUnitPrice.toFixed(2);
      document.getElementById(key+'product_total_price'+ln).value=productUnitPrice;
      document.getElementById(key + 'product_unit_price' + ln).value = format2Number(listPrice - discount);
    }
    else if(dis == 'Percentage')
    {
      if(discount > 100)
      {
        document.getElementById(key + 'product_discount' + ln).value = 100;
        discount = 100;
      }
      discount = (discount/100) * listPrice;
      productUnitPrice = listPrice - discount;
      document.getElementById(key+'product_total_price_tax_excl'+ln).value=productUnitPrice.toFixed(2);
      document.getElementById(key+'product_total_price'+ln).value=productUnitPrice;
      document.getElementById(key + 'product_unit_price' + ln).value = format2Number(listPrice - discount);
    }
    else
    {
      document.getElementById(key + 'product_unit_price' + ln).value = document.getElementById(key + 'product_list_price' + ln).value;
      document.getElementById(key + 'product_discount' + ln).value = '';
      discount = 0;
    }
    document.getElementById(key + 'product_list_price' + ln).value = format2Number(listPrice);
    //document.getElementById(key + 'product_discount' + ln).value = format2Number(unformat2Number(document.getElementById(key + 'product_discount' + ln).value));
    document.getElementById(key + 'product_discount_amount' + ln).value = format2Number(-discount, 6);
  }

  var productQty = 1;
  if(document.getElementById(key + 'product_qty' + ln) !== null){
    productQty = unformat2Number(document.getElementById(key + 'product_qty' + ln).value);
    Quantity_format2Number(ln);
  }
  
  // var vat = unformatNumber(document.getElementById(key + 'vat' + ln).value,',','.');

  var productTotalPrice = productQty * productUnitPrice;
  productUnitPrice = productTotalPrice;

  // GST and PRA tax Calculation
  var taxType = $("#" + key + "tax_type" + ln).val();
  var gst = $("#" + key + "gst_percentage" + ln).val();
  var gstCstm = $("#" + key + "gst_custom_percentage" + ln).val();
  var pra = $("#" + key + "pra_percentage" + ln).val();
  var praCstm = $("#" + key + "pra_custom_percentage" + ln).val();
  var servicePra = $("#" + key + "pra_percentage" + ln).val();
  var servicePraCstm = $("#" + key + "pra_custom_percentage" + ln).val();
  var wht = $("#" + key + "wht_amt" + ln).val();
  var whtCustom = $("#" + key + "wht_custom" + ln).val();
  var servWht = $("#" + key + "service_wht_amt" + ln).val();
  var servWhtCustom = $("#" + key + "service_wht_custom" + ln).val();
  

  // var totalWht, totalWhtCstm;
  var totalvat = 0;
  var totalWHT = 0;
  var totalPRA = 0;
  var totalGST = 0;
  var totalOtherTax = 0;
  var productPriceAfterWHT = 0;


  // adding WHT
  if (whtCustom !== '') {
    if (whtCustom >= 0 && whtCustom <= 100) {
      $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
      totalWHT = (productTotalPrice * whtCustom) / 100;
      whtCustom = parseFloat(whtCustom);
      whtCustom = (100 - whtCustom) / 100;

      productTotalPrice = productTotalPrice / whtCustom;
      let unitPrice = document.getElementById(key + 'product_list_price' + ln).value;
      unformat2Number(unitPrice);
      totalWHT = productTotalPrice - unitPrice;
      // productTotalPrice = productTotalPrice.toFixed(2);
    }
    else {
      alert("Enter Value between 0 - 100");
    }
  }
  else {
    if (wht === '') {
      return 0;
    }
    if(wht>0)
    {
      $("#" + key + "wht_amt" + ln).css({ "pointer-events": "auto", "filter": "" });
      totalWHT = productQty * $("#" + key + "product_total_price_tax_excl" + ln).val() * (wht / 100);
      let whtPercCalc = (100 - wht) / 100;
      productTotalPrice = productTotalPrice / whtPercCalc;
  
      let unitPrice = document.getElementById(key + 'product_list_price' + ln).value;

      // totalWHT = productTotalPrice - unformat2Number(unitPrice);
      document.getElementById(key + 'vat_amt' + ln).value = format2Number(totalWHT);
    }
  }
  
  // taxation for product line
  if (key == 'product_' && taxType != '') {
    if (taxType == 'GST') {
      if (gstCstm != '' && gstCstm.length > 0) {
        if (gstCstm >= 0 && gstCstm <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });

          let gstPerc = gstCstm / 100;
          // console.log(key + 'product_total_price' + ln);
          // console.log(unformat2Number(document.getElementById(key + 'product_total_price' + ln).value));
          totalGST = (productTotalPrice  + totalWHT) * gstPerc;
          productTotalPrice = productTotalPrice + totalGST;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }
      else {
        // Enable Dropdown
        $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });

        let gstPerc = gst / 100;

        if(totalWHT==='NaN'||totalWHT=='')
        {
          totalGST = productTotalPrice * gstPerc;
        }else{
          totalGST = (document.getElementById(key + 'product_list_price' + ln).value) * gstPerc;
        }
        productTotalPrice = productTotalPrice + totalGST;
        // document.getElementById(key + 'product_list_price' + ln).value=productTotalPrice + totalGST;
      }
    }
    else if (taxType == 'PRA') {
      
      if (praCstm != '' && praCstm.length > 0) {
        if (praCstm >= 0 && praCstm <= 100) {
          // Disable dropdown
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });

          let praPerc = praCstm / 100;
          totalPRA = (productTotalPrice + totalWHT) * praPerc;
          productTotalPrice = productTotalPrice + totalPRA;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }
      else {
        // Enable dropdown
        $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });

        let praPerc = pra / 100;
        totalPRA = (productTotalPrice  + totalWHT) * praPerc;
        productTotalPrice = productTotalPrice + totalPRA;
      }
    }
    else if (taxType == 'Other') {
      
      var totalVatPraCstm, totalVatGstCstm;
      // if all custom fields are fill
      if (praCstm != '' && praCstm.length > 0 && gstCstm != '' && gstCstm.length > 0 && whtCustom != '') {
        if (praCstm >= 0 && praCstm <= 100 && gstCstm >= 0 && gstCstm <= 100 && whtCustom >= 0 && whtCustom <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          totalVatPraCstm = (productTotalPrice * praCstm) / 100;

          totalvat = totalVatGstCstm + totalVatPraCstm + totalWhtCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
          // }
          // else {
          //   $("#" + key + "wht_amt" + ln).css({ "pointer-events": "auto", "filter": "" });
          //   totalWht = (productTotalPrice * wht) / 100;
          //   totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          //   totalVatPraCstm = (productTotalPrice * praCstm) / 100;
          //   totalvat = totalVatGstCstm + totalVatPraCstm + totalWht;
          //   productTotalPrice = productTotalPrice + totalvat;
          // }
          // var totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          // var totalVatPraCstm = (productTotalPrice * praCstm) / 100;
          // totalvat = totalVatGstCstm + totalVatPraCstm;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // If praCstm is null
      else if (praCstm == '' && gstCstm != '' && gstCstm.length > 0 && whtCustom != '') {
        if (gstCstm >= 0 && gstCstm <= 100 && whtCustom >= 0 && whtCustom <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          let gstPerc = gstCstm / 100;
          totalOtherTax = productTotalPrice * gstPerc;
          productTotalPrice = productTotalPrice + totalOtherTax;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // If gstCstm is null
      else if (praCstm != '' && praCstm.length > 0 && gstCstm == '' && whtCustom != '') {
        if (praCstm >= 0 && praCstm <= 100 && whtCustom >= 0 && whtCustom <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          // totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          totalVatPraCstm = (productTotalPrice * praCstm) / 100;

          totalvat = totalVatPraCstm + totalWhtCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // if whtCustom is null
      else if (praCstm != '' && praCstm.length > 0 && gstCstm != '' && gstCstm.length > 0 && whtCustom == '') {
        if (praCstm >= 0 && praCstm <= 100 && gstCstm >= 0 && gstCstm <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          // totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          totalVatPraCstm = (productTotalPrice * praCstm) / 100;

          totalvat = totalVatGstCstm + totalVatPraCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // if whtCustom is null
      else if (praCstm != '' && praCstm.length > 0 && gstCstm != '' && gstCstm.length > 0 && whtCustom == '') {
        if (praCstm >= 0 && praCstm <= 100 && gstCstm >= 0 && gstCstm <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          // totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          totalVatPraCstm = (productTotalPrice * praCstm) / 100;

          totalvat = totalVatGstCstm + totalVatPraCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // if whtCustom and gstCst are null
      else if (praCstm != '' && praCstm.length > 0 && gstCstm == '' && whtCustom == '') {
        if (praCstm >= 0 && praCstm <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          // totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          // totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          totalVatPraCstm = (productTotalPrice * praCstm) / 100;

          totalvat = totalVatPraCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // if whtCustom and praCstm are null
      else if (praCstm == '' && gstCstm != '' && gstCstm.length > 0 && whtCustom == '') {
        if (gstCstm >= 0 && gstCstm <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          // totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          // totalVatPraCstm = (productTotalPrice * praCstm) / 100;
          
          totalvat = totalVatGstCstm; // Total Tax Amount

          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }

      // if praCstm and gstCstm are null
      else if (praCstm == '' && gstCstm == '' && whtCustom != '') {
        if (whtCustom >= 0 && whtCustom <= 100) {
          // Disable dropdown
          $("#" + key + "gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // $("#" + key + "wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          // if (whtCustom !== '') {

          totalWhtCstm = (productTotalPrice * whtCustom) / 100;
          // totalVatGstCstm = (productTotalPrice * gstCstm) / 100;
          // totalVatPraCstm = (productTotalPrice * praCstm) / 100;
          
          totalvat = totalWhtCstm; // Total Tax Amount
          
          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }
    }
  }
  
  // taxation for service line
  if (key == 'service_') {
    var listPrice = $("#" + key + "product_list_price" + ln).val();
    listPrice = unformat2Number(listPrice);

    if (servicePraCstm != '' && servicePraCstm.length > 0) {
      if (servicePraCstm >= 0 && servicePraCstm <= 100) {
        if (servWhtCustom !== '') {
          if (servWhtCustom >= 0 && servWhtCustom <= 100) {
            $("#" + key + "service_wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
            totalWhtCstm = (productTotalPrice * servWhtCustom) / 100;
            totalvat = (listPrice * servicePraCstm) / 100;
            totalvat += totalWhtCstm;
            productTotalPrice = productTotalPrice + totalvat;
          }
          else {
            alert("Enter Value between 0 - 100");
          }
        }
        else {
          $("#" + key + "service_wht_amt" + ln).css({ "pointer-events": "auto", "filter": "" });
            totalWht = (productTotalPrice * servWht) / 100;
            totalvat = (listPrice * servicePraCstm) / 100;
            totalvat += totalWht;
            productTotalPrice = productTotalPrice + totalvat;
        }
      }
      else {
        alert("Enter value between  0 - 100")
      }
    }
    else {
      if (servWhtCustom !== '') {
        if (servWhtCustom >= 0 && servWhtCustom <= 100) {
          $("#" + key + "service_wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
          totalWhtCstm = (productTotalPrice * servWhtCustom) / 100;
          totalvat = (listPrice * servicePra) / 100;
          totalvat += totalWhtCstm;
          productTotalPrice = productTotalPrice + totalvat;
        }
        else {
          alert("Enter Value between 0 - 100");
        }
      }
      else {
        $("#" + key + "service_wht_amt" + ln).css({ "pointer-events": "auto", "filter": "" });
          totalWht = (productTotalPrice * servWht) / 100;
          totalvat = (listPrice * servicePra) / 100;
          totalvat += totalWht;
          productTotalPrice = productTotalPrice + totalvat;
      }
      // $("#" + key + "pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
      // totalvat = (listPrice * servicePra) / 100;
      // productTotalPrice = productTotalPrice + totalvat;

    }
  }

  // var totalvat=(productTotalPrice * vat) /100;

  // if(total_tax){
  //   productTotalPrice=productTotalPrice + totalvat;
  // }
  document.getElementById(key + 'product_unit_price' + ln).value = format2Number(productUnitPrice);
  document.getElementById(key + 'product_total_price' + ln).value = format2Number(productTotalPrice);
  
  // totalvat = totalWHT;
  // if (totalvat) {
    
  //   document.getElementById(key + 'vat_amt' + ln).value = format2Number(totalvat);
    
  // }
  // else {
  //   document.getElementById(key + 'vat_amt' + ln).value = format2Number(0);
  // }

  // profit table values
  var priceAfterTax
  var profitMarginVal;
  var marginInPKR;
  var pmtAfterWHT;
  var whtTaxPercentage;
  var totalTaxType;
  var prodPrice_lessTaxType;

  if (key == "product_") {
    if (typeof productTotalPrice != 'undefined') {      
      // reducing productTotalPrice calculated so far form taxation;
      if (whtCustom !== '' && whtCustom >= 0 && whtCustom <= 100) {
        whtTaxPercentage = (productTotalPrice * whtCustom) / 100;
        pmtAfterWHT = productTotalPrice - whtTaxPercentage;
      }
      else {
        whtTaxPercentage = (productTotalPrice * wht) / 100; 
        pmtAfterWHT = productTotalPrice - whtTaxPercentage;
        whtpercentage=wht / 100;
        after_wht_added=unformat2Number(document.getElementById(key+'product_total_price'+ln).value)-(unformat2Number(document.getElementById(key+'product_total_price'+ln).value)*((100-wht) / 100));
        // console.log();
        document.getElementById(key + 'vat_amt' + ln).value = format2Number(after_wht_added.toFixed(2));
        totalpricewht=unformat2Number(document.getElementById(key+'product_total_price'+ln).value)-(unformat2Number(document.getElementById(key+'product_total_price'+ln).value)*whtpercentage);
        after_subtracting_gst=totalpricewht-totalGST;
        document.getElementById(key+'product_gst'+ln).value=totalGST*productQty;
        total_profit=after_subtracting_gst-unformat2Number(document.getElementById(key+'per_unit_cost'+ln).value * productQty);
        document.getElementById(key+'product_profit_margin'+ln).value= Math.trunc(total_profit);
      }
      
      if (taxType == 'GST') {
    
        // profitmarginaftercalculation=(unformat2Number(document.getElementById(key+'product_total_price'+ln).value) *  (unformat2Number(document.getElementById(key+'wht_amt'+ln).value)*100)-totalGST)- unformat2Number(document.getElementById(key+'per_unit_cost'+ln).value);
        // console.log(profitmarginaftercalculation);
        // document.getElementById(key+'product_profit_margin'+ln).value= $().val(profitmarginaftercalculation);
        totalTaxType = totalGST;
      }
      if (taxType == 'PRA') {
        totalTaxType = totalPRA;
      }
      if (taxType == 'Other') {
        totalTaxType = totalOtherTax;
      }


      if (typeof pmtAfterWHT != 'undefined' && typeof totalTaxType != 'undefined') {
        prodPrice_lessTaxType = pmtAfterWHT - totalTaxType;
        let prodPerUnitPrice = parseFloat(document.getElementById(key + 'per_unit_cost' + ln).value);
        // profitMarginVal = prodPrice_lessTaxType - prodPerUnitPrice;
        // document.getElementById(key + "product_profit_margin" + ln).value = format2Number(profitMarginVal);

        var selected_currency = $('#currency_id_select').find(':selected').html();
        if (selected_currency != 'Rupees: Rs') {
          let currency_rate = +document.getElementById('currency_rate').value;
          if (currency_rate == '') {
            document.getElementById(key + 'product_gst' + ln).removeAttribute('readonly');
            // document.getElementById(key + 'product_gst' + ln).value = '';
          } else {
            document.getElementById(key + 'product_gst' + ln).setAttribute('readonly', 'readonly');
            if (conversionRateCheck) {
              // document.getElementById(key + 'product_gst' + ln).value = format2Number(profitMarginVal);
            }
            else {
              marginInPKR = profitMarginVal * currency_rate;
              // document.getElementById(key + 'product_profit_margin_pkr' + ln).value = format2Number(marginInPKR);
            }
          }
        }
        
      }
      
      // var costToCompany = +unformat2Number(document.getElementById(key + 'per_unit_cost' + ln).value);
      
      // priceAfterTax = productTotalPrice - totalvat; // price after tax = total_price - tatal tax;
      // profitMarginVal = priceAfterTax - (costToCompany * productQty); // profit_margin = price_after_tax - (cost_to_company * product_qty)
      
      // // setting calculated values
      // document.getElementById(key + "product_price_after_tax" +ln).value = format2Number(priceAfterTax);
      
      
    }
     
  }
  var groupid = 0;
  if(enable_groups){
    groupid = document.getElementById(key + 'group_number' + ln).value;
  }
  groupid = 'group' + groupid;

  calculateTotal(groupid);
  calculateTotal();

}

function calculateAllLines() {
  $('.product_group').each(function(productGroupkey, productGroupValue) {
      $(productGroupValue).find('tbody').each(function(productKey, productValue) {
        calculateLine(productKey, "product_");
      });
  });

  $('.service_group').each(function(serviceGroupkey, serviceGroupValue) {
    $(serviceGroupValue).find('tbody').each(function(serviceKey, serviceValue) {
      calculateLine(serviceKey, "service_");
    });
  });
}

/**
 * Calculate totals
 */
function calculateTotal(key)
{
  if (typeof key === 'undefined') {  key = 'lineItems'; }
  var row = document.getElementById(key).getElementsByTagName('tbody');
  if(key == 'lineItems') key = '';
  var length = row.length;
  var head = {};
  var tot_amt = 0;
  var subtotal = 0;
  var dis_tot = 0;
  var tax = 0;

  for (i=0; i < length; i++) {
    var qty = 1;
    var list = null;
    var unit = 0;
    var deleted = 0;
    var dis_amt = 0;
    var product_vat_amt = 0;

    var input = row[i].getElementsByTagName('input');
    for (j=0; j < input.length; j++) {
      if (input[j].id.indexOf('product_qty') != -1) {
        qty = unformat2Number(input[j].value);
      }
      if (input[j].id.indexOf('product_total_price') != -1)
      {
        list = unformat2Number(input[j].value);
      }
      if (input[j].id.indexOf('product_per_unit_cost') != -1)
      {
        unit = unformat2Number(input[j].value);
      }
      if (input[j].id.indexOf('product_discount_amount') != -1)
      {
        dis_amt = unformat2Number(input[j].value);
      }
      if (input[j].id.indexOf('product_gst') != -1)
      {
        product_vat_amt = unformat2Number(input[j].value);
      }
      if (input[j].id.indexOf('deleted') != -1) {
        deleted = input[j].value;
      }

    }

    if(deleted != 1 && key !== ''){
      head[row[i].parentNode.id] = 1;
    } else if(key !== '' && head[row[i].parentNode.id] != 1){
      head[row[i].parentNode.id] = 0;
    }

    
    // console.log(unit);
      tot_amt += list ;
    // if (qty !== 0 && list !== null && deleted != 1) {
    // } 
    // // else if (qty !== 0 && unit !== 0 && deleted != 1) {
    // //   tot_amt += unit * qty;
    // // }    

    // if (dis_amt !== 0 && deleted != 1) {
      dis_tot += dis_amt * qty;
      // console.log(dis_tot);
    // }
    // if (product_vat_amt !== 0 && deleted != 1) {
      tax += product_vat_amt;
      // console.log(tax);
    // }
  }

  for(var h in head){
    if (head[h] != 1 && document.getElementById(h + '_head') !== null) {
      document.getElementById(h + '_head').style.display = "none";
    }
  }

  subtotal = (unit*qty) + dis_tot;
  total=list;

  set_value(key+'total_amt',unit*qty);
  set_value(key+'subtotal_amount',subtotal);
  set_value(key+'discount_amount',dis_tot);

  var shipping = get_value(key+'shipping_amount');

  var shippingtax = get_value(key+'shipping_tax');

  // var shippingtax_amt = shipping * (shippingtax/100);

  set_value(key+'shipping_tax_amt','');

  // tax += shippingtax_amt;

  set_value(key+'tax_amount',tax);

  set_value(key+'subtotal_tax_amount',list);
  set_value(key+'total_amount',list);
}

function set_value(id, value){

  if(document.getElementById(id) !== null)
  {
    document.getElementById(id).value = format2Number(value);
  }
}

function get_value(id){
  if(document.getElementById(id) !== null)
  {
    return unformat2Number(document.getElementById(id).value);
  }
  return 0;
}


function unformat2Number(num)
{
  return unformatNumber(num, num_grp_sep, dec_sep);
}

function format2Number(str, sig)
{
  if (typeof sig === 'undefined') { sig = sig_digits; }
  num = Number(str);
  if(sig == 2){
    str = formatCurrency(num);
  }
  else{
    str = num.toFixed(sig);
  }

  str = str.split(/,/).join('{,}').split(/\./).join('{.}');
  str = str.split('{,}').join(num_grp_sep).split('{.}').join(dec_sep);

  return str;
}

function formatCurrency(strValue)
{
  strValue = strValue.toString().replace(/\$|\,/g,'');
  dblValue = parseFloat(strValue);

  blnSign = (dblValue == (dblValue = Math.abs(dblValue)));
  dblValue = Math.floor(dblValue*100+0.50000000001);
  intCents = dblValue%100;
  strCents = intCents.toString();
  dblValue = Math.floor(dblValue/100).toString();
  if(intCents<10)
    strCents = "0" + strCents;
  for (var i = 0; i < Math.floor((dblValue.length-(1+i))/3); i++)
    dblValue = dblValue.substring(0,dblValue.length-(4*i+3))+','+
      dblValue.substring(dblValue.length-(4*i+3));
  return (((blnSign)?'':'-') + dblValue + '.' + strCents);
}

function Quantity_format2Number(ln)
{
  var str = '';
  var qty=unformat2Number(document.getElementById('product_product_qty' + ln).value);
  if(qty === null){qty = 1;}

  if(qty === 0){
    str = '0';
  } else {
    str = format2Number(qty);
    if(sig_digits){
      str = str.replace(/0*$/,'');
      str = str.replace(dec_sep,'~');
      str = str.replace(/~$/,'');
      str = str.replace('~',dec_sep);
    }
  }

  document.getElementById('product_product_qty' + ln).value=str;
}

function formatNumber(n, num_grp_sep, dec_sep, round, precision) {
  if (typeof num_grp_sep == "undefined" || typeof dec_sep == "undefined") {
    return n;
  }
  if(n === 0) n = '0';

  n = n ? n.toString() : "";
  if (n.split) {
    n = n.split(".");
  } else {
    return n;
  }
  if (n.length > 2) {
    return n.join(".");
  }
  if (typeof round != "undefined") {
    if (round > 0 && n.length > 1) {
      n[1] = parseFloat("0." + n[1]);
      n[1] = Math.round(n[1] * Math.pow(10, round)) / Math.pow(10, round);
      if(n[1].toString().includes('.')) {
      n[1] = n[1].toString().split(".")[1];
    }
      else {
	  n[0] = (parseInt(n[0]) + n[1]).toString();
	  n[1] = "";
      }
    }
    if (round <= 0) {
      n[0] = Math.round(parseInt(n[0], 10) * Math.pow(10, round)) / Math.pow(10, round);
      n[1] = "";
    }
  }
  if (typeof precision != "undefined" && precision >= 0) {
    if (n.length > 1 && typeof n[1] != "undefined") {
      n[1] = n[1].substring(0, precision);
    } else {
      n[1] = "";
    }
    if (n[1].length < precision) {
      for (var wp = n[1].length; wp < precision; wp++) {
        n[1] += "0";
      }
    }
  }
  regex = /(\d+)(\d{3})/;
  while (num_grp_sep !== "" && regex.test(n[0])) {
    n[0] = n[0].toString().replace(regex, "$1" + num_grp_sep + "$2");
  }
  return n[0] + (n.length > 1 && n[1] !== "" ? dec_sep + n[1] : "");
}

function check_form(formname) {
  calculateAllLines();
  if (typeof(siw) != 'undefined' && siw && typeof(siw.selectingSomething) != 'undefined' && siw.selectingSomething)
    return false;
  return validate_form(formname, '');
}

//Fetching products for lineitem product dropdown
function getProductOption(lineId) {
  var productData, prodIndex;
  $('.product_name').select2();
  if (window.location.href.indexOf("lead_id") > -1) {
    $.ajax({
      type: 'GET',
      async: false,
      url: 'index.php?module=AOS_Products_Quotes&action=getLeadQuoteProducts&sugar_body_only=true',
      contentType: 'application/x-www-form-urlencoded',
      success: function (data) {
        productData = $.parseJSON(data);
        $("#product_name" + lineId + " option").remove();
        $("#product_name" + lineId).append('<option value=""></option>');
        for (prodIndex = 0; prodIndex < productData.length; prodIndex++) {
          $("#product_name" + lineId).append('<option value="' + productData[prodIndex].id + '">' + productData[prodIndex].name + '</option>');
        }
      },
      error: function (request, status, errorThrown) {
        console.log(request + ' ' + status + ' ' + errorThrown);
      }
    });
  }
  else {
    var setProd;
    var productArr = [];
    var serviceArr = [];
    $.ajax({
      type: 'GET',
      url: 'index.php?module=AOS_Products_Quotes&action=getLeadQuoteProducts&sugar_body_only=true',
      contentType: 'application/x-www-form-urlencoded',
      success: function (data) {
        productData = $.parseJSON(data);
        $("#product_name" + lineId + " option").remove();
        $("#product_name" + lineId).append('<option value=""></option>');
        for (prodIndex = 0; prodIndex < productData.length; prodIndex++) {
          $("#product_name" + lineId).append('<option value="' + productData[prodIndex].id + '">' + productData[prodIndex].name + '</option>');
        }
        if (moduleName == 'AOS_Quotes') {
          for (setProd = 0; setProd < productIdQuotes.length; setProd++) {
            if (productIdQuotes[setProd].product_id != 0) {
              productArr.push(productIdQuotes[setProd]);
            }
            else {
              serviceArr.push(productIdQuotes[setProd]);
            }
          }
          // Setting Line_Items fields
          for (var lineIndex = 0; lineIndex < productArr.length; lineIndex++) {
            // quantity
            $("#product_product_qty" + lineIndex).val(format2Number(productArr[lineIndex].product_qty));
            // name
            setDDVal('product_name' + lineIndex, productArr[lineIndex].product_id);
            setDDVal('product_sub_products' + lineIndex, productArr[lineIndex].sub_products);
            setDDVal('product_sub_sub_products' + lineIndex, productArr[lineIndex].sub_sub_products);
            // list_price
            $("#product_product_list_price" + lineIndex).val(format2Number(productArr[lineIndex].product_list_price));
            // discount_price
            $("#product_product_discount" + lineIndex).val(format2Number(productArr[lineIndex].product_discount));
            // discount_type
            setDDVal('product_discount' + lineIndex, productArr[lineIndex].discount);
            // unit_price
            $("#product_product_unit_price" + lineIndex).val(productArr[lineIndex].product_unit_price);
            // tax type
            setDDVal('product_tax_type' + lineIndex, productArr[lineIndex].product_tax_type);
            // custom gst
            $("#product_gst_custom_percentage" + lineIndex).val(productArr[lineIndex].gst_custom_percentage);
            // custom pra
            $("#product_pra_custom_percentage" + lineIndex).val(productArr[lineIndex].pra_custom_percentage);
            // total tax amount
            $("#product_vat_amt" + lineIndex).val(format2Number(productArr[lineIndex].vat_amt));
            // total amount
            $("#product_product_total_price" + lineIndex).val(format2Number(productArr[lineIndex].product_total_price));
            checkCustomTaxes(lineIndex);
          }
        }
        else if (moduleName == 'AOS_Invoices') {
          for (setProd = 0; setProd < productIdInvoices.length; setProd++) {
            if (productIdInvoices[setProd].product_id != 0) {
              productArr.push(productIdInvoices[setProd]);
            }
            else {
              serviceArr.push(productIdInvoices[setProd]);
            }
          }
          // Setting Line_Items fields
          for (var lineIndex=0; lineIndex < productArr.length; lineIndex++) {
            // quantity
            $("#product_product_qty" + lineIndex).val(format2Number(productArr[lineIndex].product_qty));
            // name
            setDDVal('product_name' + lineIndex, productArr[lineIndex].product_id);
            setDDVal('product_sub_products' + lineIndex, productArr[lineIndex].sub_products);
            setDDVal('product_sub_sub_products' + lineIndex, productArr[lineIndex].sub_sub_products);
            // list_price
            $("#product_product_list_price" + lineIndex).val(format2Number(productArr[lineIndex].product_list_price));
            // discount_price
            $("#product_product_discount" + lineIndex).val(format2Number(productArr[lineIndex].product_discount));
            // discount_type
            setDDVal('product_discount' + lineIndex, productArr[lineIndex].discount);
            // unit_price
            $("#product_product_unit_price" + lineIndex).val(format2Number(productArr[lineIndex].product_unit_price));
            // tax type
            setDDVal('product_tax_type' + lineIndex, productArr[lineIndex].product_tax_type);
            // custom gst
            $("#product_gst_custom_percentage" + lineIndex).val(productArr[lineIndex].gst_custom_percentage);
            // custom pra
            $("#product_pra_custom_percentage" + lineIndex).val(productArr[lineIndex].pra_custom_percentage);
            // total tax amount
            $("#product_vat_amt" + lineIndex).val(format2Number(productArr[lineIndex].vat_amt));
            // total amount
            $("#product_product_total_price" + lineIndex).val(format2Number(productArr[lineIndex].product_total_price));
            checkCustomTaxes(lineIndex);
          }
          
        }
      },
      error: function (request, status, errorThrown) {
        console.log(request + ' ' + status + ' ' + errorThrown);
      }
    });
  }
}

function subProductDD(fieldId) {
  var product_id = $('#product_name' + fieldId).val();
  $('#product_sub_products' + fieldId + ' option').remove();
  $('#product_sub_sub_products' + fieldId + ' option').remove();
  var data = {
    'id': product_id
  };

  $.ajax({
    type: 'POST',
    url: 'index.php?module=Leads&action=getSubProducts&sugar_body_only=true',
    data: data,
    contentType: 'application/x-www-form-urlencoded',
    dataType: 'text',
    async: false,
    success: function (data) {
      var subData = $.parseJSON(data);
      if (subData.length != 0) {
        $('#product_sub_products' + fieldId).append('<option value=""></option>');
        $.each(subData, function (i, item) {
          $('#product_sub_products' + fieldId).append('<option value="' + subData[i].id + '">' + subData[i].name + '</option>');
        });
      }
    },
    error: function (request, status, errorThrown) {
      console.log(request + ' ' + status + ' ' + errorThrown);
    }
  });
}

function sub_SubProductDD(fieldId) {
  var sub_product_id = $('#product_sub_products' + fieldId).val();
  $('#product_sub_sub_products' + fieldId + ' option').remove();
  $('.sub_sub_products').select2();
  var data = {
    'id': sub_product_id
  };

  $.ajax({
    type: 'POST',
    url: 'index.php?module=Leads&action=getSubProducts&sugar_body_only=true',
    data: data,
    contentType: 'application/x-www-form-urlencoded',
    dataType: 'text',
    async: false,
    success: function (sub_data) {
      var sub_subData = $.parseJSON(sub_data);

      if (sub_subData.length != 0) {
        $("#product_sub_sub_products" + fieldId).append('<option value=""></option>');
        $.each(sub_subData, function (i, item) {
          $('#product_sub_sub_products' + fieldId).append('<option value="' + sub_subData[i].id + '">' + sub_subData[i].name + '</option>');
        });
      }
    },
    error: function (request, status, errorThrown) {
      console.log(request + ' ' + status + ' ' + errorThrown);
    }
  });
}

//Assigning value to hidden input field
function setProductValue(lineId) {
  var selectedProductVal = $("#product_name" + lineId+" option:selected").val();
  $('#product_product_id' + lineId).val(selectedProductVal);
}

function setDDVal(field_id, field_val) {
  $('#'+field_id).val(field_val).trigger('change');
}

// Tax Type selection
function setTaxType(lineId) {

  var taxType = $('#product_tax_type' + lineId).val();
  if (taxType == 'GST') {
    // Removing Custom Field
    $("#product_pra_custom_percentage" + lineId).css("display", "none");

    // Removing Custom Field Values
    $("#product_gst_custom_percentage" + lineId).val("");
    $("#product_pra_custom_percentage" + lineId).val("");

    // Displaying Respective Field
    $("#product_pra_percentage" + lineId).css("display", "none");
    $("#product_gst_percentage" + lineId).css("display", "block");
    $("#product_gst_custom_percentage" + lineId).css("display", "block");
    // $("#product_wht_amt" + lineId).css("display", "block");

    // Setting Default Value
    $("#product_gst_percentage" + lineId).val("17");
    $("#product_wht_amt" + lineId).val("4.5");
    $("#product_pra_percentage" + lineId).val("");
  }
  else if (taxType == 'PRA') {
    // Removing Custom Field
    $("#product_gst_custom_percentage" + lineId).css("display", "none");

    // Removing Custom Field Values
    $("#product_gst_custom_percentage" + lineId).css("display", "none");
    $("#product_pra_custom_percentage" + lineId).css("display", "none");

    // Displaying Respective Field
    $("#product_gst_percentage" + lineId).css("display", "none");
    $("#product_pra_percentage" + lineId).css("display", "block");
    $("#product_pra_custom_percentage" + lineId).css("display", "block");
    $("#product_wht_amt" + lineId).css("display", "block");


    // Setting Default Value
    $("#product_pra_percentage" + lineId).val("5");
    $("#product_gst_percentage" + lineId).val("");
    $("#product_wht_amt" + lineId).val("3");
  }
  else if (taxType == "Other") {
    // Removing Percentage Dropdowns
    $("#product_gst_percentage" + lineId).css("display", "none");
    $("#product_pra_percentage" + lineId).css("display", "none");
    // $("#product_wht_amt" + lineId).css("display", "none");

    // Setting Default Dropdown Values
    $("#product_gst_percentage" + lineId).val("");
    $("#product_pra_percentage" + lineId).val("");
    $("#product_wht_amt" + lineId).val("4.5");

    // Displaying Custom Fields
    $("#product_gst_custom_percentage" + lineId).css("display", "block");
    $("#product_pra_custom_percentage" + lineId).css("display", "none");
    // $("#product_wht_custom" + lineId).css("display", "none");
    $("#product_gst_percentage" + lineId).css("display", "none");
    $("#product_pra_percentage" + lineId).css("display", "none");
  }
  else {
    // Default setting
    $("#product_gst_percentage" + lineId).css("display", "none");
    $("#product_pra_percentage" + lineId).css("display", "none");
    $("#product_gst_custom_percentage" + lineId).css("display", "none");
    $("#product_pra_custom_percentage" + lineId).css("display", "none");
    $("#product_wht_amt" + lineId).css("display", "block");
    $("#product_gst_custom_percentage" + lineId).val("");
    $("#product_pra_custom_percentage" + lineId).val("");
    $("#product_pra_percentage" + lineId).val("");
    $("#product_gst_percentage" + lineId).val("");
    $("#product_wht_amt" + lineId).val("4.5");
  }
}

// Setting Tax Values in respective fields
function setTaxVal() {
  parentId;
  var beanId = { 'id': parentId };
  $.ajax({
    type: 'GET',
    url: 'index.php?module=AOS_Products_Quotes&action=getTaxValues&sugar_body_only=true',
    data: beanId,
    contentType: 'application/x-www-form-urlencoded',
    success: function (data) {
      var taxValues = $.parseJSON(data);
      
      for (var setTax = 0; setTax < taxValues.length; setTax++) {
        if (taxValues[setTax].product_id != 0) {
          setDDVal('product_tax_type' + setTax, taxValues[setTax].product_tax_type);
          $("#product_gst_custom_percentage" + setTax).val(taxValues[setTax].gst_custom_percentage);
          $("#product_pra_custom_percentage" + setTax).val(taxValues[setTax].pra_custom_percentage);
          checkCustomTaxes(setTax);
        }
        // else if (taxValues[setTax].product_id == 0) {
        //   $("#service_pra_custom_percentage" + setTax).val(format2Number(taxValues[setTax].pra_custom_percentage));
        // }
      }
    },
    error: function (request, status, errorThrown) {
      console.log(request + ' ' + status + ' ' + errorThrown);
    },
  });
}

function checkCustomTaxes(ln) {
  var gstCstm = $("#product_gst_custom_percentage" + ln).val();
  var whtCstm = $("#product_wht_custom" + ln).val();
  var praCstm = $("#product_pra_custom_percentage" + ln).val();
  var servicePraCstm = $("#service_pra_custom_percentage" + ln).val();

  if (gstCstm != '') {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }
  else {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
  }

  if (praCstm != '') {
    $("#product_pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }
  else {
    $("#product_pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
  }

  if (whtCstm !== '') {
    $("#product_wht_amt" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }
  else {
    $("#product_wht_amt" + ln).css({ "pointer-events": "auto", "filter": "" });
  }

  if (praCstm != '' && gstCstm != '') {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
    $("#product_pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }

  if (praCstm == '' && gstCstm == '') {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
    $("#product_pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
  }

  if (praCstm == '' && gstCstm != '') {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
    $("#product_pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
  }

  if (praCstm != '' && gstCstm == '') {
    $("#product_gst_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
    $("#product_pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }



  if (servicePraCstm != '') {
    $("#service_pra_percentage" + ln).css({ "pointer-events": "none", "filter": "grayscale(100%)" });
  }
  else {
    $("#service_pra_percentage" + ln).css({ "pointer-events": "auto", "filter": "" });
  }
}


function saveSubProductName(prodNum) {
  var productName = $("#product_sub_products" + prodNum).find(':selected').text();
  $('#product_sub_product_name' + prodNum).val(productName);
}

function saveSub_SubProductName(prodNum) {
  var productName = $("#product_sub_sub_products" + prodNum).find(':selected').text();
  $('#product_sub_sub_product_name'+prodNum).val(productName);
}



// function convertdateformat(date)
// {

// }