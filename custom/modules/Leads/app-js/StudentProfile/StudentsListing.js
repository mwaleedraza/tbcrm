var StudentsListing = {
    populateData: function () {
        var source = {
            datatype: "json",
            //root: "__ENTITIES",
            //id: "ID",
            datafields: [
                {
                    name: 'Id',
                    map: 'ID',
                    type: 'string'
                },
                {
                    name: 'FName',
                    map: 'First Name',
                    type: 'string'
                },
                {
                    name: 'LName',
                    map: 'Last Name',
                    type: 'string'
                },
                {
                    name: 'City',
                    map: 'City',
                    type: 'string'
                },
                {
                    name: 'Mobile',
                    map: 'Mobile1',
                    type: 'string'
                },
                {
                    name: 'Email',
                    map: 'Email Address',
                    type: 'string'
                },
                {
                    name: 'Opportunities',
                    map: 'Opportunities',
                    type: 'array'
                },
                {
                    name: 'AssignedTo',
                    map: 'Assigned to',
                    type: 'string'
                },
            ],
            localdata: dummyStudents
        };
        var dataAdapter = new $.jqx.dataAdapter(source);
        var nameRenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
            var rowData = jq331('#studentsgrid').jqxGrid('getrowdata', row);
            if (rowData && rowData.FName) {
                return '<div class="jqx-grid-cell-left-align" style="margin-top: 8px;padding-top:10px;padding-bottom:10px;">' +
                    '<span style="color:cornflowerblue;font-weight:500;">' + rowData.FName + ' ' + rowData.LName + '</span>' +
                    '<div class="badge text-capitalize" style="padding:2px;margin-left:5px;color:gray;background-color:whitesmoke;">' + rowData.City + '</div>' +
                    '</div>';
            } else {
                return '???';
            }
        };
        var editRenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
            var rowData = jq331('#studentsgrid').jqxGrid('getrowdata', row);
            var emailcontents = '';
            var mobilecontents = '';
            if (rowData && rowData.Email) {
                emailcontents = '<span data-clipboard-text="' + rowData.Email + '" data-val="' + rowData.Email + '" class="fa fa-at inficon"></span>';
            }
            if (rowData && rowData.Mobile) {
                mobilecontents = '<span style="margin-left:5px;" data-clipboard-text="' + rowData.Mobile + '" data-val="' + rowData.Mobile + '" class="fa fa-phone inficon"></span>';
            }
            return '<div class="jqx-grid-cell-left-align" style="margin-top: 8px;">' +
                emailcontents +
                mobilecontents +
                '</div>';
        };
        var usersrendered = function (row, columnfield, value, defaulthtml, columnproperties) {
            var rowData = jq331('#studentsgrid').jqxGrid('getrowdata', row);
            return '<div class="jqx-grid-cell-left-align" style="margin-top: 8px;">' +
                '<span style="color:gray;">' + rowData.AssignedTo + '</span>&nbsp;<span style="font-size:10px;">(AO)</span><br/>' +
                '<span style="color:gray;">Sultan Haroon <span style="font-size:10px;">(C)</span>&nbsp;<i style="color:turquoise" class="fa fa-envelope"></i></span></div>'
        };
        var opprenderer = function (row, columnfield, value, defaulthtml, columnproperties) {
            var rowData = jq331('#studentsgrid').jqxGrid('getrowdata', row);
            if (rowData && rowData.Opportunities && rowData.Opportunities.length > 0) {
                var ss = '';
                for (var i = 0; i < rowData.Opportunities.length; i++) {
                    var opp = rowData.Opportunities[i];
                    var appStatus = opp['Application Status'];
                    if (appStatus) {
                        appStatus = appStatus.split('_')[1];
                    }
                    if (i == 0) {
                        ss = ss + '<p style="font-weight:600;margin-bottom:0px;margin-top:5px;">' +
                            opp['Opportunity Name'] + '&nbsp;&nbsp;' +
                            '<span class="badge" style="font-size:11px;background-color:wheat;color:darkslategray;">' + opp['Sales Stage'] + ' </span>&nbsp;&nbsp;' +
                            '<span class="badge" style="font-size:11px;background-color:seashell;color:darkslategray;">' + appStatus + ' </span>' +
                            '</p>' +
                            '<span class="badge" style="color:gray;background-color:none;">' + opp['Institute'] + '</span>';

                    } else {
                        ss = ss + '<p style="font-weight:600;margin-bottom:0px;margin-top:15px;">' +
                            opp['Opportunity Name'] + '&nbsp;&nbsp;' +
                            '<span class="badge" style="font-size:11px;background-color:wheat;color:darkslategray;">' + opp['Sales Stage'] + ' </span>&nbsp;&nbsp;' +
                            '<span class="badge" style="font-size:11px;background-color:seashell;color:darkslategray;">' + appStatus + ' </span>' +
                            '</p>' +
                            '<span class="badge" style="color:gray;background-color:none;">' + opp['Institute'] + '</span>';
                    }
                }
                return '<div class="jqx-grid-cell-left-align" style="margin-top: 8px;">' + ss + '</div>'
            } else {
                return null;
            }
        };
        jq331("#studentsgrid").jqxGrid({
            width: '100%',
            theme: 'light',
            source: dataAdapter,
            showtoolbar: true,
            pageable: true,
            autorowheight: true,
            selectionmode: 'none',
            rowsheight: 50,
            enablehover: false,
            autoheight: true,
            rendertoolbar: function (statusbar) {
                // appends buttons to the status bar.
                var container = jq331("<div style='overflow: hidden; position: relative; margin: 5px;'></div>");
                var searchButton = jq331("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../jqx/js/styles/images/search.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Find</span></div>");
                container.append(searchButton);
                statusbar.append(container);
                searchButton.jqxButton({ width: 50, height: 15, theme: 'light' });
                // search for a record.
                searchButton.click(function (event) {
                    debugger;
                    var offset = jq331("#studentsgrid").offset();
                    jq331("#jqxwindow").jqxWindow('open');
                    jq331("#jqxwindow").jqxWindow('move', offset.left + 30, offset.top + 30);
                });
            },
            columns: [
                /*{
                    width: '10%',
                    text: 'Id',
                    datafield: 'Id'
                },*/
                {
                    text: 'Name',
                    datafield: 'FName',
                    width: '25%',
                    cellsrenderer: nameRenderer
                },
                {
                    text: 'Opportunities',
                    datafield: 'Opportunities',
                    cellsrenderer: opprenderer
                },
                {
                    text: 'Users',
                    datafield: 'AssignedTo',
                    cellsrenderer: usersrendered
                },
                {
                    text: 'Edit',
                    datafield: 'Id',
                    cellsrenderer: editRenderer
                }
            ]
        });
        jq331("#jqxwindow").jqxWindow({ resizable: false, autoOpen: false, width: 210, height: 180 });
        jq331('.inficon').off('mouseover');
        jq331('.inficon').off('click');
        jq331(".inficon").on("mouseover", function () {
            var msg = jq331(this).attr('data-val');
            toastr.info('click to copy.', msg, { "timeOut": 3000 });
        });
        jq331(".inficon").on("click", function () {
            var msg = jq331(this).attr('data-val');
            toastr.success('', 'copied', { "timeOut": 3000 });
        });
        new ClipboardJS('.inficon');
    }
}