var EditLead = {
    //this method init the myselct class objects to Select2 JQuery plugin.
    setupSelect2: function () {
        //get a list of html elements with class mySelect and init them to Select2 dropdown
        var $theSelect = jq331('.mySelect');
        $theSelect.select2({ allowClear: true });
    },


    //this method sets up the background color of the Select2 dropdowns where
    //select2-bg class has been applied
    setupSelect2DropdownBkgrdColors: function () {
        jq331('.select2-bg').each(function (i, obj) {
            var variation = "",
                textVariation = "",
                textColor = "";
            var color = jq331(this).data('bgcolor');
            variation = jq331(this).data('bgcolor-variation');
            textVariation = jq331(this).data('text-variation');
            textColor = jq331(this).data('text-color');
            if (textVariation !== "") {
                textVariation = " " + textVariation;
            }
            if (variation !== "") {
                variation = " bg-" + variation;
            }
            var className = "bg-" + color + variation + " " + textColor + textVariation + " border-" + color + ' border-darken-2 ';

            jq331(this).select2({
                containerCssClass: className
            });
        });
    },

    validateEditLeadForm: function () {
        jq331('.required').each(function (i, obj) {
            var v = jq331(obj).val();
            if (v == null || v.trim() == '') {
                swal("Error!", "All inputs in red color are mandatory, please fill in and try again.!", "error");
                return false;
            }
        });
        return true;
    }
}
function syncFields (fromKey, toKey) {
    jq331('#'+toKey+'_street').val(  jq331('#'+fromKey+'_street').val() );
    jq331('#'+toKey+'_city').val(  jq331('#'+fromKey+'_city').val() );
    jq331('#'+toKey+'_state').val(  jq331('#'+fromKey+'_state').val() );
    jq331('#'+toKey+'_country').val(  jq331('#'+fromKey+'_country').val() );
}
function CustomValidation(){
	igec.blockFullPage();
	if(jq331("#email1").val()==""){
		jq331.unblockUI();
		return false;
	}else if(jq331("#first_name").val()==""){
		//$("#first_name").notify("Please Enter","warn");
		jq331.unblockUI();
		return false;
	}else if(jq331("#last_name").val()==""){
		//$("#last_name").notify("Please Enter","warn");
		jq331.unblockUI();
		return false;
	}else if(jq331("#assigned_user_id").val()=="" || jq331("#assigned_user_id").val()=="-1" || jq331("#assigned_user_id").val()==null){
		$("#assigned_user_id").notify("Please Enter","warn");
		jq331.unblockUI();
		return false;
	}
}
function customSave(){
    igec.blockFullPage();
    SUGAR.ajaxUI.submitForm(_form);
}
function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }
    else {
        $('#email_err').remove();
        $('div:contains("Missing required field: Email Address"):last').remove();
        $('#email1').after('<div id="email_err" class="required validation-message">Invalid Value: Email Address</div>')
        return false;
    }
}
function addEmailToCheckDuplicate(){
    $('#phone_mobile').blur(function(){
        checkDuplicateMobile();
    });
    $('#email1').blur(function(){
        checkDuplicateEmail();
    });
}

function dialogForURL() {
    $( "#dialogFor" ).dialog({ height: 150,width: 300 });
}
function closeDialog(){
    $("#dialogFor").dialog("close");
    $('#phone_mobile').val('');
}
function gotoRecord(id){
    $("#dialogFor").dialog("close");
    window.location="index.php?module=Leads&action=DetailView&record="+id;
}
function checkDuplicateEmail(){
    var email = $('#email1').val();
    var record = $( "input[name='record']" ).val();
    if(email !== ''){
        $.ajax({
            url: 'index.php?module=Leads&action=checkDupliacteEntry',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            data: 'sugar_body_only=1&type=email&email='+email+'&record='+record,
            async: true,
            success : function (result){
                var obj = $.parseJSON(result);
                if(obj['duplicate'] == 1){
                    //alert('"'+phone+'" Mobile Number Already Exists!');
                    //$('#phone_mobile').val('');
                    $('#dialogFor').html('<label>Email Already Exists Under '+obj['module']+ '!</label><br /><br /><input type="button" id="go_to_record" name="go_to_record" value="Go to Record" onclick="gotoRecord(\''+obj['record']+'\',\''+obj['module']+'\');" />');
                    dialogForURL();
                }
            }
        });
    }
}
function checkDuplicateMobile(){
    var phone = $('#phone_mobile').val();
    var record = $( "input[name='record']" ).val();
    if(phone !== ''){
        $.ajax({
            url: 'index.php?module=Leads&action=checkDupliacteEntry',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text',
            data: 'sugar_body_only=1&type=phone&phone='+phone+'&record='+record,
            async: true,
            success : function (result){
                var obj = $.parseJSON(result);
                if(obj['duplicate'] == 1){
                    //alert('"'+phone+'" Mobile Number Already Exists!');
                    //$('#phone_mobile').val('');
                    $('#dialogFor').html('<tr><td>Mobile Number Already Exists Under '+obj['module']+ '!</td></tr><tr><td><input type="button" id="go_to_record" name="go_to_record" value="Go to Record" onclick="gotoRecord(\''+obj['record']+'\',\''+obj['module']+'\');" /></td></tr></table>')
                    dialogForURL();
                }
            }
        });
    }
}