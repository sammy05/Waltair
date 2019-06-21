var bgColor = "#3b5998";
var sidebarHtml =
    //#3b5998  #1976D2 1D65A6
    '<div class="w3-sidebar w3-bar-block"  style="width:12%; background-color:' + bgColor + '" id="mySidebar">'
    + '<a href="Main.aspx" target="_blank"><img src="Image/fbimg154290272204768430.jpg" alt="logo" width="100%"/></a>'
    //+'<br/>'
    //+ '<a href="Main.aspx" target="_blank" style="text-decoration: none" rel="noreferrer"'
    //+ 'class="w3-red">Operating Frieght</a>' 
    + '<div class="w3-dropdown-hover">'
    + '<button type="button" class="w3-button w3-text-white">Operating Frieght <i class="fa fa-caret-down"></i></button>'
    + '<div class="w3-bar-block w3-dropdown-content w3-card-4" style="margin-left:50%">'
    + '<div class="btn-group dropright">'
    + '<button type="button" class="w3-bar-item w3-button w3-hover-green dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
    + 'Siding Freight Loading Details'
    + '</button>'
    + '<div class="dropdown-menu" style="margin-left:85%; margin-top:-30%">'
    + '<button  type="button" class="dropdown-item w3-bar-item w3-button w3-hover-green" onclick="setImageMapA()">Map</button>'
    + '<button  type="button" class="dropdown-item w3-bar-item w3-button w3-hover-green" onclick="openDashboardA()">Dashboard</button>'
    + '</div>'
    + '</div>'
    + '<div class="btn-group dropright">'
    + '<button type="button" class="w3-bar-item w3-button w3-hover-green dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
    + 'Rail Coefficient of Siding'
    + '</button>'
    + '<div class="dropdown-menu" style="margin-left:85%;margin-top:-30%">'
    + '<button  type="button" class="dropdown-item w3-bar-item w3-button w3-hover-green" onclick="setImageMapB()">Map</button>'
    + '<button  type="button" class="dropdown-item w3-bar-item w3-button w3-hover-green" onclick="openDashboardA()">Dashboard</button>'
    + '</div>'
    + '</div>'
    + '<button type="button" class="w3-bar-item w3-button w3-hover-green" onclick="setImageMapC()">Area 3</button>'
    + '<button type="button" class="w3-bar-item w3-button w3-hover-green" onclick="setImageMapD()">All</button>'
    + '</div>'
    + '</div>'
    + '<a href="https://www.twitter.com" target="_blank" style="text-decoration: none" rel="noreferrer"'
    + 'class="w3-orange">Commercial Coaching & Others</a>'
    + '<a href="https://www.google.com" target="_blank" style="text-decoration: none" rel="noreferrer"'
    + 'class="w3-blue">Manpower</a>'
    + '<a href="https://www.yahoo.com" target="_blank" style="text-decoration:none;background-color:#4CAF50" rel="noreferrer"'
    + 'class="">S&T</a>'
    + '<a href="https://www.hdfcbank.com" target="_blank" style="text-decoration: none" rel="noreferrer"'
    + 'class="w3-red">Electrical</a>'
    + '</div>';

var logoutButton = '<div class="pull-right w3-margin-right">'
    + '<button class="w3-button w3-round w3-red navbar-btn w3-block" formaction="Logout.aspx">Logout</button>'
    + '</div>';

var navbar =
    '<nav id="navbarId" class="navbar navbar-fixed-top w3-text-black" style="background-color:' + bgColor + '">'
    + '<div id="divNavbar" ></div>'
    + '<h2 style = "margin-left: 16%" class="w3-text-white" > Waltair (Visakhapatnam) Railway Division</h2 >'
    + '</nav>';

$(document).ready(
    function () {
        //$('#form1').prepend(navbar);
        //$('#divNavbar').prepend('<div id="divSideBar"></div>'); //class="nav navbar-nav"
        //$('#divSideBar').html(sidebarHtml);
        //$("#mySidebar").find("a:gt(0)").addClass("w3-border w3-bar-item w3-block w3-button w3-hover-blue-gray");
        //document.getElementById("mySidebar").style.width = "14%";
        //document.getElementById("mySidebar").style.marginTop = "5%";
        //document.getElementById("navbarId").marginLeft = "14%";
        //document.getElementById("mySidebar").style.display = "block";
        //document.getElementById("form1").style.marginLeft = "14%";
        //$('#divNavbar').append(logoutButton);
        $('#navbarId').append('<h2 class="w3-text-white w3-center" > Waltair(SCoR) and Rayagada(ECoR) Divisons</h2 >');
    });

function setImageMapA() {
    setImageFilteredMap('p');
}

function setImageMapB() {
    setImageFilteredMap('b');
}

function setImageMapC() {
    setImageFilteredMap('c');
}

function setImageMapD() {
    setImageFilteredMap('ALL');
}

function openDashboardA() {
    var url = "http://affine.in:5601/app/kibana#/dashboard/d96514e0-8812-11e9-9de4-49ee7ccdc029?_g=()&embed=true";
    var win = window.open(url, '_blank');
    //win.focus();
}

function openDashboardB() {
    var url = "http://affine.in:5601/app/kibana#/dashboard/0435c1e0-822a-11e9-b675-696965515802?_g=()&embed=true";
    var win = window.open(url, '_blank');
    //win.focus();
}

//function GetConstructionOffices() {
//    $(':button').attr('disabled', true);
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: "Main.aspx/GetConstructionOffices",
//        data: "",
//        dataType: "json",
//        success: function (response) {
//            $(':button').attr('disabled', false);


//            var responseData = response.d;
//            var imageMapData = responseData.split('~')[0];
//            //data = responseData.split('~')[1];
//            data = JSON.parse(responseData.split('~')[1]);

//            $(".activeMap").remove();
//            $("#imageDiv").append(imageMapData);

//            setInitialState(0.56, false);
//            $('.activeMap > area').click(function () {
//                showModal(this.id);
//            });
//        },
//        error: function (error) {
//            console.log(error);
//            $(':button').attr('disabled', false);
//        },
//        statusCode: {
//            500: function () {
//                $(':button').attr('disabled', false);
//                console.log("Error code 500");
//            }
//        }
//    });
//    //sendAjaxCall("Main.aspx/GetConstructionOffices", false);
//}

var header;
function processData(responseData) {
    $('#modalDialog').removeClass('modal-xl');
    $('#modalDialog').removeClass('modal-lg');
    $('#modalDialog').addClass('modal-lg');
    $(':button').attr('disabled', false);
    //var responseData = response.d;
    var imageMapData = responseData.split('~')[0];
    //data = responseData.split('~')[1];
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
    sendAjaxCall("Main.aspx/GetFreightLoading", false, true);
}

function GetFreightTrainExamData() {
    sendAjaxCall("Main.aspx/GetFreightTrainExamData", false,true);
}

function GetFreightTrainExamEarningData() {
    sendAjaxCall("Main.aspx/GetFreightTrainExamEarningData", false, true);
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
    sendAjaxCall("Main.aspx/GetMajorOffices", false, true);
}

function GetLHTrainForming() {
    sendAjaxCall("Main.aspx/GetLHTrainForming", false, true);
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

