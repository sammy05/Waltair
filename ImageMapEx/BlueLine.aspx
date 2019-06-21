<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlueLine.aspx.cs" Inherits="ImageMapEx.BlueLine" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Line</title>
    <script>
        var data;
        var dataPresent = true;
        $(document).ready(function () {
            //GetData();
        });

        $(window).on("load", function () {
            setInitialState(0.43);
            $(imageDiv).draggable();
            //setColor(0);
        });

        

        function GetData() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "BlueLine.aspx/GetData",
                data: "{}",
                dataType: "json",
                success: function (response) {
                    data = JSON.parse(response.d);
                    console.log(data);
                    dataPresent = true;
                },
                error: function (error) {
                    dataPresent = false;
                    console.log("No Data");
                    console.log(error);
                },
                statusCode: {
                    500: function () {
                        dataPresent = false;
                    }
                }
            });
        }

        //var colorData = {};

        //var data = JSON.parse(myServerSideVar);
        //console.log(myServerSideVar);

        var data = {};
        data['Donkinavalasa'] = { 'Color': '#FF5733', 'Name': 'Donkinavalasa', 'Url': 'https://www.google.com/', 'Details': [{ 'Freight': 1000, 'Amount': 5000 }, { 'Freight': 2000, 'Amount': 7000 }, { 'Freight': 3000, 'Amount': 15000 }] };
        data['Salur'] = { 'Color': '#FF5733', 'Name': 'Salur', 'Url': 'https://www.apple.com/', 'Details': [{ 'Freight': 1200, 'Amount': 35000 }, { 'Freight': 2100, 'Amount': 17000 }, { 'Freight': 3600, 'Amount': 25000 }] };
        data['Parannavalasa'] = { 'Color': '#F4D03F', 'Name': 'Parannavalasa', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['Rompalli'] = { 'Color': '#7DCEA0', 'Name': 'Rompalli', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NarayanappaValasa'] = { 'Color': '#F4D03F', 'Name': 'NarayanappaValasa', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bobilli'] = { 'Color': '#FF5733', 'Name': 'Bobilli', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Narasipuram'] = { 'Color': '#7DCEA0', 'Name': 'Narasipuram', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Sitanagaram'] = { 'Color': '#F4D03F', 'Name': 'Sitanagaram', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Paravatipuram'] = { 'Color': '#A9CCE3', 'Name': 'Paravatipuram', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['ParavatipuramTown'] = { 'Color': '#FF5733', 'Name': 'Paravatipuram Town', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Gumada'] = { 'Color': '#FF5733', 'Name': 'Gumada', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kuneru'] = { 'Color': '#FF5733', 'Name': 'Kuneru', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Jimidipeta'] = { 'Color': '#A9CCE3', 'Name': 'Jimidipeta', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Ladda'] = { 'Color': '#FF5733', 'Name': 'Ladda', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['JKPaperRayagada'] = { 'Color': '#F4D03F', 'Name': 'JK Paper Rayagada', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SingapuramRd'] = { 'Color': '#FF5733', 'Name': 'Singapuram Rd', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Theruvali'] = { 'Color': '#F4D03F', 'Name': 'Theruvali', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Keutgura'] = { 'Color': '#FF5733', 'Name': 'Keutgura', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Sikarpai'] = { 'Color': '#7DCEA0', 'Name': 'Sikarpai', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bhalumaska'] = { 'Color': '#A9CCE3', 'Name': 'Bhalumaska', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Lelligumma'] = { 'Color': '#FF5733', 'Name': 'Lelligumma', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Rauli'] = { 'Color': '#7DCEA0', 'Name': 'Rauli', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Singaramba'] = { 'Color': '#FF5733', 'Name': 'Singaramba', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Tikri'] = { 'Color': '#FF5733', 'Name': 'Tikri', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LaxmipurRd'] = { 'Color': '#F4D03F', 'Name': 'Laxmipur Rd', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kakrigumma'] = { 'Color': '#7DCEA0', 'Name': 'Kakrigumma', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Baiguda'] = { 'Color': '#F4D03F', 'Name': 'Baiguda', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Damanjodi'] = { 'Color': '#FF5733', 'Name': 'Damanjodi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Dummuriput'] = { 'Color': '#FF5733', 'Name': 'Dummuriput', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

    </script>

    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server" draggable="true">
        <%--class="container-fluid"--%>
        <%--<nav class="navbar navbar-fixed-top w3-text-black" style="background-color:#1976D2">
            <div id="divNavbar"></div>
            <h2 style="margin-left:16%" class="w3-text-white">Waltair (Visakhapatnam) Railway Division</h2>
        </nav>--%>
        <br />
        <br />
        <div class="w3-margin btn-group" id="buttonDiv"></div>
        <div id="imageDiv" class="w3-container" style="margin-left: 15%; margin-top: 0">
            <!-- The canvas tag -->
            <%--<canvas id="canvas" width="800" height="600"></canvas>--%>
            <img id="mainImg" src="Image/blue%20color_Cropped.jpg" usemap="#image-map" class="w3-centered" />
            <map name="image-map" class="activeMap">
                <area target="_blank" id="Donkinavalasa" title="Donkinavalasa" coords="1611,3237,50" shape="circle">
                <area target="_blank" id="Salur" title="Salur" coords="1033,3096,50" shape="circle">
                <area target="_blank" id="Parannavalasa" title="Parannavalasa" coords="1176,3126,50" shape="circle">
                <area target="_blank" id="Rompalli" title="Rompalli" coords="1314,3159,50" shape="circle">
                <area target="_blank" id="NarayanappaValasa" title="NarayanappaValasa" coords="1476,3081,50" shape="circle">
                <area target="_blank" id="Bobilli" title="Bobilli" coords="1644,2991,50" shape="circle">
                <area target="_blank" id="Sitanagaram" title="Sitanagaram" coords="1728,2860,50" shape="circle">
                <area target="_blank" id="Narasipuram" title="Narasipuram" coords="1800,2746,50" shape="circle">
                <area target="_blank" id="Paravatipuram" title="Paravatipuram" coords="1851,2596,45" shape="circle">
                <area target="_blank" id="ParavatipuramTown" title="ParavatipuramTown" coords="1887,2506,45" shape="circle">
                <area target="_blank" id="Gumada" title="Gumada" coords="1941,2230,50" shape="circle">
                <area target="_blank" id="Kuneru" title="Kuneru" coords="1905,2035,50" shape="circle">
                <area target="_blank" id="Jimidipeta" title="Jimidipeta" coords="1893,1870,50" shape="circle">
                <area target="_blank" id="Ladda" title="Ladda" coords="1815,1703,50" shape="circle">
                <area target="_blank" id="JKPaperRayagada" title="JKPaperRayagada" coords="1800,1496,50" shape="circle">
                <area target="_blank" id="SingapuramRd" title="SingapuramRd" coords="1830,1262,50" shape="circle">
                <area target="_blank" id="Theruvali" title="Theruvali" coords="2034,887,50" shape="circle">
                <area target="_blank" id="Keutgura" title="Keutgura" coords="1695,1232,50" shape="circle">
                <area target="_blank" id="Sikarpai" title="Sikarpai" coords="1686,1454,50" shape="circle">
                <area target="_blank" id="Bhalumaska" title="Bhalumaska" coords="1641,1601,50" shape="circle">
                <area target="_blank" id="Lelligumma" title="Lelligumma" coords="1503,1562,50" shape="circle">
                <area target="_blank" id="Rauli" title="Rauli" coords="1209,1640,50" shape="circle">
                <area target="_blank" id="Singaramba" title="Singaramba" coords="1167,1909,50" shape="circle">
                <area target="_blank" id="Tikri" title="Tikri" coords="1033,1673,50" shape="circle">
                <area target="_blank" id="LaxmipurRd" title="LaxmipurRd" coords="955,1987,50" shape="circle">
                <area target="_blank" id="Kakrigumma" title="Kakrigumma" coords="775,2287,50" shape="circle">
                <area target="_blank" id="Baiguda" title="Baiguda" coords="652,2443,50" shape="circle">
                <area target="_blank" id="Damanjodi" title="Damanjodi" coords="487,2587,50" shape="circle">
                <area target="_blank" id="Dummuriput" title="Dummuriput" coords="322,2644,50" shape="circle">
            </map>

        </div>
    </form>
</body>
</html>
