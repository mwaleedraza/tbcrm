var SubAgents = {
    showDetails: function (obj) {
        $('#myModalLabe501').text('View Sub-Agent Details');
        var subAgId = $(obj).attr('data-subAgentId');
        $('#agtabdiv').addClass('disabled1');
        $('#newSubAgForm').modal('show');
        alert('CRM Developer to populate the data for the selected SubAgent to let user VIEW it - Readonly');
    },
    editSubAgentClicked: function (obj) {
        $('#myModalLabe501').text('Edit Sub-Agent Details');
        var subAgId = $(obj).attr('data-subAgentId');
        $('#agtabdiv').addClass('disabled1');
        $('#newSubAgForm').modal('show');
        alert('CRM Developer to populate the data for the selected SubAgent to let user EDIT it');
        alert(subAgId + ' > edit');
    },

    manageStaffClicked: function (obj) {
        var subAgId = $(obj).attr('data-subAgentId');
        alert('Not Implemneted yet..');
    },

    manageFeedbackClicked: function (obj) {
        var subAgId = $(obj).attr('data-subAgentId');
        alert('Not Implemneted yet..');
    },

    //************************************************************************** 
    //New Sub-Agent related JS code
    //**************************************************************************
    //this function is invoked when we load the SubAgents listing page. it sets up the event listeners etc.
    setupNewSubAgentElements: function () {
        //event handler for the + icon, click will open a modal dialog where user can define new SubAgent
        $('#addsubagbtn').click(function () {
            $('#myModalLabe501').text('New Sub-Agent');
            $('#agtabdiv').addClass('disabled1');
            $('#newSubAgForm').modal('show');
        });
        //when the New SubAgent popup dialog closes, we remove the Dim from the background div
        $('#newSubAgForm').on('hidden.bs.modal', function () {
            $('#agtabdiv').removeClass('disabled1');
        })
    },
    //************************************************************************** 
    //Sub-Agent Commissions related JS code
    //************************************************************************** 
    //this function is invoked when we load the SubAgents listing page
    setupSubAgentCommissionElements: function () {
        //setup the DataTables for Existing Commissions in the grid
        $('#existingCommTab').DataTable({});
        //setup the Dropdowns in the Manage-Commission section
        $('#inst-in').select2();
        $('#level-in').select2();
        $('#calmethod-in').select2();
        //event handler for the red-color x icon which will close the Commissions area and bring the user back to the Agent Listing screen
        $('#closecommdivbtn').click(function () {
            $('#commdiv2').hide();
            $('#agtabdiv').removeClass('disabled1');
            animateScrollTo(document.querySelector('#agtabdiv'));
        });
        //event handler for the Save button in the New Commission div
        $('#saveAgCommBtn').click(function () {
            alert('something for CRM developer');
        });
    },

    //this function is invoked when the user clicks the 'Commissions' button for a SubAgent row 
    //in the Sub-Agent grid
    manageCommissionsClicked: function (obj) {
        var subAgId = $(obj).attr('data-subAgentId');
        $('#commdiv2').show();
        $('#agtabdiv').addClass('disabled1');
        animateScrollTo(document.querySelector('#commdiv2'));
    }
}