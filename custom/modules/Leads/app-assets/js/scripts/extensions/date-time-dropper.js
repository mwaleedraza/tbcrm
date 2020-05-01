/*=========================================================================================
    File Name: date-time-dropper.js
    Description: Datepicker and Timepicker plugins based on jQuery
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Template
    Version: 2.1
    Author: GeeksLabs
    Author URL: http://www.themeforest.net/user/geekslabs
==========================================================================================*/
jq331(document).ready(function(){

    /********************************************
    *               Date Dropper                *
    ********************************************/

    // Options


    // Animate
    jq331('#animate').dateDropper({
        dropWidth: 200
    });

    // Init Animation
    jq331('#init_animation').dateDropper({
        dropWidth: 200,
        init_animation: 'bounce'
    });

    // Format
    jq331('#format').dateDropper({
        dropWidth: 200,
        format: 'j F, Y'
    });

    // Lang
    jq331('#lang').dateDropper({
        dropWidth: 200,
        lang: 'ar' // Arabic
    });

    // Lock
    jq331('#lock').dateDropper({
        dropWidth: 200,
        lock: 'from' // To select date after today, 'to' to select date before today
    });

    // Max Year
    jq331('#maxYear').dateDropper({
        dropWidth: 200,
        maxYear: '2020'
    });

    // Min Year
    jq331('#minYear').dateDropper({
        dropWidth: 200,
        minYear: '2001'
    });

    // Years Range
    jq331('#yearsRange').dateDropper({
        dropWidth: 200,
        yearsRange: '5'
    });


    // Styles

    // Drop Primary Color
    jq331('#dropPrimaryColor').dateDropper({
        dropWidth: 200,
        dropPrimaryColor: '#F6BB42',
        dropBorder: '1px solid #F6BB42'
    });

    // Drop Text Color
    jq331('#dropTextColor').dateDropper({
        dropWidth: 200,
        dropPrimaryColor: '#10617E',
        dropBorder: '1px solid #10617E',
        dropBackgroundColor: '#23b1e3',
        dropTextColor: '#FFF'
    });

    // Drop Background Color
    jq331('#dropBackgroundColor').dateDropper({
        dropWidth: 200,
        dropBackgroundColor: '#ACDAEC',
    });

    // Drop Border
    jq331('#dropBorder').dateDropper({
        dropWidth: 200,
        dropPrimaryColor: '#2fb594',
        dropBorder: '1px solid #2dad8d',
    });

    // Drop Border Radius
    jq331('#dropBorderRadius').dateDropper({
        dropWidth: 200,
        dropPrimaryColor: '#e8273a',
        dropBorder: '1px solid #e71e32',
        dropBorderRadius: '0'
    });

    // Drop Shadow
    jq331('#dropShadow').dateDropper({
        dropWidth: 200,
        dropPrimaryColor: '#fa4420',
        dropBorder: '1px solid #fa4420',
        dropBorderRadius: '20',
        dropShadow: '0 0 10px 0 rgba(250, 68, 32, 0.6)'
    });

    // Drop Width
    jq331('#dropWidth').dateDropper({
        dropWidth: 250
    });

    // Drop Text Weight
    jq331('#dropTextWeight').dateDropper({
        dropWidth: 200,
        dropTextWeight: 'normal'
    });


    /********************************************
    *               Time Dropper                *
    ********************************************/

    // Options


    // Auto Switch
    jq331('#autoswitch').timeDropper();

    // Meridians
    jq331('#meridians').timeDropper({
        meridians: true
    });

    // Format
    jq331('#timeformat').timeDropper({
        format: 'HH:mm A'
    });

    // Mousewheel
    jq331('#mousewheel').timeDropper({
        mousewheel: true
    });

    // Init Animation
    jq331('#time_init_animation').timeDropper({
        init_animation: 'dropDown',
        meridians: true
    });

    // Set Current Time
    jq331('#setCurrentTime').timeDropper();



    // Styles


    // Primary Color
    jq331('#primaryColor').timeDropper({
        primaryColor: '#2fb594',
        borderColor: '#2fb594'
    });

    // Text Color
    jq331('#textColor').timeDropper({
        primaryColor: '#2fb594',
        textColor: '#e8273a'
    });

    // Background Color
    jq331('#backgroundColor').timeDropper({
        primaryColor: '#FFF',
        backgroundColor: '#fa4420',
        borderColor: '#781602',
        textColor: '#781602'
    });

    // Border Color
    jq331('#borderColor').timeDropper({
        primaryColor: '#FFF',
        backgroundColor: '#23b1e3',
        borderColor: '#FFF',
        textColor: '#FFF'
    });

});