function getOptionHTML(optionArray, selectedField,selectedVal){
    var optionHTML = '';
    for(key in optionArray){
        if(selectedVal==key)
            optionHTML += '<option selected value="'+key+'">'+optionArray[key]+'</option>';
        else
            optionHTML += '<option value="'+key+'">'+optionArray[key]+'</option>';
    }

    jq331("#"+selectedField).html(optionHTML).select2({ allowClear: true });
    //     var $theSelect = jq331('#'+selectedField);
    //     $theSelect.select2({ allowClear: true });
}
function getOptionHTMLByVar(flag, selectedField,selectedVal,disFlag=""){
    var data =JSON.parse(localStorage.getItem('usersData'));
    var allCounselors=data['0'].allCounselors;
    var allOffices=data['0'].allOffices;
    var allUsers=data['0'].allUsers;
    var allSubAgents=data['0'].allSubAgents;
    var allSponsorOrganizations=data['0'].allSponsorOrganizations;
    var allBankAccounts=data['0'].allBankAccounts;
    var allCurrencies=data['0'].allCurrencies;
    var allCounselorsAdmissionOfficers=data['0'].allCounselorsAdmissionOfficers;
    var allAdmissionOfficers=data['0'].allAdmissionOfficers;
    var allSecurityGroups=data['0'].allSecurityGroups;
    var optionHTML = '<option value="-1" disabled selected>Select</option>';
	if(disFlag=='f_enable')
    var optionHTML = '<option value="" >Select</option>';


    if (flag=='Counselors') {
        for (key in allCounselors) {
            if(selectedVal==allCounselors[key]['0'])
                optionHTML += '<option selected value="' + allCounselors[key]['0'] + '">' + allCounselors[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allCounselors[key]['0'] + '">' + allCounselors[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }else if (flag == 'allCounselorsAdmissionOfficers') {
        for (key in allCounselorsAdmissionOfficers) {
            if(selectedVal==allCounselorsAdmissionOfficers[key]['0'])
                optionHTML += '<option selected value="' + allCounselorsAdmissionOfficers[key]['0'] + '">' + allCounselorsAdmissionOfficers[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allCounselorsAdmissionOfficers[key]['0'] + '">' + allCounselorsAdmissionOfficers[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
    else if (flag=='Offices') {
        for (key in allOffices) {
            if(selectedVal==allOffices[key]['0'])
                optionHTML += '<option selected value="' + allOffices[key]['0'] + '">' + allOffices[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allOffices[key]['0'] + '">' + allOffices[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
    else if (flag=='allUsers') {
        for (key in allUsers) {
            if(selectedVal==allUsers[key]['0'])
                optionHTML += '<option selected value="' + allUsers[key]['0'] + '">' + allUsers[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allUsers[key]['0'] + '">' + allUsers[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
    else if (flag=='allSubAgents') {
        for (key in allSubAgents) {
            if(selectedVal==allSubAgents[key]['0'])
                optionHTML += '<option selected value="' + allSubAgents[key]['0'] + '">' + allSubAgents[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allSubAgents[key]['0'] + '">' + allSubAgents[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }

    else if (flag=='allSponsorOrganizations') {
        for (key in allSponsorOrganizations) {
            if(selectedVal==allSponsorOrganizations[key]['0'])
                optionHTML += '<option selected value="' + allSponsorOrganizations[key]['0'] + '">' + allSponsorOrganizations[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allSponsorOrganizations[key]['0'] + '">' + allSponsorOrganizations[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
	else if (flag=='allBankAccounts') {
        for (key in allBankAccounts) {
            if(selectedVal==allBankAccounts[key]['0'])
                optionHTML += '<option selected value="' + allBankAccounts[key]['0'] + '">' + allBankAccounts[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allBankAccounts[key]['0'] + '">' + allBankAccounts[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
	else if (flag=='allCurrencies') {
        for (key in allCurrencies) {
            if(selectedVal==allCurrencies[key]['0'])
                optionHTML += '<option selected value="' + allCurrencies[key]['0'] + '">' + allCurrencies[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allCurrencies[key]['0'] + '">' + allCurrencies[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
	else if (flag=='allAdmissionOfficers') {
        for (key in allAdmissionOfficers) {
            if(selectedVal==allAdmissionOfficers[key]['0'])
                optionHTML += '<option selected value="' + allAdmissionOfficers[key]['0'] + '">' + allAdmissionOfficers[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allAdmissionOfficers[key]['0'] + '">' + allAdmissionOfficers[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
	else if (flag=='allSecurityGroups') {
        for (key in allSecurityGroups) {
            if(selectedVal==allSecurityGroups[key]['0'])
                optionHTML += '<option selected value="' + allSecurityGroups[key]['0'] + '">' + allSecurityGroups[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allSecurityGroups[key]['0'] + '">' + allSecurityGroups[key]['1'] + '</option>';
        }
        jq331("#" + selectedField).html(optionHTML);
    }
}
function popolateCounselorList(selectedField,parentVal ,selectedVal=''){
    var data =JSON.parse(localStorage.getItem('usersData'));
    var allUsersDetailedData=data['0'].allUsersDetailedData;

    var optionHTML = '<option value="">-Select-</option>';

    for (key in allUsersDetailedData) {
        if(allUsersDetailedData[key]['2']==parentVal && allUsersDetailedData[key]['5']=='Counselor') {
            if (selectedVal == allUsersDetailedData[key]['0'])
                optionHTML += '<option selected value="' + allUsersDetailedData[key]['0'] + '">' + allUsersDetailedData[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allUsersDetailedData[key]['0'] + '">' + allUsersDetailedData[key]['1'] + '</option>';
        }
    }
    jq331("#" + selectedField).html(optionHTML);

}
function populateTempAssignedUser(selectedField,parentVal ,selectedVal=''){
    var data =JSON.parse(localStorage.getItem('usersData'));
    var allUsersDetailedData=data['0'].allUsersDetailedData;

    var optionHTML = '<option value="">-Select-</option>';

    for (key in allUsersDetailedData) {
        if(allUsersDetailedData[key]['2']==parentVal && (allUsersDetailedData[key]['5']=='Counselor' || allUsersDetailedData[key]['5']=='Admission Officer' || allUsersDetailedData[key]['5']=='Global Users')) {
            if (selectedVal == allUsersDetailedData[key]['0'])
                optionHTML += '<option selected value="' + allUsersDetailedData[key]['0'] + '">' + allUsersDetailedData[key]['1'] + '</option>';
            else
                optionHTML += '<option value="' + allUsersDetailedData[key]['0'] + '">' + allUsersDetailedData[key]['1'] + '</option>';
        }
    }
    jq331("#" + selectedField).html(optionHTML);

}
function popolateDesiredDestinations(selectedField,selectedVal='' ,ddFor){
    var data =JSON.parse(localStorage.getItem("GetSearchCourseFilters"));
    if(ddFor=='country')
        var selectedData=data.AllCountryNames;
    if(ddFor=='level')
        var selectedData=data.AllLevelNames;
    // if(ddFor=='course')
    //     var selectedData=data.AllLevelNames;
    if(ddFor=='discipline')
        var selectedData=data.AllDiciplineNames;

    var optionHTML = '<option value="">-Select-</option>';
    for (key in selectedData) {
        if (selectedVal == selectedData[key].Id)
            optionHTML += '<option selected value="' + selectedData[key].Id + '">' + selectedData[key].Name + '</option>';
        else
            optionHTML += '<option value="' + selectedData[key].Id + '">' + selectedData[key].Name + '</option>';
    }
    jq331("#" + selectedField).html(optionHTML);

}