/*=========================================================================================
    File Name: components-modal.js
    Description: Modals are streamlined, but flexible, dialog prompts with the minimum 
				required functionality and smart defaults.
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Template
    Version: 2.1
    Author: Pixinvent
    Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function(window, document, $) {
	'use strict';

     // onShow event
    jq331('#onshowbtn').on('click', function() {
        jq331('#onshow').on('show.bs.modal', function() {
            alert('onShow event fired.');
        });
    });

    // onShown event
    jq331('#onshownbtn').on('click', function() {
        jq331('#onshown').on('shown.bs.modal', function() {
            alert('onShown event fired.');
        });
    });

    // onHide event
    jq331('#onhidebtn').on('click', function() {
        jq331('#onhide').on('hide.bs.modal', function() {
            alert('onHide event fired.');
        });
    });

    // onHidden event
    jq331('#onhiddenbtn').on('click', function() {
        jq331('#onhidden').on('hidden.bs.modal', function() {
            alert('onHidden event fired.');
        });
    });
})(window, document, jQuery);