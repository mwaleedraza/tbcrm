var StudentExp = {
    setupWorkExperienceEventListeners: function () {
        //event listener for Work-Exp Edit icon
        jq331('.stExpEdit').click(function () {
            StudentExp.editWorkExpClicked(this);
        });
        //event listener for Work-Exp Delete icon
        jq331('.stExpDel').click(function () {
            StudentExp.deleteWorkExpClicked(this);
        });
    },

    deleteWorkExpClicked: function (obj) {
        var workExpIdToDelete = jq331(obj).attr('data-work-exp-id');
        swal({
            title: "Are you sure?",
            text: "Please click OK to delete the Work Experience!",
            icon: "error",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                //call to crm to delete the Work Experience using variable workExpIdToDelete
            } else {

            }
        });
    },

    editWorkExpClicked: function (obj) {
        var workExpIdToEdit = jq331(obj).attr('data-work-exp-id');
        // the workExpIdToEdit contains the id of the qual to edit. get all the
        //fields of this Work-Experience and populate the modal dialog fields. 
        //TODO

        //finall popup the Edit WorkExp dialog
        jq331('#createExpForm').modal('show');
    }
}