var InstituteEditPopup = {
    editInstituteDialogSetup: function () {
        //setup of the Select2 dropdowns
        jq331('#services').select2({});
        jq331('#required_tests-in').select2({});
        jq331('#entry_requirement-in').select2({});
        jq331('#account_type-in').select2({ allowClear: true });
        jq331('#email_response_time-in').select2({});
        jq331('#commission_category-in').select2({});
        jq331('#account_category-in').select2({});
        jq331('#application_processing-in').select2({});

        //event handlers
        var p = document.getElementById("t_num_std_eng-in"),
            res = document.getElementById("t_num_std_eng-in-val");
        p.addEventListener("input", function () {
            res.innerHTML = p.value;
        }, false);
        var p2 = document.getElementById("t_num_std_foundation-in"),
            res2 = document.getElementById("t_num_std_foundation-in-val");

        p2.addEventListener("input", function () {
            res2.innerHTML = p2.value;
        }, false);
        var p3 = document.getElementById("t_num_std_under-in"),
            res3 = document.getElementById("t_num_std_under-in-val");
        p3.addEventListener("input", function () {
            res3.innerHTML = p3.value;
        }, false);
        var p4 = document.getElementById("t_num_std_post-in"),
            res4 = document.getElementById("t_num_std_post-in-val");
        p4.addEventListener("input", function () {
            res4.innerHTML = p4.value;
        }, false);
        var p5 = document.getElementById("t_num_std_phd-in"),
            res5 = document.getElementById("t_num_std_phd-in-val");
        p5.addEventListener("input", function () {
            res5.innerHTML = p5.value;
        }, false);
        var p6 = document.getElementById("finalize_admission_application-in"),
            res6 = document.getElementById("finalize_admission_application-in-val");
        p6.addEventListener("input", function () {
            res6.innerHTML = p6.value;
        }, false);
        var p7 = document.getElementById("invoice_alert_days-in"),
            res7 = document.getElementById("invoice_alert_days-in-val");
        p7.addEventListener("input", function () {
            res7.innerHTML = p7.value;
        }, false);

        var p8 = document.getElementById("invoice_due_days-in"),
            res8 = document.getElementById("invoice_due_days-in-val");
        p8.addEventListener("input", function () {
            res8.innerHTML = p8.value;
        }, false);
    }
}