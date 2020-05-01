/*=========================================================================================
		File Name: form-repeater.js
		Description: Repeat forms or form fields
		----------------------------------------------------------------------------------------
		Item Name: Robust - Responsive Admin Template
		Version: 2.1
		Author: PIXINVENT
		Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

(function(window, document, jq331) {
	'use strict';

	// Default
	jq331('.repeater-default').repeater(
		ready: function (setIndexes) {
                jq331dragAndDrop.on('drop', setIndexes);
            }
	);

	// Custom Show / Hide Configurations
	jq331('.file-repeater, .contact-repeater').repeater({
		show: function () {
			jq331(this).slideDown();
		},
		hide: function(remove) {
			if (confirm('Are you sure you want to remove this item?')) {
				jq331(this).slideUp(remove);
			}
		}
	});


})(window, document, jQuery);