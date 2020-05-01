var StudentSkill = {
    setupSkillsEventListeners: function () {
        //event listener for Skill Edit icon
        jq331('.stSkillEdit').click(function () {
            StudentSkill.editSkillClicked(this);
        });
        //event listener for Skill Delete icon
        jq331('.stSkillDel').click(function () {
            StudentSkill.deleteSkillClicked(this);
        });
    },

    deleteSkillClicked: function (obj) {
        var skillIdToDelete = jq331(obj).attr('data-skill-id');
        swal({
            title: "Are you sure?",
            text: "Please click OK to delete the Skill!",
            icon: "error",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                //call to crm to delete the Skill using variable skillIdToDelete value
            } else {

            }
        });
    },

    editSkillClicked: function (obj) {
        var workSkillIdToEdit = jq331(obj).attr('data-skill-id');
        // the workSkillIdToEdit contains the id of the skill to edit. get all the
        //fields of this Skill and populate the modal dialog fields. 
        //TODO

        //finall popup the Edit WorkExp dialog
        jq331('#createSkillForm').modal('show');
    },


}