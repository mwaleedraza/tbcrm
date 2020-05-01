var StudentAward = {
    setupAwardEventListeners: function () {
        //event listener for award Edit icon
        jq331('.stAwardEdit').click(function () {
            StudentAward.editAwardClicked(this);
        });
        //event listener for award Delete icon
        jq331('.stAwardDel').click(function () {
            StudentAward.deleteAwardClicked(this);
        });
    },

    deleteAwardClicked: function (obj) {
        var awardIdToDelete = jq331(obj).attr('data-award-id');
        swal({
            title: "Are you sure?",
            text: "Please click OK to delete the Award!",
            icon: "error",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                //call to crm to delete the Award using variable awardIdToDelete
            } else {

            }
        });
    },

    editAwardClicked: function (obj) {
        var workLangTestIdToEdit = jq331(obj).attr('data-award-id');
        // the workLangTestIdToEdit contains the id of the Award to edit. get all the
        //fields of this Award and populate the modal dialog fields. 
        //TODO

        //finall popup the Edit WorkExp dialog
        jq331('#createAwardForm').modal('show');
    }
}