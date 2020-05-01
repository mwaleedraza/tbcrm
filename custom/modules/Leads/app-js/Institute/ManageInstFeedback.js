var ManageInstFeedback = {
    manageFeedbackClicked: function (obj) {
        var accountId = $(obj).attr('data-instId');
        var accountName = $(obj).attr('data-instName');
        if (accountName) {
            $('#instNameHd').text(accountName);
        }
        //now that we have the account Id, call to CRM to fetch the Counselor Feedback data for the selected Account(Institute)
        //and show the popup dialog 'Manage Feedback' - prepopulated with the data we get from CRM.
        //for now i am using Feedback dummy data defined below, in real life, it will come from CRM
        $('#moredatadivwrapper').show();
        $('#institutesTabDiv').addClass('disabled1'); //disable the clicks on the rest of the page and dim it
        $('#moredatadiv').append('<h3 class="info">Manage Feedback</h3>');
        $('#moredatadiv').append('<table id="FeedbackTab" class="table table-striped table-bordered" width="100%"></table >');
        //DataTable with two columns. First Column merges the CRM Feedback Module's 'name', 'date_entered' and 'created_by_name' fields.
        //the second column maps to the CRM Feedback Module's 'description' field.

        jq331('#FeedbackTab').DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "index.php?module=igec_manage_feedback&action=igec_manage_feedbackPaging&sugar_body_only=true&account_id="+accountId,
                "data": function ( data ) {
                }
            },
            columns: [
                {
                    data: "feedBackname",
                    title: "Title",
                    width: "25%",
                    className: 'w-25',
                    mRender: function (data, type, full) {
                        if(full['createdUserFName']==null)
                            full['createdUserFName']='';
                        if(full['createdUserLName']==null)
                            full['createdUserLName']='';

                        return '<span class="info">' + data + '</span><br/>' +
                            '<span style="padding: 2px;"><i class="fa fa-clock-o success">&nbsp;</i><span style="font-size:small;">' + full["date_entered"] + '</span></span><br/>' +
                            '<span style="padding:2px;"><i class="fa fa-user success"></i>&nbsp;<span>' + full["createdUserFName"] + full["createdUserLName"] + '</span></span>';
                    }
                },
                {
                    data: "description",
                    title: "Notes by Counselor",
                    width: "70%"
                }
            ]
        } );
        animateScrollTo(document.querySelector('#moredatadivwrapper'));
    },

}
