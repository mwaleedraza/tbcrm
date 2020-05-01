// var salesStages = ['Prospecting', 'In Progress', 'Offer Acceptance', 'Enrolled', 'Visa Process', 'Traveled', 'Commenced', 'Pipeline', 'Duplicate Dropped', 'Closed Won', 'Closed Lost'];

var salesStages =SUGAR.language.get('app_list_strings', 'sales_stage_dom');
//application_status_list

var ss_Prospecting = {"Prospecting_Not Filed": "Not Filed"};
var ss_InProgress = {"In Progress_Application Lodged": "Application Lodged","In Progress_Acknowledgment Received": "Acknowledgment Received","In Progress_Application Pending": "Application Pending","In Progress_Offer Approved Conditional": "Offer Approved Conditional","In Progress_Offer Approved Unconditional": "Offer Approved Unconditional","In Progress_Offer Deferred": "Offer Deferred" ,"In Progress_Offer Rejected": "Offer Rejected"}
var ss_OfferAcceptance = {"Offer Acceptance_Acceptance Form Deferred": "Acceptance Form Deferred","Offer Acceptance_Acceptance Form Issued": "Acceptance Form Issued","Offer Acceptance_Acceptance Form Requested": "Acceptance Form Requested","Offer Acceptance_Offer Accepted": "Offer Accepted"};
var ss_Enrolled = {"Enrolled_Enrolled":"Enrolled"};
var ss_VisaProcess = {"Visa Process_Visa Applied": "Visa Applied","Visa Process_Visa Pending": "Visa Pending","Visa Process_Visa Issued": "Visa Issued","Visa Process_Visa Rejected": "Visa Rejected"};
var ss_Traveled = {"Traveled_Traveled": "Traveled"};
var ss_Commenced = {"Commenced_Commenced": "Commenced"};
var ss_Pipeline = {"Pipeline_1st Commencement": "1st Commencement" ,"Pipeline_2nd Commencement": "2nd Commencement","Pipeline_3rd Commencement": "3rd Commencement","Pipeline_4th Commencement": "4th Commencement"};
var ss_DuplicateDropped = {"Duplicate Dropped_Duplicate Dropped": "Duplicate Dropped"};
var ss_ClosedWon = {"Closed Won_Closed Won": "Closed Won"};
var ss_ClosedLost = {"Closed Lost_Closed Lost": "Closed Lost"};

var OppPopup = {

    setupStatusDropdowns: function () {
        jq331('#Sales-StageDDS').select2({});
        jq331('#Application-StatusDDS').select2({});
        //add all Sales stages to the Dropdown
        jQuery.each(salesStages, function(index, item) {
            // do something with `item` (or `this` is also `item` if you like)
            var dataSS = {
                id: index,
                text: item
            };
            var newOption = new Option(dataSS.text, dataSS.id, false, false);
            jq331('#Sales-StageDDS').append(newOption).trigger('change');
        });

        //event listener to the Sales Stage such that on-selection of Sales Stage, the Application-Status DD changes
        jq331('#Sales-StageDDS').on("select2:select", function (event) {

            OppPopup.salesStageSelected();
        });
        //event listener to the Application-Status DD 
        jq331('#Application-StatusDDS').on("select2:select", function (event) {
            OppPopup.applicationStatusSelected();
        });
        jq331('#Application-StatusDDS').on("change", function (event) {
            OppPopup.applicationStatusSelected();
        });
        //set the current values (previously save)
        OppPopup.setCurrentValues();
    },

    salesStageSelected: function () {
        // check what sales-stage is selected and update the Application-Status accordingly
        var selectedSalesStage = jq331("#Sales-StageDDS option:selected").val()
        var appsel = jq331('#Application-StatusDDS');
        appsel.empty();
        jq331('.secondarydiv').hide();
        if (selectedSalesStage == 'Prospecting') {
            jQuery.each(ss_Prospecting, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
                OppPopup.applicationStatusSelected();
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'In Progress') {
            jQuery.each(ss_InProgress, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Offer Acceptance') {
            jQuery.each(ss_OfferAcceptance, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Enrolled') {
            jQuery.each(ss_Enrolled, function(index, item) {
                data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Visa Process') {
            jQuery.each(ss_VisaProcess, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Traveled') {
            jQuery.each(ss_Traveled, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Commenced') {
            jQuery.each(ss_Commenced, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Pipeline') {
            jQuery.each(ss_Pipeline, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Duplicate Dropped') {
            jQuery.each(ss_DuplicateDropped, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Closed Won') {
            jQuery.each(ss_ClosedWon, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        } else if (selectedSalesStage == 'Closed Lost') {
            jQuery.each(ss_ClosedLost, function(index, item) {
                var data = {
                    id: index,
                    text: item
                };
                var newOption = new Option(data.text, data.id, false, false);
                jq331('#Application-StatusDDS').append(newOption).trigger('change');
            });
            // jq331('#Application-StatusDDS').trigger({
            //     type: 'select2:select',
            //     params: {
            //         data: data
            //     }
            // });
        }
    },

    applicationStatusSelected: function () {
        //first hide all secondary divs
        jq331('.secondarydiv').hide();

        // check what sales-stage is selected and update the Application-Status accordingly
        var selectedAppStatus = jq331("#Application-StatusDDS option:selected").val();

        if (selectedAppStatus) {
            if (selectedAppStatus == 'In Progress_Offer Approved Conditional') {
                jq331('#offcondiv').show('slow');
                return;
            } else if (selectedAppStatus == 'Offer Acceptance_Acceptance Form Requested') {
                jq331('#accFormTypeDiv').show('slow');
            } else if (selectedAppStatus == 'Traveled_Traveled') {
                jq331('#travelDateDiv').show('slow');
            } else if (selectedAppStatus == 'Commenced_Commenced') {
                jq331('#commenceDateDiv').show('slow');
            } else if (selectedAppStatus.includes('Commencement') == true) {
                jq331('#expStDateDiv').show('slow');
            }
        };
    },

    setCurrentValues: function () {
        var currentSalesSt = jq331('#Sales-Stage').text();
        var acceptance_form_type = jq331('#acceptance_form_type').text();
        var currentAppStat = jq331('#Application-Status').text();
        var currentAppStatText = jq331('#Application-Status-text').text();
        jq331('#currslstg').text(currentSalesSt.trim());
        jq331('#Sales-StageDDS').val(currentSalesSt.trim());
        OppPopup.salesStageSelected();
        jq331('#curappstat').text(currentAppStatText.trim());
        jq331('#Application-StatusDDS').val(currentAppStat.trim()).trigger('select');
        OppPopup.applicationStatusSelected();
        jq331('#Acceptance-Form-TypeDD').val(acceptance_form_type);

    }
}