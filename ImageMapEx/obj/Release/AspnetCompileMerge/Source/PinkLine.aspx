<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PinkLine.aspx.cs" Inherits="ImageMapEx.PinkLine" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pink Line</title>
    <script>
        var dataPresent = true;
        $(document).ready(function () {
            //setInitialState(0.4);
            //$(imageDiv).draggable();
        });

        $(window).on("load", function () {
            setInitialState(0.40);
            $(imageDiv).draggable();
        });

        var data = {};
        data['Malligura'] = { 'Name': 'Malligura', 'Url': 'https://www.google.com/', 'Details': [{ 'Freight': 1000, 'Amount': 5000 }, { 'Freight': 2000, 'Amount': 7000 }, { 'Freight': 3000, 'Amount': 15000 }] };
        data['Jarati'] = { 'Name': 'Jarati', 'Url': 'https://www.apple.com/', 'Details': [{ 'Freight': 1200, 'Amount': 35000 }, { 'Freight': 2100, 'Amount': 17000 }, { 'Freight': 3600, 'Amount': 25000 }] };
        data['Manabar'] = { 'Name': 'Manabar', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['Koraput'] = { 'Name': 'Koraput', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Suku'] = { 'Name': 'Suku', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Paliba'] = { 'Name': 'Paliba', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Machukonda'] = { 'Name': 'Machukonda', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bheja'] = { 'Name': 'Bheja', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Padua'] = { 'Name': 'Padua', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Darliput'] = { 'Name': 'Darliput', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

    </script>
</head>
<body>
    <form id="form1" runat="server" draggable="true">
        <%--<div class="navbar w3-margin btn-group" id="buttonDiv"></div>
        <div class="w3-margin btn-group pull-right" id="filterDiv"></div>--%>
        <%--<nav class="navbar navbar-fixed-top w3-text-black" style="background-color:#1976D2">
            <div id="divNavbar"></div>
            <h2 style="margin-left:16%" class="w3-text-white">Waltair (Visakhapatnam) Railway Division</h2>
        </nav>--%>
        <br />
        <br />
        <div class="w3-margin btn-group" id="buttonDiv"></div>
        <div id="imageDiv" class="w3-container" style="margin-left: 15%; margin-top: 0">
            <img id="mainImg" src="Image/Megenta color.jpg" usemap="#image-map" class="w3-centered"/>
            <map name="image-map" class="activeMap">
                <area target="_blank" id="Malligura" coords="1800,1241,51" shape="circle">
                <area target="_blank" id="Jarati" coords="1899,1409,43" shape="circle">
                <area target="_blank" id="Manabar" coords="2040,1682,49" shape="circle">
                <area target="_blank" id="Koraput" coords="2037,1973,49" shape="circle">
                <area target="_blank" id="Suku" coords="1983,2114,47" shape="circle">
                <area target="_blank" id="Paliba" coords="1878,2225,46" shape="circle">
                <area target="_blank" id="Machukonda" coords="1758,2351,45" shape="circle">
                <area target="_blank" id="Bheja" coords="1719,2539,46" shape="circle">
                <area target="_blank" id="Padua" coords="1761,2767,45" shape="circle">
                <area target="_blank" id="Darliput" coords="1842,2998,47" shape="circle">
            </map>
        </div>
    </form>
</body>
</html>
