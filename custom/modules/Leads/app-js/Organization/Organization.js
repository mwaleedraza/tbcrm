var Organization = {
    registerForEvents: function () {
        //event handler for the Save button to create New Staff
        jq331('#newOrgStaffBtn').click(function () {
            //TODO: validate the Create-New-Staff form and call the CRM to save data
        });

        //event handler for the Staff button in each row of organizations-table
        jq331('.orgstaffbtn').click(function () {
            var orgIdToManageStaff = jq331(this).attr('data-orgid');
            jq331('#manageOrgStaffForm').modal('show');
        });

        //event handler for the Edit-Organization button in each row of organizations-table
        jq331('.editorgbtn').click(function () {
            var orgIdToEdit = jq331(this).attr('data-orgid');
            jq331('#createOrgForm').modal('show');
            //TODO: based on the orgIdToEdit parameter, use JS to set values of the fields in
            //the Opportunity Popup windows
        });
        //event handler for the Add-Organization button
        jq331('#addorgbtn').click(function () {
            jq331('#createOrgForm').modal('show');
        });
        //event handler for Staff delete icon
        jq331('.delstaff').click(function () {
            var staffid = jq331(this).attr('data-staffid');
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                //proceed with CRM delete call

                //if delete to crm is ok, remove from fontend as well
                jq331(this).parent().parent().remove();
            })
        });
    }
}