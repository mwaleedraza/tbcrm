/*=========================================================================================
  File Name: app.js
  Description: Template related app JS.
  ----------------------------------------------------------------------------------------
  Item Name: Robust - Responsive Admin Template
  Version: 2.1
  Author: Pixinvent
  Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/

(function(window, document, $) {
    'use strict';
    var $html = jq331('html');
    var $body = jq331('body');


    jq331(window).on('load',function(){
        var rtl;
        var compactMenu = false; // Set it to true, if you want default menu to be compact

        if(jq331('html').data('textdirection') == 'rtl'){
            rtl = true;
        }

        setTimeout(function(){
            $html.removeClass('loading').addClass('loaded');
        }, 1200);

        if(typeof($.app)!='undefined' && typeof($.app.menue)!='undefined')
           $.app.menu.init(compactMenu);

        // Navigation configurations
        var config = {
            speed: 300 // set speed to expand / collpase menu
        };
        if(typeof($.app)!='undefined' && typeof($.app.nav)!='undefined' && $.app.nav.initialized === false){
            $.app.nav.init(config);
        }

        Unison.on('change', function(bp) {
            $.app.menu.change();
        });

        // Tooltip Initialization
        jq331('[data-toggle="tooltip"]').tooltip({
            container:'body'
        });

        // Top Navbars - Hide on Scroll
        if (jq331(".navbar-hide-on-scroll").length > 0) {
            jq331(".navbar-hide-on-scroll.fixed-top").headroom({
              "offset": 205,
              "tolerance": 5,
              "classes": {
                 // when element is initialised
                initial : "headroom",
                // when scrolling up
                pinned : "headroom--pinned-top",
                // when scrolling down
                unpinned : "headroom--unpinned-top",
              }
            });
            // Bottom Navbars - Hide on Scroll
            jq331(".navbar-hide-on-scroll.fixed-bottom").headroom({
              "offset": 205,
              "tolerance": 5,
              "classes": {
                 // when element is initialised
                initial : "headroom",
                // when scrolling up
                pinned : "headroom--pinned-bottom",
                // when scrolling down
                unpinned : "headroom--unpinned-bottom",
              }
            });
        }

        //Match content & menu height for content menu
        setTimeout(function(){
            if(jq331('body').hasClass('vertical-content-menu')){
                setContentMenuHeight();
            }
        },500);
        function setContentMenuHeight(){
            var menuHeight = jq331('.main-menu').height();
            var bodyHeight = jq331('.content-body').height();
            if(bodyHeight<menuHeight){
                jq331('.content-body').css('height',menuHeight);
            }
        }

        // Collapsible Card
        jq331('a[data-action="collapse"]').on('click',function(e){
            e.preventDefault();
            jq331(this).closest('.card').children('.card-content').collapse('toggle');
            jq331(this).closest('.card').find('[data-action="collapse"] i').toggleClass('ft-minus ft-plus');

        });

        // Toggle fullscreen
        jq331('a[data-action="expand"]').on('click',function(e){
            e.preventDefault();
            jq331(this).closest('.card').find('[data-action="expand"] i').toggleClass('ft-maximize ft-minimize');
            jq331(this).closest('.card').toggleClass('card-fullscreen');
        });

        //  Notifications & messages scrollable
        if(jq331('.scrollable-container').length > 0){
            jq331('.scrollable-container').perfectScrollbar({
                theme:"dark"
            });
        }

        // Reload Card
        jq331('a[data-action="reload"]').on('click',function(){
            var block_ele = jq331(this).closest('.card');

            // Block Element
            block_ele.block({
                message: '<div class="ft-refresh-cw icon-spin font-medium-2"></div>',
                timeout: 2000, //unblock after 2 seconds
                overlayCSS: {
                    backgroundColor: '#FFF',
                    cursor: 'wait',
                },
                css: {
                    border: 0,
                    padding: 0,
                    backgroundColor: 'none'
                }
            });
        });

        // Close Card
        jq331('a[data-action="close"]').on('click',function(){
            jq331(this).closest('.card').removeClass().slideUp('fast');
        });

        // Match the height of each card in a row
        setTimeout(function(){
            jq331('.row.match-height').each(function() {
                jq331(this).find('.card').not('.card .card').matchHeight(); // Not .card .card prevents collapsible cards from taking height
            });
        },500);


        jq331('.card .heading-elements a[data-action="collapse"]').on('click',function(){
            var $this = jq331(this),
            card = $this.closest('.card');
            var cardHeight;

            if(parseInt(card[0].style.height,10) > 0){
                cardHeight = card.css('height');
                card.css('height','').attr('data-height', cardHeight);
            }
            else{
                if(card.data('height')){
                    cardHeight = card.data('height');
                    card.css('height',cardHeight).attr('data-height', '');
                }
            }
        });

        // Add open class to parent list item if subitem is active except compact menu
        var menuType = $body.data('menu');
        if(menuType != 'vertical-compact-menu' && menuType != 'horizontal-menu' && compactMenu === false ){
            if( $body.data('menu') == 'vertical-menu-modern' ){
                if( localStorage.getItem("menuLocked") === "true"){
                    jq331(".main-menu-content").find('li.active').parents('li').addClass('open');
                }
            }
            else{
                jq331(".main-menu-content").find('li.active').parents('li').addClass('open');
            }
        }
        if(menuType == 'vertical-compact-menu' || menuType == 'horizontal-menu'){
            jq331(".main-menu-content").find('li.active').parents('li:not(.nav-item)').addClass('open');
            jq331(".main-menu-content").find('li.active').parents('li').addClass('active');
        }

        //card heading actions buttons small screen support
        jq331(".heading-elements-toggle").on("click",function(){
            jq331(this).parent().children(".heading-elements").toggleClass("visible");
        });

        //  Dynamic height for the chartjs div for the chart animations to work
        var chartjsDiv = jq331('.chartjs'),
        canvasHeight = chartjsDiv.children('canvas').attr('height');
        chartjsDiv.css('height', canvasHeight);

        if($body.hasClass('boxed-layout')){
            if($body.hasClass('vertical-overlay-menu') || $body.hasClass('vertical-compact-menu')){
               var menuWidth= jq331('.main-menu').width();
               var contentPosition = jq331('.app-content').position().left;
               var menuPositionAdjust = contentPosition-menuWidth;
               if($body.hasClass('menu-flipped')){
                    jq331('.main-menu').css('right',menuPositionAdjust+'px');
               }else{
                    jq331('.main-menu').css('left',menuPositionAdjust+'px');
               }
            }
        }

        jq331('.nav-link-search').on('click',function(){
            var $this = jq331(this),
            searchInput = jq331(this).siblings('.search-input');

            if(searchInput.hasClass('open')){
                searchInput.removeClass('open');
            }
            else{
                searchInput.addClass('open');
            }
        });
    });


    jq331(document).on('click', '.menu-toggle, .modern-nav-toggle', function(e) {
        e.preventDefault();

        // Toggle menu
        $.app.menu.toggle();

        setTimeout(function(){
            jq331(window).trigger( "resize" );
        },200);

        if(jq331('#collapsed-sidebar').length > 0){
            setTimeout(function(){
                if($body.hasClass('menu-expanded') || $body.hasClass('menu-open')){
                    jq331('#collapsed-sidebar').prop('checked', false);
                }
                else{
                    jq331('#collapsed-sidebar').prop('checked', true);
                }
            },1000);
        }

        return false;
    });

    /*jq331('.modern-nav-toggle').on('click',function(){
        var $this = jq331(this),
        icon = $this.find('.toggle-icon').attr('data-ticon');

        if(icon == 'ft-toggle-right'){
            $this.find('.toggle-icon').attr('data-ticon','ft-toggle-left')
            .removeClass('ft-toggle-right').addClass('ft-toggle-left');
        }
        else{
            $this.find('.toggle-icon').attr('data-ticon','ft-toggle-right')
            .removeClass('ft-toggle-left').addClass('ft-toggle-right');
        }

        $.app.menu.toggle();
    });*/

    jq331(document).on('click', '.open-navbar-container', function(e) {

        var currentBreakpoint = Unison.fetch.now();

        // Init drilldown on small screen
        $.app.menu.drillDownMenu(currentBreakpoint.name);

        // return false;
    });

    jq331(document).on('click', '.main-menu-footer .footer-toggle', function(e) {
        e.preventDefault();
        jq331(this).find('i').toggleClass('pe-is-i-angle-down pe-is-i-angle-up');
        jq331('.main-menu-footer').toggleClass('footer-close footer-open');
        return false;
    });

    // Add Children Class
    jq331('.navigation').find('li').has('ul').addClass('has-sub');

    jq331('.carousel').carousel({
      interval: 2000
    });

    // Page full screen
    jq331('.nav-link-expand').on('click', function(e) {
        if (typeof screenfull != 'undefined'){
            if (screenfull.enabled) {
                screenfull.toggle();
            }
        }
    });
    if (typeof screenfull != 'undefined'){
        if (screenfull.enabled) {
            jq331(document).on(screenfull.raw.fullscreenchange, function(){
                if(screenfull.isFullscreen){
                    jq331('.nav-link-expand').find('i').toggleClass('ft-minimize ft-maximize');
                }
                else{
                    jq331('.nav-link-expand').find('i').toggleClass('ft-maximize ft-minimize');
                }
            });
        }
    }

    jq331(document).on('click', '.mega-dropdown-menu', function(e) {
        e.stopPropagation();
    });

    jq331(document).ready(function(){

        /**********************************
        *   Form Wizard Step Icon
        **********************************/
        jq331('.step-icon').each(function(){
            var $this = jq331(this);
            if($this.siblings('span.step').length > 0){
                $this.siblings('span.step').empty();
                jq331(this).appendTo(jq331(this).siblings('span.step'));
            }
        });
    });

    // Update manual scroller when window is resized
    jq331(window).resize(function() {
        $.app.menu.manualScroller.updateHeight();
    });

    // TODO : Tabs dropdown fix, remove this code once fixed in bootstrap 4.
    jq331('.nav.nav-tabs a.dropdown-item').on('click',function(){
        var $this = jq331(this),
        href = $this.attr('href');
        var tabs = $this.closest('.nav');
        tabs.find('.nav-link').removeClass('active');
        $this.closest('.nav-item').find('.nav-link').addClass('active');
        $this.closest('.dropdown-menu').find('.dropdown-item').removeClass('active');
        $this.addClass('active');
        tabs.next().find(href).siblings('.tab-pane').removeClass('active in').attr('aria-expanded',false);
        jq331(href).addClass('active in').attr('aria-expanded','true');
    });

    jq331('#sidebar-page-navigation').on('click', 'a.nav-link', function(e){
        e.preventDefault();
        e.stopPropagation();
        var $this = jq331(this),
        href= $this.attr('href');
        var offset = jq331(href).offset();
        var scrollto = offset.top - 80; // minus fixed header height
        jq331('html, body').animate({scrollTop:scrollto}, 0);
        setTimeout(function(){
            $this.parent('.nav-item').siblings('.nav-item').children('.nav-link').removeClass('active');
            $this.addClass('active');
        }, 100);
    });

})(window, document, jQuery);