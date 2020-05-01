var LangTest = {
    setupLangTestEventListeners: function () {
        //event listener for Skill Edit icon
        jq331('.stLangTestEdit').click(function () {
            LangTest.editLangTestClicked(this);
        });
        //event listener for Skill Delete icon
        jq331('.stLangTestDel').click(function () {
            LangTest.deleteLangTestClicked(this);
        });
    },

    deleteLangTestClicked: function (obj) {
        var workLangTestIdToDelete = jq331(obj).attr('data-langtest-id');
        swal({
            title: "Are you sure?",
            text: "Please click OK to delete the Language Test!",
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

    editLangTestClicked: function (obj) {
        var workLangTestIdToEdit = jq331(obj).attr('data-langtest-id');
        // the workLangTestIdToEdit contains the id of the Language Test to edit. get all the
        //fields of this Language Test and populate the modal dialog fields. 
        //TODO

        //finall popup the Edit WorkExp dialog
        jq331('#createLangTestForm').modal('show');
    }
}