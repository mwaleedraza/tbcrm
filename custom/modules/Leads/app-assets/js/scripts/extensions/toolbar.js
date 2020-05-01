/*=========================================================================================
	File Name: toolbar.js
	Description: A jQuery plugin that creates tooltip style toolbars
	----------------------------------------------------------------------------------------
	Item Name: Robust - Responsive Admin Template
	Version: 2.1
	Author: PIXINVENT
	Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/
jq331(document).ready(function () {

    // Define any icon actions before calling the toolbar
    jq331('.toolbar-icons a').on('click', function (event) {
        event.preventDefault();
    });

    jq331('div[data-toolbar="user-options"]').toolbar({
        content: '#user-options',
        position: 'top',
    });

    jq331('div[data-toolbar="transport-options"]').toolbar({
        content: '#transport-options',
        position: 'top',
    });

    jq331('div[data-toolbar="transport-options-o"]').toolbar({
        content: '#transport-options-o',
        position: 'bottom',
        event: 'click',
        hideOnClick: true,
    });

    jq331('div[data-toolbar="content-option"]').toolbar({
        content: '#transport-options',
    });

    jq331('div[data-toolbar="position-option"]').toolbar({
        content: '#transport-options',
        position: 'bottom',
    });

    jq331('div[data-toolbar="style-option"]').toolbar({
        content: '#transport-options',
        position: 'bottom',
        style: 'primary',
    });

    jq331('div[data-toolbar="animation-option"]').toolbar({
        content: '#transport-options',
        position: 'bottom',
        style: 'primary',
        animation: 'flyin'
    });

    jq331('div[data-toolbar="event-option"]').toolbar({
        content: '#transport-options',
        position: 'bottom',
        style: 'primary',
        event: 'click',
    });

    jq331('div[data-toolbar="hide-option"]').toolbar({
        content: '#transport-options',
        position: 'bottom',
        style: 'primary',
        event: 'click',
        hideOnClick: true
    });

    jq331('#link-toolbar').toolbar({
        content: '#user-options',
        position: 'top',
        event: 'click',
        adjustment: 35
    });

    jq331('div[data-toolbar="set-01"]').toolbar({
        content: '#set-01-options',
        position: 'top',
    });

    jq331('div[data-toolbar="set-02"]').toolbar({
        content: '#set-02-options',
        position: 'left',
    });

    jq331('div[data-toolbar="set-03"]').toolbar({
        content: '#set-03-options',
        position: 'right',
    });

    jq331('div[data-toolbar="set-04"]').toolbar({
        content: '#set-04-options',
        position: 'right',
    });

    jq331(".download").on('click', function () {
        mixpanel.track("Toolbar.Download");
    });

    jq331("#transport-options-2").find('a').on('click', function () {
        $this = jq331(this);
        $button = jq331('div[data-toolbar="transport-options-2"]');
        $newClass = $this.find('i').attr('class').substring(3);
        $oldClass = $button.find('i').attr('class').substring(3);
        if ($newClass != $oldClass) {
            $button.find('i').animate({
                top: "+=50",
                opacity: 0
            }, 200, function () {
                jq331(this).removeClass($oldClass).addClass($newClass).css({
                    top: "-=100",
                    opacity: 1
                }).animate({
                    top: "+=50"
                });
            });
        }

    });

    jq331('div[data-toolbar="transport-options-2"]').toolbar({
        content: '#transport-options-2',
        position: 'top',
    });

});