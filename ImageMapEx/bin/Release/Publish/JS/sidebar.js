
$(document).ready(
    function () {
        $('#navbarId').append('<h2 class="w3-text-white w3-center" > Loading Earnings & Assets of Waltair(SCoR) and Rayagada(ECoR) 2018-19</h2 >');
    });

var header;
function processData(responseData) {
    $('#modalDialog').removeClass('modal-xl');
    $('#modalDialog').removeClass('modal-lg');
    $('#modalDialog').addClass('modal-lg');
    $(':button').attr('disabled', false);
    var imageMapData = responseData.split('~')[0];
    header = JSON.parse(responseData.split('~')[1]);
    data = JSON.parse(responseData.split('~')[2]);

    $(".activeMap").remove();
    $("#imageDiv").append(imageMapData);

    setInitialState(0.56, false);
    $('.activeMap > area').click(function () {
        showModalWithHeader(this.id);
    });
}

function GetConstructionOffices(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetConstructionOffices", false, true);
}

function GetRailCoefficient(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetRailCoefficient", false);
}

function GetFreightLoading(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetFreightLoading", false);
}

function GetFreightTrainExamData(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetFreightTrainExamData", false);
}

function GetFreightTrainExamEarningData(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetFreightTrainExamEarningData", false);
}

function GetPassengerTraffic(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetPassengerTraffic", false);
}


function GetSignalDETU(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSignalDETU", false);
}

function GetSignalDESU(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSignalDESU", false);
}

function GetSecurity(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSecurity", false);
}

function GetRPFBarracks(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetRPFBarracks", false);
}

function GetOtherOffices(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetOtherOffices", false);
}

function GetOfficesOutsideVSKP(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetOfficesOutsideVSKP", false);
}

function GetRunningRooms(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetRunningRooms", false);
}

function GetRestRooms(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetRestRooms", false);
}

function GetChangeStations(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetChangeStations", false);
}

function GetQuarters(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetQuarters", false);
}

function GetART(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetART", false);
}

function GetARME(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetARME", false);
}

function GetBridges(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetBridges", false);
}

function GetCWFacilities(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetCWFacilities", false);
}

function GetWeighBridges(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetWeighBridges", false, true);
}

function GetCrewBookingPoints(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetCrewBookingPoints", false);
}

function GetLocoSheds(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetLocoSheds", false);
}

function GetEmployeeDetails(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetEmployeeDetails", false);
}

function GetCommunityHalls(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetCommunityHalls", false, true);
}

function GetOfficersClub(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetOfficersClub", false, true);
}

function GetORH(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetORH", false);
}

function GetSRH(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSRH", false);
}

function GetRailwayInstitutes(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetRailwayInstitutes", false, true);
}

function GetSportsComplex(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSportsComplex", false);
}

function GetTrainingCenters(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetTrainingCenters", false);
}

function GetMedicalFacilities(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetMedicalFacilities", false);
}

function GetPWayUnits(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetPWayUnits", false);
}

function SetContext(element) {
    var text = $(element).parent().prev("button").text();
    $('#conetxtBtn').text(text);
    $('#conetxtBtn').show();
}

function GetMajorOffices(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetMajorOffices", false);
}

function GetLHTrainForming(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetLHTrainForming", false);
}

function GetSupervisoryUnits(element) {
    SetContext(element);
    sendAjaxCall("Main.aspx/GetSupervisoryUnits", false);
}


function sendAjaxCall(endPoint, needXLargePopup, needSmallPopup = false) {
    $(':button').attr('disabled', true);
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: endPoint,
        data: "",
        dataType: "json",
        success: function (response) {
            processData(response.d);
            if (needXLargePopup) {
                $('#modalDialog').addClass('modal-xl');
                $('#modalDialog').removeClass('modal-lg');
            }
            else if (needSmallPopup) {
                $('#modalDialog').removeClass('modal-lg');
            }
        },
        error: function (error) {
            console.log(error);
            $(':button').attr('disabled', false);
        },
        statusCode: {
            500: function () {
                $(':button').attr('disabled', false);
                console.log("Error code 500");
            }
        }
    });
}

