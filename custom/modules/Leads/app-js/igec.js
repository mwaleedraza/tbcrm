var igec={
	blockFullPage: function () {
        jq331.blockUI({
            message: '<div class="semibold crmcss"><span class="fa fa-refresh icon-spin text-left"></span>&nbsp; Loading ...</div>',
            fadeIn: 1000,
            fadeOut: 1000,
            timeout: 20000, //unblock after 20 seconds
            overlayCSS: {
                backgroundColor: '#FFF',
                opacity: 0.8,
                cursor: 'wait'
            },
            css: {
                border: 0,
                padding: 0,
                backgroundColor: 'transparent'
            }
        });
    },
}