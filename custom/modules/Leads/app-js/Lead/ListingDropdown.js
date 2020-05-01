var EditLead = {
    //this method init the myselct class objects to Select2 JQuery plugin.
    setupSelect2: function () {
        //get a list of html elements with class mySelect and init them to Select2 dropdown
        var $theSelect = jq331('.mySelect');
        $theSelect.select2({ allowClear: true });
    },

    //this method sets up the event listeners for dropdowns
    setupSelect2DropdownEventListeners: function () {
        //first unbind any previous listeners
        jq331('#lead_source').off('select2:select');
        //select listener for Lead-Source dropdown. we enable/disable the other dropdowns
        //based on the value of Lead-Source dropdown.
        jq331('#lead_source').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id == "Sub Agent") {
                jq331('#igec_subagents_idd').prop('disabled', false);
                jq331('#subagban').hide('slow');
                jq331('#sale_agent_assigned_user_idd').prop('disabled', 'disabled');
                jq331('#sale_agent_assigned_user_idd').val('-1');
                jq331('#sale_agent_assigned_user_idd').trigger('change');
                jq331('#salesmanban').show('slow');
            } else if (data.id == 'Sales Person') {
                jq331('#sale_agent_assigned_user_idd').prop('disabled', false);
                jq331('#salesmanban').hide('slow');
                jq331('#igec_subagents_idd').prop('disabled', 'disabled');

                jq331('#igec_subagents_idd').val('-1');
                jq331('#igec_subagents_idd').trigger('change');
                jq331('#subagban').show('slow');
            } else {
                jq331('#igec_subagents_idd').prop('disabled', 'disabled');
                jq331('#igec_subagents_idd').val('-1');
                jq331('#igec_subagents_idd').trigger('change');
                jq331('#sale_agent_assigned_user_idd').val('-1');
                jq331('#sale_agent_assigned_user_idd').trigger('change');
                jq331('#subagban').show('slow');
                jq331('#sale_agent_assigned_user_idd').prop('disabled', 'disabled');
                jq331('#salesmanban').show('slow');
            }
        });
        jq331('#securitygroup_idd').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id != "") {
                jq331('#office_userr').prop('disabled', false);
                jq331('#counselorban').hide('slow');
                popolateCounselorList('office_userr',data.id);
                populateTempAssignedUser('temp_assigned_user_idd',data.id);
            }
           else {
                jq331('#office_userr').val('');
                jq331('#office_userr').text('Select');
                jq331('#office_userr').prop('disabled', 'disabled');
                jq331('#counselorban').show('slow');
            }
        });

        jq331('#desired_course_country_id').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id != "")
                jq331('#desired_course_country').val(data.text);
        });
        jq331('#desired_course_level_id').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id != "")
                jq331('#desired_course_level').val(data.text);
        });
        jq331('#desired_course_discipline_id').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id != "")
                jq331('#desired_course_discipline').val(data.text);
        });

        //first unbind any previous listeners
        jq331('#funded_by').off('select2:select');
        //select listener for Funded-By dropdown. we enable/disable Sponsor-dropdown based on 
        //the value of the Funded-By-dropdown.
        jq331('#funded_by').on('select2:select', function (e) {
            var data = e.params.data;
            if (data.id == "Sponsor") {
                jq331('#igec_sponsor_organization_id').prop('disabled', false);
                jq331('#sponsorban').hide('slow');
            } else {
                jq331('#igec_sponsor_organization_id').prop('disabled', 'disabled');
                jq331('#igec_sponsor_organization_id').val('-1');
                jq331('#igec_sponsor_organization_id').trigger('change');
                jq331('#sponsorban').show('slow');
            }
        });
    },
    fieldsDisableEnableOnLoad: function () {
        //first unbind any previous listeners
        // jq331('#lead_source').off('select2:select');

        if (jq331('#lead_source').val() == "Sub Agent") {
            jq331('#igec_subagents_idd').prop('disabled', false);
            jq331('#subagban').hide('slow');
            jq331('#sale_agent_assigned_user_idd').prop('disabled', 'disabled');
            jq331('#sale_agent_assigned_user_idd').val('-1');
            jq331('#sale_agent_assigned_user_idd').trigger('change');
            jq331('#salesmanban').show('slow');
        } else if (jq331('#lead_source').val() == 'Sales Person') {
            jq331('#sale_agent_assigned_user_idd').prop('disabled', false);
            jq331('#salesmanban').hide('slow');
            jq331('#igec_subagents_idd').prop('disabled', 'disabled');
            jq331('#igec_subagents_idd').val('-1');
            jq331('#igec_subagents_idd').trigger('change');
            jq331('#subagban').show('slow');
        } else {
            jq331('#igec_subagents_idd').prop('disabled', 'disabled');
            jq331('#igec_subagents_idd').val('-1');
            jq331('#igec_subagents_idd').trigger('change');
            jq331('#sale_agent_assigned_user_idd').val('-1');
            jq331('#sale_agent_assigned_user_idd').trigger('change');
            jq331('#subagban').show('slow');
            jq331('#sale_agent_assigned_user_idd').prop('disabled', 'disabled');
            jq331('#salesmanban').show('slow');
        }
        if (jq331('#igec_subagents_idd').val() != "") {
            jq331('#office_userr').prop('disabled', false);
            jq331('#counselorban').hide('slow');
        }
        else {
            jq331('#office_userr').val('-1');
            jq331('#office_userr').trigger('change');
            jq331('#office_userr').prop('disabled', 'disabled');

            jq331('#counselorban').show('slow');
        }
		//jq331('#igec_subagents_idd').trigger('change');
       // jq331('#temp_assigned_user_idd').trigger('change');

        //first unbind any previous listeners
        // jq331('#funded_by').off('select2:select');
        //select listener for Funded-By dropdown. we enable/disable Sponsor-dropdown based on
        //the value of the Funded-By-dropdown.
        if (jq331('#funded_by').val()== "Sponsor") {
            jq331('#igec_sponsor_organization_id').prop('disabled', false);
            jq331('#sponsorban').hide('slow');
        } else {
            jq331('#igec_sponsor_organization_id').prop('disabled', 'disabled');
            jq331('#igec_sponsor_organization_id').val('-1');
            jq331('#igec_sponsor_organization_id').trigger('change');
            jq331('#sponsorban').show('slow');
        }
    },

}
