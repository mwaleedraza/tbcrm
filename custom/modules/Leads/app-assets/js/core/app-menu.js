/*=========================================================================================
  File Name: app-menu.js
  Description: Menu navigation, custom scrollbar, hover scroll bar, multilevel menu
  initialization and manipulations
  ----------------------------------------------------------------------------------------
  Item Name: Robust - Responsive Admin Template
  Version: 2.1
  Author: Pixinvent
  Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function(window, document, $) {
  'use strict';

  $.app = $.app || {};

  var $body       = jq331('body');
  var $window     = jq331( window );
  var menuWrapper_el = jq331('div[data-menu="menu-wrapper"]').html();
  var menuWrapperClasses = jq331('div[data-menu="menu-wrapper"]').attr('class');

  // Main menu
  $.app.menu = {
    expanded: null,
    collapsed: null,
    hidden : null,
    container: null,
    horizontalMenu: false,

    manualScroller: {
      obj: null,

      init: function() {
        var scroll_theme = (jq331('.main-menu').hasClass('menu-dark')) ? 'light' : 'dark';
        this.obj = jq331(".main-menu-content").perfectScrollbar({
          suppressScrollX: true,
          theme: scroll_theme
        });
      },

      update: function() {
        if (this.obj) {
          // Scroll to currently active menu on page load if data-scroll-to-active is true
          if(jq331('.main-menu').data('scroll-to-active') === true){
              var position;
              if( jq331(".main-menu-content").find('li.active').parents('li').length > 0 ){
                position = jq331(".main-menu-content").find('li.active').parents('li').last().position();
              }
              else{
                position = jq331(".main-menu-content").find('li.active').position();
              }
              setTimeout(function(){
                // $.app.menu.container.scrollTop(position.top);
                if(position !== undefined){
                  $.app.menu.container.stop().animate({scrollTop:position.top}, 300);
                }
                jq331('.main-menu').data('scroll-to-active', 'false');
              },300);
          }
          jq331(".main-menu-content").perfectScrollbar('update');
        }
      },

      enable: function() {
        this.init();
      },

      disable: function() {
        if (this.obj) {
          jq331('.main-menu-content').perfectScrollbar('destroy');
        }
      },

      updateHeight: function(){
        if( ($body.data('menu') == 'vertical-menu' || $body.data('menu') == 'vertical-overlay-menu' ) && jq331('.main-menu').hasClass('menu-fixed')){
          jq331('.main-menu-content').css('height', jq331(window).height() - jq331('.header-navbar').height() - jq331('.main-menu-header').outerHeight() - jq331('.main-menu-footer').outerHeight() );
          this.update();
        }
      }
    },

    mMenu: {
      obj: null,

      init: function(){
        jq331(".main-menu").mmenu({
          slidingSubmenus: true,
          offCanvas: false,
          counters    : false,
          navbar      : {
            title     : ''
          },
          navbars     : [
            {
              position  : 'top',
              content   : ['searchfield']
            }
          ],
          searchfield   : {
            resultsPanel  : true
          },
          setSelected   : {
            parent      : true
          }
        },
          {
            // configuration
            classNames: {
                divider: "navigation-header",
                selected: "active"
            },
            searchfield   : {
              clear : true
            }
          }
        );

        jq331('a.mm-next').addClass('mm-fullsubopen');

        // Assign menu to API variable
        this.obj = jq331(".main-menu").data( "mmenu" );
      },

      enable: function(){
        this.init();
      },
      disable: function(){
      }
    },

    init: function(compactMenu) {
      if(jq331('.main-menu-content').length > 0){
        this.container = jq331('.main-menu-content');

        var menuObj = this;
        var defMenu = '';

        if(compactMenu === true){
          defMenu = 'collapsed';
        }

        this.change(defMenu);
      }
      else{
        // For 1 column layout menu won't be initialized so initiate drill down for mega menu

        // Drill down menu
        // ------------------------------
        this.drillDownMenu();
      }

      /*if(defMenu === 'collapsed'){
        this.collapse();
      }*/
    },

    drillDownMenu: function(screenSize){
      if(jq331('.drilldown-menu').length){
        if(screenSize == 'sm' || screenSize == 'xs'){
          if(jq331('#navbar-mobile').attr('aria-expanded') == 'true'){

            jq331('.drilldown-menu').slidingMenu({
              backLabel:true
            });
          }
        }
        else{
          jq331('.drilldown-menu').slidingMenu({
            backLabel:true
          });
        }
      }
    },

    change: function(defMenu) {
      var currentBreakpoint = Unison.fetch.now(); // Current Breakpoint

      this.reset();

      var menuType = $body.data('menu');

      if (currentBreakpoint) {
        switch (currentBreakpoint.name) {
          case 'xl':
          case 'lg':
            if(menuType === 'vertical-overlay-menu'){
              this.hide();
            }
            else if(menuType === 'vertical-compact-menu'){
              this.open();
            }
            else if(menuType === 'horizontal-menu' && currentBreakpoint.name == 'lg'){
              this.collapse();
            }
            else{
              if(defMenu === 'collapsed')
                this.collapse(defMenu);
              else
                this.expand();
            }
            break;
          case 'md':
            if(menuType === 'vertical-overlay-menu' || menuType === 'vertical-mmenu'){
              this.hide();
            }
            else if(menuType === 'vertical-compact-menu'){
              this.open();
            }
            else{
              this.collapse();
            }
            break;
          case 'sm':
            this.hide();
            break;
          case 'xs':
            this.hide();
            break;
        }
      }

      // On the small and extra small screen make them overlay menu
      if(menuType === 'vertical-menu' || menuType === 'vertical-compact-menu' || menuType === 'vertical-content-menu'){
        this.toOverlayMenu(currentBreakpoint.name);
      }

      if($body.is('.horizontal-layout') && !$body.hasClass('.horizontal-menu-demo')){
        this.changeMenu(currentBreakpoint.name);

        jq331('.menu-toggle').removeClass('is-active');
      }

      // Initialize drill down menu for vertical layouts, for horizontal layouts drilldown menu is intitialized in changemenu function
      if(menuType != 'horizontal-menu'){
        // Drill down menu
        // ------------------------------
        this.drillDownMenu(currentBreakpoint.name);
      }

      // Dropdown submenu on large screen on hover For Large screen only
      // ---------------------------------------------------------------
      if(currentBreakpoint.name == 'xl'){
        jq331('body[data-open="hover"] .dropdown').on('mouseenter', function(){
          if (!(jq331(this).hasClass('show'))) {
            jq331(this).addClass('show');
          }else{
            jq331(this).removeClass('show');
          }
        }).on('mouseleave', function(event){
          jq331(this).removeClass('show');
        });

        jq331('body[data-open="hover"] .dropdown a').on('click', function(e){
          if(menuType == 'horizontal-menu'){
            var $this = jq331(this);
            if($this.hasClass('dropdown-toggle')){
              return false;
            }
          }
        });
      }

      // Added data attribute brand-center for navbar-brand-center
      // TODO:AJ: Shift this feature in PUG.
      if(jq331('.header-navbar').hasClass('navbar-brand-center')){
        jq331('.header-navbar').attr('data-nav','brand-center');
      }
      if(currentBreakpoint.name == 'sm' || currentBreakpoint.name == 'xs'){
        jq331('.header-navbar[data-nav=brand-center]').removeClass('navbar-brand-center');
      }else{
        jq331('.header-navbar[data-nav=brand-center]').addClass('navbar-brand-center');
      }

      // Dropdown submenu on small screen on click
      // --------------------------------------------------
      jq331('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        if(jq331(this).siblings('ul.dropdown-menu').length > 0){
          event.preventDefault();
        }
        event.stopPropagation();
        jq331(this).parent().siblings().removeClass('show');
        jq331(this).parent().toggleClass('show');
      });

      // Horizontal Fixed Nav Sticky hight issue on small screens
      if(menuType == 'horizontal-menu'){
        if(currentBreakpoint.name == 'sm' || currentBreakpoint.name == 'xs'){
          if(jq331(".menu-fixed").length){
            jq331(".menu-fixed").unstick();
          }
        }
        else{
          if(jq331(".navbar-fixed").length){
            jq331(".navbar-fixed").sticky();
          }
        }
      }

      /********************************************
      *             Searchable Menu               *
      ********************************************/

      function searchMenu(list) {

        var input = jq331(".menu-search");
        jq331(input)
          .change( function () {
            var filter = jq331(this).val();
            if(filter) {
              // Hide Main Navigation Headers
              jq331('.navigation-header').hide();
              // this finds all links in a list that contain the input,
              // and hide the ones not containing the input while showing the ones that do
              jq331(list).find("li a:not(:Contains(" + filter + "))").hide().parent().hide();
              // jq331(list).find("li a:Contains(" + filter + ")").show().parents('li').show().addClass('open').closest('li').children('a').show();
              var searchFilter = jq331(list).find("li a:Contains(" + filter + ")");
              if( searchFilter.parent().hasClass('has-sub') ){
                searchFilter.show()
                .parents('li').show()
                .addClass('open')
                .closest('li')
                .children('a').show()
                .children('li').show();

                // searchFilter.parents('li').find('li').show().children('a').show();
                if(searchFilter.siblings('ul').length > 0){
                  searchFilter.siblings('ul').children('li').show().children('a').show();
                }

              }
              else{
                searchFilter.show().parents('li').show().addClass('open').closest('li').children('a').show();
              }
            } else {
              // return to default
              jq331('.navigation-header').show();
              jq331(list).find("li a").show().parent().show().removeClass('open');
            }
            $.app.menu.manualScroller.update();
            return false;
          })
        .keyup( function () {
            // fire the above change event after every letter
            jq331(this).change();
        });
      }

      if(menuType === 'vertical-menu' || menuType === 'vertical-overlay-menu' || menuType === 'vertical-content-menu'){
        // custom css expression for a case-insensitive contains()
        jQuery.expr[':'].Contains = function(a,i,m){
            return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
        };

        searchMenu(jq331("#main-menu-navigation"));
      }
    },

    /*changeLogo: function(menuType){
      var logo = jq331('.brand-logo');
      var logoText = jq331('.brand-text');
      if(menuType == 'expand'){
        // logo.attr('src',logo.data('expand'));
        logoText.delay(100).fadeIn(200);
        // logoText.addClass('d-inline-block').removeClass('d-none');
      }
      else{
        // logo.attr('src',logo.data('collapse'));
        logoText.fadeOut(100);
        // logoText.addClass('d-none').removeClass('d-inline-block');
      }
    },*/

    transit: function(callback1, callback2) {
      var menuObj = this;
      $body.addClass('changing-menu');

      callback1.call(menuObj);

      if($body.hasClass('vertical-layout')){
        if($body.hasClass('menu-open') || $body.hasClass('menu-expanded')){
          jq331('.menu-toggle').addClass('is-active');

          // Show menu header search when menu is normally visible
          if( $body.data('menu') === 'vertical-menu' || $body.data('menu') === 'vertical-content-menu'){
            if(jq331('.main-menu-header')){
              jq331('.main-menu-header').show();
            }
          }
        }
        else{
          jq331('.menu-toggle').removeClass('is-active');

          // Hide menu header search when only menu icons are visible
          if( $body.data('menu') === 'vertical-menu' || $body.data('menu') === 'vertical-content-menu'){
            if(jq331('.main-menu-header')){
              jq331('.main-menu-header').hide();
            }
          }
        }
      }

      setTimeout(function() {
        callback2.call(menuObj);
        $body.removeClass('changing-menu');

        menuObj.update();
      }, 500);
    },

    open: function() {
      if($body.is('.vertical-mmenu')){
        this.mMenu.enable();
      }
      this.transit(function() {
        $body.removeClass('menu-hide menu-collapsed').addClass('menu-open');
        this.hidden = false;
        this.expanded = true;
      }, function() {
        if(!jq331('.main-menu').hasClass('menu-native-scroll') && !$body.is('.vertical-mmenu') && jq331('.main-menu').hasClass('menu-fixed') ){
          this.manualScroller.enable();
          jq331('.main-menu-content').css('height', jq331(window).height() - jq331('.header-navbar').height() - jq331('.main-menu-header').outerHeight() - jq331('.main-menu-footer').outerHeight() );
          // this.manualScroller.update();
        }
      });
    },

    hide: function() {
      if($body.is('.vertical-mmenu')){
        this.mMenu.disable();
      }
      this.transit(function() {
        $body.removeClass('menu-open menu-expanded').addClass('menu-hide');
        this.hidden = true;
        this.expanded = false;
      }, function() {
        if(!jq331('.main-menu').hasClass('menu-native-scroll') && !$body.is('.vertical-mmenu') && jq331('.main-menu').hasClass('menu-fixed')){
          this.manualScroller.enable();
        }
      });
    },

    expand: function() {
      if (this.expanded === false) {
        this.transit(function() {
          $body.removeClass('menu-collapsed').addClass('menu-expanded');
          this.collapsed = false;
          this.expanded = true;

        }, function() {

          if($body.is('.vertical-mmenu')){
            this.mMenu.enable();
          }
          else if( (jq331('.main-menu').hasClass('menu-native-scroll') || $body.data('menu') == 'vertical-mmenu' || $body.data('menu') == 'horizontal-menu')){
            this.manualScroller.disable();
          }
          else{
            if(jq331('.main-menu').hasClass('menu-fixed'))
              this.manualScroller.enable();
          }

          if( $body.data('menu') == 'vertical-menu' && jq331('.main-menu').hasClass('menu-fixed') ){
            jq331('.main-menu-content').css('height', jq331(window).height() - jq331('.header-navbar').height() - jq331('.main-menu-header').outerHeight() - jq331('.main-menu-footer').outerHeight() );
            // this.manualScroller.update();
          }

        });
      }
    },

    collapse: function(defMenu) {
      if (this.collapsed === false) {

        this.transit(function() {
          $body.removeClass('menu-expanded').addClass('menu-collapsed');
          this.collapsed = true;
          this.expanded  = false;

        }, function() {

          if($body.data('menu') == 'vertical-content-menu'){
            this.manualScroller.disable();
          }

          if( ($body.data('menu') == 'horizontal-menu') &&  $body.hasClass('vertical-overlay-menu')){
            if(jq331('.main-menu').hasClass('menu-fixed'))
              this.manualScroller.enable();
          }
          if( $body.data('menu') == 'vertical-menu' && jq331('.main-menu').hasClass('menu-fixed') ){
            jq331('.main-menu-content').css('height', jq331(window).height() - jq331('.header-navbar').height());
            // this.manualScroller.update();
          }

          /*if( $body.data('menu') == 'vertical-menu-modern' && defMenu === 'collapsed' ){
            var $listItem = jq331('.main-menu li.open'),
            $subList = $listItem.children('ul');
            $listItem.addClass('menu-collapsed-open');

            $subList.show().slideUp(200, function() {
                jq331(this).css('display', '');
            });

            $listItem.removeClass('open');
            // $.app.menu.changeLogo();
          }*/
        });
      }
    },

    toOverlayMenu: function(screen){
      var menu = $body.data('menu');
      if(screen == 'sm' || screen == 'xs'){
        if($body.hasClass(menu)){
          $body.removeClass(menu).addClass('vertical-overlay-menu');
        }
        if(menu == 'vertical-content-menu'){
          jq331('.main-menu').addClass('menu-fixed');
        }
      }
      else{
        if($body.hasClass('vertical-overlay-menu')){
          $body.removeClass('vertical-overlay-menu').addClass(menu);
        }
        if(menu == 'vertical-content-menu'){
          jq331('.main-menu').removeClass('menu-fixed');
        }
      }
    },

    changeMenu: function(screen){
      // Replace menu html
      jq331('div[data-menu="menu-wrapper"]').html('');
      jq331('div[data-menu="menu-wrapper"]').html(menuWrapper_el);

      var menuWrapper    = jq331('div[data-menu="menu-wrapper"]'),
      menuContainer      = jq331('div[data-menu="menu-container"]'),
      menuNavigation     = jq331('ul[data-menu="menu-navigation"]'),
      megaMenu           = jq331('li[data-menu="megamenu"]'),
      megaMenuCol        = jq331('li[data-mega-col]'),
      dropdownMenu       = jq331('li[data-menu="dropdown"]'),
      dropdownSubMenu    = jq331('li[data-menu="dropdown-submenu"]');

      if(screen == 'sm' || screen == 'xs'){

        // Change body classes
        $body.removeClass($body.data('menu')).addClass('vertical-layout vertical-overlay-menu fixed-navbar');

        // Add navbar-fix-top class on small screens
        jq331('nav.header-navbar').addClass('fixed-top');

        // Change menu wrapper, menu container, menu navigation classes
        menuWrapper.removeClass().addClass('main-menu menu-light menu-fixed menu-shadow');
        // menuContainer.removeClass().addClass('main-menu-content');
        menuNavigation.removeClass().addClass('navigation navigation-main');

        // If Mega Menu
        megaMenu.removeClass('dropdown mega-dropdown').addClass('has-sub');
        megaMenu.children('ul').removeClass();
        megaMenuCol.each(function(index, el) {

          // Remove drilldown-menu and menu list
          var megaMenuSub = jq331(el).find('.mega-menu-sub');
          megaMenuSub.find('li').has('ul').addClass('has-sub');

          // if mega menu title is given, remove title and make it list item with mega menu title's text
          var first_child = jq331(el).children().first(),
          first_child_text = '';

          if( first_child.is('h6') ){
            first_child_text = first_child.html();
            first_child.remove();
            jq331(el).prepend('<a href="#">'+first_child_text+'</a>').addClass('has-sub mega-menu-title');
          }
        });
        megaMenu.find('a').removeClass('dropdown-toggle');
        megaMenu.find('a').removeClass('dropdown-item');

        // If Dropdown Menu
        dropdownMenu.removeClass('dropdown').addClass('has-sub');
        dropdownMenu.find('a').removeClass('dropdown-toggle nav-link');
        dropdownMenu.children('ul').find('a').removeClass('dropdown-item');
        dropdownMenu.find('ul').removeClass('dropdown-menu');
        dropdownSubMenu.removeClass().addClass('has-sub');

        $.app.nav.init();

        // Dropdown submenu on small screen on click
        // --------------------------------------------------
        jq331('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
          event.preventDefault();
          event.stopPropagation();
          jq331(this).parent().siblings().removeClass('open');
          jq331(this).parent().toggleClass('open');
        });
      }
      else{
        // Change body classes
        $body.removeClass('vertical-layout vertical-overlay-menu fixed-navbar').addClass($body.data('menu'));

        // Remove navbar-fix-top class on large screens
        jq331('nav.header-navbar').removeClass('fixed-top');

        // Change menu wrapper, menu container, menu navigation classes
        menuWrapper.removeClass().addClass(menuWrapperClasses);

        // Intitialize drill down menu for horizontal layouts
        // --------------------------------------------------
        this.drillDownMenu(screen);

        jq331('a.dropdown-item.nav-has-children').on('click',function(){
          event.preventDefault();
          event.stopPropagation();
        });
        jq331('a.dropdown-item.nav-has-parent').on('click',function(){
          event.preventDefault();
          event.stopPropagation();
        });
      }
    },

    toggle: function() {
      var currentBreakpoint = Unison.fetch.now(); // Current Breakpoint
      var collapsed = this.collapsed;
      var expanded = this.expanded;
      var hidden = this.hidden;
      var menu = $body.data('menu');

      switch (currentBreakpoint.name) {
        case 'xl':
        case 'lg':
        case 'md':
          if(expanded === true){
            if(menu == 'vertical-compact-menu' || menu == 'vertical-mmenu' || menu == 'vertical-overlay-menu'){
              this.hide();
            }
            else{
              this.collapse();
            }
          }
          else{
            if(menu == 'vertical-compact-menu' || menu == 'vertical-mmenu' || menu == 'vertical-overlay-menu'){
              this.open();
            }
            else{
              this.expand();
            }
          }
          break;
        case 'sm':
          if (hidden === true) {
            this.open();
          } else {
            this.hide();
          }
          break;
        case 'xs':
          if (hidden === true) {
            this.open();
          } else {
            this.hide();
          }
          break;
      }

      // Re-init sliding menu to update width
      this.drillDownMenu(currentBreakpoint.name);
    },

    update: function() {
      this.manualScroller.update();
    },

    reset: function() {
      this.expanded  = false;
      this.collapsed = false;
      this.hidden    = false;
      $body.removeClass('menu-hide menu-open menu-collapsed menu-expanded');
    },
  };

  // Navigation Menu
  $.app.nav = {
    container: jq331('.navigation-main'),
    initialized : false,
    navItem: jq331('.navigation-main').find('li').not('.navigation-category'),

    config: {
      speed: 300,
    },

    init: function(config) {
      this.initialized = true; // Set to true when initialized
      $.extend(this.config, config);

      if(!$body.is('.vertical-mmenu')){
        this.bind_events();
      }
    },

    bind_events: function() {
      var menuObj = this;

      jq331('.navigation-main').on('mouseenter.app.menu', 'li', function() {
        var $this = jq331(this);
        jq331('.hover', '.navigation-main').removeClass('hover');
        if( $body.hasClass('menu-collapsed') || ($body.data('menu') == 'vertical-compact-menu' && !$body.hasClass('vertical-overlay-menu')) ){
          jq331('.main-menu-content').children('span.menu-title').remove();
          jq331('.main-menu-content').children('a.menu-title').remove();
          jq331('.main-menu-content').children('ul.menu-content').remove();

          // Title
          var menuTitle = $this.find('span.menu-title').clone(),
          tempTitle,
          tempLink;
          if(!$this.hasClass('has-sub') ){
            tempTitle = $this.find('span.menu-title').text();
            tempLink = $this.children('a').attr('href');
            if(tempTitle !== ''){
              menuTitle = jq331("<a>");
              menuTitle.attr("href", tempLink);
              menuTitle.attr("title", tempTitle);
              menuTitle.text(tempTitle);
              menuTitle.addClass("menu-title");
            }
          }
          // menu_header_height = (jq331('.main-menu-header').length) ? jq331('.main-menu-header').height() : 0,
          // fromTop = menu_header_height + $this.position().top + parseInt($this.css( "border-top" ),10);
          var fromTop;
          if($this.css( "border-top" )){
            if (menuObj.GetIEVersion() > 0)
              fromTop = $this.offset().top + parseInt($this.css( "border-top" ), 10);
            else 
              fromTop = $this.position().top + parseInt($this.css( "border-top" ), 10);
            // fromTop = $this.position().top + parseInt($this.css( "border-top" ), 10);
          }
          else{
            if (menuObj.GetIEVersion() > 0)
              fromTop = $this.offset().top;
            else 
              fromTop = $this.position().top;
            // fromTop = $this.position().top;
          }
          if($body.data('menu') !== 'vertical-compact-menu'){
            menuTitle.appendTo('.main-menu-content').css({
              position:'fixed',
              top : fromTop,
            });
          }

          // Content
          if($this.hasClass('has-sub') && $this.hasClass('nav-item')) {
            var menuContent = $this.children('ul:first');
            menuObj.adjustSubmenu($this);
          }
        }
        $this.addClass('hover');
      }).on('mouseleave.app.menu', 'li', function() {
        // jq331(this).removeClass('hover');
      }).on('active.app.menu', 'li', function(e) {
        jq331(this).addClass('active');
        e.stopPropagation();
      }).on('deactive.app.menu', 'li.active', function(e) {
        jq331(this).removeClass('active');
        e.stopPropagation();
      }).on('open.app.menu', 'li', function(e) {

        var $listItem = jq331(this);
        $listItem.addClass('open');

        menuObj.expand($listItem);

        // If menu collapsible then do not take any action
        if (jq331('.main-menu').hasClass('menu-collapsible')) {
          return false;
        }
        // If menu accordion then close all except clicked once
        else{
          $listItem.siblings('.open').find('li.open').trigger('close.app.menu');
          $listItem.siblings('.open').trigger('close.app.menu');
        }

        e.stopPropagation();
      }).on('close.app.menu', 'li.open', function(e) {
        var $listItem = jq331(this);

        $listItem.removeClass('open');
        menuObj.collapse($listItem);

        e.stopPropagation();
      }).on('click.app.menu', 'li', function(e) {
        var $listItem = jq331(this);
        if($listItem.is('.disabled')){
          e.preventDefault();
        }
        else{
          if( $body.hasClass('menu-collapsed')  || ($body.data('menu') == 'vertical-compact-menu' && $listItem.is('.has-sub') && !$body.hasClass('vertical-overlay-menu'))){
            e.preventDefault();
          }
          else{
            if ($listItem.has('ul')) {
              if ($listItem.is('.open')) {
                $listItem.trigger('close.app.menu');
              } else {
                $listItem.trigger('open.app.menu');
              }
            } else {
              if (!$listItem.is('.active')) {
                $listItem.siblings('.active').trigger('deactive.app.menu');
                $listItem.trigger('active.app.menu');
              }
            }
          }
        }

        e.stopPropagation();
      });


      jq331('.main-menu-content').on('mouseleave', function(){
        if( $body.hasClass('menu-collapsed') || $body.data('menu') == 'vertical-compact-menu' ){
          jq331('.main-menu-content').children('span.menu-title').remove();
          jq331('.main-menu-content').children('a.menu-title').remove();
          jq331('.main-menu-content').children('ul.menu-content').remove();
        }
        jq331('.hover', '.navigation-main').removeClass('hover');
      });

      // If list item has sub menu items then prevent redirection.
      jq331('.navigation-main li.has-sub > a').on('click',function(e){
        e.preventDefault();
      });

      jq331('ul.menu-content').on('click', 'li', function(e) {
        var $listItem = jq331(this);
        if($listItem.is('.disabled')){
          e.preventDefault();
        }
        else{
          if ($listItem.has('ul')) {
            if ($listItem.is('.open')) {
              $listItem.removeClass('open');
              menuObj.collapse($listItem);
            } else {
              $listItem.addClass('open');

              menuObj.expand($listItem);

              // If menu collapsible then do not take any action
              if (jq331('.main-menu').hasClass('menu-collapsible')) {
                return false;
              }
              // If menu accordion then close all except clicked once
              else{
                $listItem.siblings('.open').find('li.open').trigger('close.app.menu');
                $listItem.siblings('.open').trigger('close.app.menu');
              }

              e.stopPropagation();
            }
          } else {
            if (!$listItem.is('.active')) {
              $listItem.siblings('.active').trigger('deactive.app.menu');
              $listItem.trigger('active.app.menu');
            }
          }
        }

        e.stopPropagation();
      });
    },

    GetIEVersion: function (){
      var sAgent = window.navigator.userAgent;
      var Idx = sAgent.indexOf("MSIE");

      // If IE, return version number.
      if (Idx > 0) 
        return parseInt(sAgent.substring(Idx+ 5, sAgent.indexOf(".", Idx)));

      // If IE 11 then look for Updated user agent string.
      else if (!!navigator.userAgent.match(/Trident\/7\./)) 
        return 11;

      else
        return 0; //It is not IE
    },

    /**
     * Ensure an admin submenu is within the visual viewport.
     * @param {jQuery} $menuItem The parent menu item containing the submenu.
     */
    adjustSubmenu: function ( $menuItem ) {
      var menuHeaderHeight, menutop, topPos, winHeight,
      bottomOffset, subMenuHeight, popOutMenuHeight, borderWidth, scroll_theme,
      $submenu = $menuItem.children('ul:first'),
      ul = $submenu.clone(true);

      menuHeaderHeight = jq331('.main-menu-header').height();
      
      if (this.GetIEVersion() > 0) 
        menutop = $menuItem.offset().top;
      else 
        menutop = $menuItem.position().top;
      
      winHeight        = $window.height() - jq331('.header-navbar').height();
      borderWidth      = 0;
      subMenuHeight    = $submenu.height();

      if(parseInt($menuItem.css( "border-top" ),10) > 0){
        borderWidth = parseInt($menuItem.css( "border-top" ),10);
      }

      popOutMenuHeight = winHeight - menutop - $menuItem.height() - 30;
      scroll_theme     = (jq331('.main-menu').hasClass('menu-dark')) ? 'light' : 'dark';

      if($body.data('menu') === 'vertical-compact-menu'){
        topPos = menutop + borderWidth;
        popOutMenuHeight = winHeight - menutop - 30;
      }
      else if($body.data('menu') === 'vertical-content-menu'){
        topPos = menutop + $menuItem.height() + borderWidth;
        popOutMenuHeight = winHeight - jq331('.content-header').height() -$menuItem.height() - menutop - 60;
      }
      else{
        topPos = menutop + $menuItem.height() + borderWidth;
      }
      
      if($body.data('menu') == 'vertical-content-menu'){
        ul.addClass('menu-popout').appendTo('.main-menu-content').css({
          'top' : topPos,
          'position' : 'fixed',
        });
      }
      else{
        ul.addClass('menu-popout').appendTo('.main-menu-content').css({
          'top' : topPos,
          'position' : 'fixed',
          'max-height': popOutMenuHeight,
        });

        jq331('.main-menu-content > ul.menu-content').perfectScrollbar({
          theme:scroll_theme,
        });
      }
    },

    collapse: function($listItem, callback) {
      var $subList = $listItem.children('ul');

      $subList.show().slideUp($.app.nav.config.speed, function() {
        jq331(this).css('display', '');

        jq331(this).find('> li').removeClass('is-shown');

        if (callback) {
          callback();
        }

        $.app.nav.container.trigger('collapsed.app.menu');
      });
    },

    expand: function($listItem, callback) {
      var $subList  = $listItem.children('ul');
      var $children = $subList.children('li').addClass('is-hidden');

      $subList.hide().slideDown($.app.nav.config.speed, function() {
        jq331(this).css('display', '');

        if (callback) {
          callback();
        }

        $.app.nav.container.trigger('expanded.app.menu');
      });

      setTimeout(function() {
        $children.addClass('is-shown');
        $children.removeClass('is-hidden');
      }, 0);
    },

    refresh: function() {
      $.app.nav.container.find('.open').removeClass('open');
    },
  };

})(window, document, jQuery);