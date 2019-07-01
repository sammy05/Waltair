
$(document).ready(
    function () {
        $('#navbarId').append('<h2 class="w3-text-white w3-center" > Waltair(SCoR) and Rayagada(ECoR) Divisions</h2 >');
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

function GetConstructionOffices() {
    sendAjaxCall("Main.aspx/GetConstructionOffices", false, true);
}

function GetRailCoefficient() {
    sendAjaxCall("Main.aspx/GetRailCoefficient", false);
}

function GetFreightLoading() {
    sendAjaxCall("Main.aspx/GetFreightLoading", false);
}

function GetFreightTrainExamData() {
    sendAjaxCall("Main.aspx/GetFreightTrainExamData", false);
}

function GetFreightTrainExamEarningData() {
    sendAjaxCall("Main.aspx/GetFreightTrainExamEarningData", false);
}

function GetPassengerTraffic() {
    sendAjaxCall("Main.aspx/GetPassengerTraffic", false);
}


function GetSignalDETU() {
    sendAjaxCall("Main.aspx/GetSignalDETU", false);
}

function GetSignalDESU() {
    sendAjaxCall("Main.aspx/GetSignalDESU", false);
}

function GetSecurity() {
    sendAjaxCall("Main.aspx/GetSecurity", false);
}

function GetRPFBarracks() {
    sendAjaxCall("Main.aspx/GetRPFBarracks", false);
}

function GetOtherOffices() {
    sendAjaxCall("Main.aspx/GetOtherOffices", false);
}

function GetOfficesOutsideVSKP() {
    sendAjaxCall("Main.aspx/GetOfficesOutsideVSKP", false);
}

function GetRunningRooms() {
    sendAjaxCall("Main.aspx/GetRunningRooms", false);
}

function GetRestRooms() {
    sendAjaxCall("Main.aspx/GetRestRooms", false);
}

function GetChangeStations() {
    sendAjaxCall("Main.aspx/GetChangeStations",false);
}

function GetQuarters() {
    sendAjaxCall("Main.aspx/GetQuarters", false);
}

function GetART() {
    sendAjaxCall("Main.aspx/GetART", false);
}

function GetARME() {
    sendAjaxCall("Main.aspx/GetARME", false);
}

function GetBridges() {
    sendAjaxCall("Main.aspx/GetBridges", false);
}

function GetCWFacilities() {
    sendAjaxCall("Main.aspx/GetCWFacilities", false);
}

function GetWeighBridges() {
    sendAjaxCall("Main.aspx/GetWeighBridges", false, true);
}

function GetCrewBookingPoints() {
    sendAjaxCall("Main.aspx/GetCrewBookingPoints", false);
}

function GetLocoSheds() {
    sendAjaxCall("Main.aspx/GetLocoSheds", false);
}

function GetEmployeeDetails() {
    sendAjaxCall("Main.aspx/GetEmployeeDetails", false);
}

function GetCommunityHalls() {
    sendAjaxCall("Main.aspx/GetCommunityHalls", false, true);
}

function GetOfficersClub() {
    sendAjaxCall("Main.aspx/GetOfficersClub", false, true);
}

function GetORH() {
    sendAjaxCall("Main.aspx/GetORH", false);
}

function GetSRH() {
    sendAjaxCall("Main.aspx/GetSRH", false);
}

function GetRailwayInstitutes() {
    sendAjaxCall("Main.aspx/GetRailwayInstitutes", false, true);
}

function GetSportsComplex() {
    sendAjaxCall("Main.aspx/GetSportsComplex", false);
}

function GetTrainingCenters() {
    sendAjaxCall("Main.aspx/GetTrainingCenters", false);
}

function GetMedicalFacilities() {
    sendAjaxCall("Main.aspx/GetMedicalFacilities", false);
}

function GetPWayUnits() {
    sendAjaxCall("Main.aspx/GetPWayUnits", false);
}

function GetMajorOffices() {
    sendAjaxCall("Main.aspx/GetMajorOffices", false);
}

function GetLHTrainForming() {
    sendAjaxCall("Main.aspx/GetLHTrainForming", false);
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

