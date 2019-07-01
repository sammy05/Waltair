var bgColor = "#3b5998";
var sidebarHtml =
    //#3b5998  #1976D2 1D65A6
    '<div class="w3-sidebar w3-bar-block"  style="width:12%; background-color:' + bgColor + '" id="mySidebar">'
    + '<a href="Main.aspx" target="_blank"><img src="Image/fbimg154290272204768430.jpg" width="100%"/></a>'
    //+'<br/>'
    + '<a href="Main.aspx" target="_blank" style="text-decoration: none"'
    + 'class="w3-border w3-red w3-bar-item w3-block w3-button w3-hover-blue-gray">Waltair Division</a>'
    + '<a href="https://www.twitter.com" target="_blank" style="text-decoration: none"'
    + 'class="w3-border w3-orange w3-bar-item w3-block w3-button w3-hover-blue-gray">Corporate</a>'
    + '<a href="https://www.google.com" target="_blank" style="text-decoration: none"'
    + 'class="w3-border w3-blue w3-bar-item w3-block w3-button w3-hover-blue-gray">Commercial</a>'
    + '<a href="https://www.yahoo.com" target="_blank" style="text-decoration:none;background-color:#4CAF50"'
    + 'class="w3-border w3-bar-item w3-block w3-button w3-hover-blue-gray">Retail</a>'
    + '<a href="https://www.hdfcbank.com" target="_blank" style="text-decoration: none"'
    + 'class="w3-border w3-red w3-bar-item w3-block w3-button w3-hover-blue-gray">Government</a>'
    + '</div>';

var logoutButton = '<div class="pull-right w3-margin-right">'
    + '<button class="w3-button w3-round w3-red navbar-btn w3-block" formaction="Logout.aspx">Logout</button>'
    + '</div>';

var navbar =
    '<nav id="navbarId" class="navbar navbar-fixed-top w3-text-black" style="background-color:' + bgColor + '">'
    + '<div id="divNavbar" ></div>'
    + '<h2 style = "margin-left: 14%" class="w3-text-white" > Waltair (Visakhapatnam) Railway Division</h2 >'
    + '</nav>';

$(document).ready(
    function () {
        $('#form1').prepend(navbar);
        $('#divNavbar').prepend('<div class="nav navbar-nav" id="divSideBar"></div>');
        $('#divSideBar').html(sidebarHtml);
        document.getElementById("mySidebar").style.width = "12%";
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("form1").style.marginLeft = "12%";
        $('#divNavbar').append(logoutButton);
    });