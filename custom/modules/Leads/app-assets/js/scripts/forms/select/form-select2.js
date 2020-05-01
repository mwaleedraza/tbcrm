/*=========================================================================================
    File Name: form-select2.js
    Description: Select2 is a jQuery-based replacement for select boxes.
    It supports searching, remote data sets, and pagination of results.
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Template
    Version: 2.1
    Author: Pixinvent
    Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function(window, document, $) {
	'use strict';

  // Basic Select2 select
	jq331(".select2").select2();

    // Single Select Placeholder
    jq331(".select2-placeholder").select2({
      placeholder: "Select a state",
      allowClear: true
    });

    // Select With Icon
    jq331(".select2-icons").select2({
        minimumResultsForSearch: Infinity,
        templateResult: iconFormat,
        templateSelection: iconFormat,
        escapeMarkup: function(es) { return es; }
    });

    // Format icon
    function iconFormat(icon) {
        var originalOption = icon.element;
        if (!icon.id) { return icon.text; }
        var $icon = "<i class='fa fa-" + jq331(icon.element).data('icon') + "'></i>" + icon.text;

        return $icon;
    }

    // Multiple Select Placeholder
    jq331(".select2-placeholder-multiple").select2({
      placeholder: "Select State",
    });

    // Hiding the search box
    jq331(".hide-search").select2({
      minimumResultsForSearch: Infinity
    });

    // Limiting the number of selections
    jq331(".max-length").select2({
      maximumSelectionLength: 2,
      placeholder: "Select maximum 2 items"
    });

    // DOM Events
    var $eventSelect = jq331(".js-example-events");
    $eventSelect.select2({
      placeholder: "DOM Events"
    });
    $eventSelect.on("select2:open", function (e) {
        alert("Open Event Fired.");
    });
    $eventSelect.on("select2:close", function (e) {
        alert("Close Event Fired.");
     });
    $eventSelect.on("select2:select", function (e) {
        alert("Select Event Fired.");
    });
    $eventSelect.on("select2:unselect", function (e) {
        alert("Unselect Event Fired.");
    });

    $eventSelect.on("change", function (e) {
        alert("Change Event Fired.");
    });

    // Programmatic access
    var $select = jq331(".js-example-programmatic").select2();
    var $selectMulti = jq331(".js-example-programmatic-multi").select2();
    $selectMulti.select2({
      placeholder: "Programmatic Events"
    });
    jq331(".js-programmatic-set-val").on("click", function () { $select.val("CA").trigger("change"); });

    jq331(".js-programmatic-open").on("click", function () { $select.select2("open"); });
    jq331(".js-programmatic-close").on("click", function () { $select.select2("close"); });

    jq331(".js-programmatic-init").on("click", function () { $select.select2(); });
    jq331(".js-programmatic-destroy").on("click", function () { $select.select2("destroy"); });

    jq331(".js-programmatic-multi-set-val").on("click", function () { $selectMulti.val(["CA", "AL"]).trigger("change"); });
    jq331(".js-programmatic-multi-clear").on("click", function () { $selectMulti.val(null).trigger("change"); });

    // Loading array data
    var data = [
        { id: 0, text: 'enhancement' },
        { id: 1, text: 'bug' },
        { id: 2, text: 'duplicate' },
        { id: 3, text: 'invalid' },
        { id: 4, text: 'wontfix' }
    ];

    jq331(".select2-data-array").select2({
      data: data
    });

    // Loading remote data
    jq331(".select2-data-ajax").select2({
      placeholder: "Loading remote data",
      ajax: {
        url: "http://api.github.com/search/repositories",
        dataType: 'json',
        delay: 250,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {
          // parse the results into the format expected by Select2
          // since we are using custom formatting functions we do not need to
          // alter the remote JSON data, except to indicate that infinite
          // scrolling can be used
          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
      minimumInputLength: 1,
      templateResult: formatRepo, // omitted for brevity, see the source of this page
      templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });

    function formatRepo (repo) {
      if (repo.loading) return repo.text;

      var markup = "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
        "<div class='select2-result-repository__meta'>" +
          "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";

      if (repo.description) {
        markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
      }

      markup += "<div class='select2-result-repository__statistics'>" +
        "<div class='select2-result-repository__forks'><i class='fa fa-code-branch mr-0'></i> " + repo.forks_count + " Forks</div>" +
        "<div class='select2-result-repository__stargazers'><i class='fa fa-star mr-0'></i> " + repo.stargazers_count + " Stars</div>" +
        "<div class='select2-result-repository__watchers'><i class='fa fa-eye mr-0'></i> " + repo.watchers_count + " Watchers</div>" +
      "</div>" +
      "</div></div>";

      return markup;
    }

    function formatRepoSelection (repo) {
      return repo.full_name || repo.text;
    }

    // Tagging support
    jq331(".select2-tags").select2({
      tags: true
    });

    // Automatic tokenization
    jq331(".select2-tokenizer").select2({
      tags: true,
      tokenSeparators: [',', ' ']
    });

    // Customizing how results are matched
    function matchStart (term, text) {
      if (text.toUpperCase().indexOf(term.toUpperCase()) === 0) {
        return true;
      }

      return false;
    }

    $.fn.select2.amd.require(['select2/compat/matcher'], function (oldMatcher) {
      jq331(".select2-customize-result").select2({
        placeholder: "Search by 'a'",
        matcher: oldMatcher(matchStart)
      });
    });

    // Multiple languages
    jq331(".select2-language").select2({
      language: "es"
    });

    // RTL support
    jq331(".select2-rtl").select2({
      placeholder: "RTL Select",
      dir: "rtl"
    });

    // Diacritics support
    jq331(".select2-diacritics").select2({
      placeholder: "Type 'aero'",
    });

    // Theme support
    jq331(".select2-theme").select2({
      placeholder: "Classic Theme",
      theme: "classic"
    });

    // Templating
    function formatState (state) {
      if (!state.id) { return state.text; }
      else{
        var $state = jq331(
          '<span><img src="../../../app-assets/images/flags/' + state.element.value.toLowerCase() + '.png" class="img-flag" /> ' + state.text + '</span>'
        );
        return $state;
      }
    }

    jq331(".select2-templating").select2({
      templateResult: formatState,
      templateSelection: formatState
    });


    // Sizing options

    // Large
    jq331('.select2-size-lg').select2({
        containerCssClass: 'select-lg'
    });


    // Small
    jq331('.select2-size-sm').select2({
        containerCssClass: 'select-sm'
    });


    // Mini
    jq331('.select2-size-xs').select2({
        containerCssClass: 'select-xs'
    });

    // Color Options

    // Background Color
	debugger;
    jq331('.select2-bg').each(function(i, obj) {
		debugger;
      var variation = "",
      textVariation = "",
      textColor = "";
      var color = jq331(this).data('bgcolor');
      variation = jq331(this).data('bgcolor-variation');
      textVariation = jq331(this).data('text-variation');
      textColor = jq331(this).data('text-color');
      if(textVariation !== ""){
        textVariation = " "+textVariation;
      }
      if(variation !== ""){
        variation = " bg-"+variation;
      }
      var className = "bg-"+color + variation + " " + textColor + textVariation + " border-"+color + ' border-darken-2 ';

      jq331(this).select2({
        containerCssClass: className
      });
    });

    // Border Color
    jq331('.select2-border').each(function(i, obj) {
      var variation = "",
      textVariation = "",
      textColor = "";
      var color = jq331(this).data('border-color');
      textVariation = jq331(this).data('text-variation');
      variation = jq331(this).data('border-variation');
      textColor = jq331(this).data('text-color');
      if(textVariation !== ""){
        textVariation = " "+textVariation;
      }
      if(variation !== ""){
        variation = " border-"+variation;
      }

      var className = "border-"+color + " " +variation + " " + textColor + textVariation;

      jq331(this).select2({
        containerCssClass: className
      });
    });

    // Menu Background Color
    jq331('.select2-menu-bg').each(function(i, obj) {
      var variation = "",
      textVariation = "",
      textColor = "";
      var color = jq331(this).data('bgcolor');
      variation = jq331(this).data('bgcolor-variation');
      textVariation = jq331(this).data('text-variation');
      textColor = jq331(this).data('text-color');
      if(variation !== ""){
        variation = " bg-"+variation;
      }
      if(textVariation !== ""){
        textVariation = " "+textVariation;
      }
      var className = "bg-"+color + variation + " " + textColor + textVariation + " border-"+color + ' border-darken-2 ';

      jq331(this).select2({
        dropdownCssClass: className
      });
    });

    // Full Background Color
    jq331('.select2-full-bg').each(function(i, obj) {
      var variation = "",
      textVariation = "",
      textColor = "";
      var color = jq331(this).data('bgcolor');
      variation = jq331(this).data('bgcolor-variation');
      textVariation = jq331(this).data('text-variation');
      textColor = jq331(this).data('text-color');
      if(variation !== ""){
        variation = " bg-"+variation;
      }
      if(textVariation !== ""){
        textVariation = " "+textVariation;
      }
      var className = "bg-"+color + variation + " " + textColor + textVariation + " border-"+color + ' border-darken-2 ';

      jq331(this).select2({
        containerCssClass: className,
        dropdownCssClass: className
      });
    });

    jq331('select[data-text-color]').each(function(i, obj) {
      var text = jq331(this).data('text-color'),textVariation;
      textVariation = jq331(this).data('text-variation');
      if(textVariation !== ""){
        textVariation = " "+textVariation;
      }
      jq331(this).next(".select2").find(".select2-selection__rendered").addClass(text+textVariation);
    });

})(window, document, jQuery);
