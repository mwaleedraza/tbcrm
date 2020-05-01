var CreateStudent = {

    setupSelect2: function () {
        jq331('#stpptcnt').select2({});
        jq331('#stnat1').select2({});
        jq331('#stnat2').select2({});
        jq331('#stcntres').select2({});
        jq331('#stinvwv').select2({});
        jq331('#stfundedBy').select2({});
        jq331('#stsponsor').select2({});
        jq331('#stassignedto').select2({});
        jq331('#strelOff').select2({});
        jq331('#strelCouns').select2({});
    },

    setupEditStudentEventListeners: function () {
        //first unbind any previous listeners
        jq331('#stfundedBy').off('select2:select');
        //select listener for Funded-By dropdown
        jq331('#stfundedBy').on('select2:select', function (e) {
            debugger;
            var data = e.params.data;
            if (data.id == "Sponsor") {
                jq331('#stsponsor').prop('disabled', false);
                jq331('#stsponsorban').hide('slow');
            } else {
                jq331('#stsponsor').prop('disabled', 'disabled');
                jq331('#stsponsorban').show('slow');
            }
        });
        //get a list of html elements with class mySelect1 and init them to Select2 dropdown
        //var $theSelect = jq331('.mySelect1');
        //$theSelect.select2({ allowClear: true });
    },


}