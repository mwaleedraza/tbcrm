var StudentQual = {
    setupQualEventListeners: function () {
        //event listener for Qual Edit icon
        jq331('.stQualEdit').click(function () {
            StudentQual.editQualClicked(this);
        });
        //event listener for Qual Delete icon
        jq331('.stQualDel').click(function () {
            StudentQual.deleteQualClicked(this);
        });
    },

    deleteQualClicked: function (obj) {
        var qualIdToDelete = jq331(obj).attr('data-qualid');
        swal({
            title: "Are you sure?",
            text: "Please click OK to delete the Qualification!",
            icon: "error",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                //call to crm to delete the Qual using variable qualIdToDelete
            } else {

            }
        });
    },

    editQualClicked: function (obj) {
        var qualIdToEdit = jq331(obj).attr('data-qualid');
        // the qualIdToEdit contains the id of the qual to edit. get all the
        //fields of this Qual and populate the modal dialog fields. 
        //TODO

        //finall popup the Edit Qual dialog
        jq331('#createQualForm').modal('show');
    }
}