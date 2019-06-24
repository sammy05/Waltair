<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CyanLine.aspx.cs" Inherits="ImageMapEx.CyanLine" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cyan Line</title>
    <script>
        var dataPresent = true;
        $(document).ready(function () {
            //setInitialState(0.60);
            //$(imageDiv).draggable();
        });

        $(window).on("load", function () {
            setInitialState(0.63);
            $(imageDiv).draggable();
            //setColor(0);
        });

        var data = {};
        data['NMDCKirandul'] = { 'Color': '#FF5733', 'Name': 'NMDC Kirandul', 'Url': 'https://www.google.com/', 'Details': [{ 'Freight': 1000, 'Amount': 5000 }, { 'Freight': 2000, 'Amount': 7000 }, { 'Freight': 3000, 'Amount': 15000 }] };
        data['Chhatariput'] = { 'Color': '#F4D03F', 'Name': 'Chhatariput', 'Url': 'https://www.apple.com/', 'Details': [{ 'Freight': 1200, 'Amount': 35000 }, { 'Freight': 2100, 'Amount': 17000 }, { 'Freight': 3600, 'Amount': 25000 }] };
        data['Jeypore'] = { 'Color': '#FF5733', 'Name': 'Jeypore', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['Koraput'] = { 'Color': '#F4D03F', 'Name': 'Koraput', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Danapur'] = { 'Color': '#FF5733', 'Name': 'Danapur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Khodapa'] = { 'Color': '#7DCEA0', 'Name': 'Khodapa', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Charamulakusimi'] = { 'Color': '#A9CCE3', 'Name': 'Charamulakusimi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KotparRoad'] = { 'Color': '#7DCEA0', 'Name': 'Kotpar Road', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Ambagaon'] = { 'Color': '#FF5733', 'Name': 'Ambagaon', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Amagura'] = { 'Color': '#7DCEA0', 'Name': 'Amagura', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Naktisemra'] = { 'Color': '#FF5733', 'Name': 'Naktisemra', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Jagdalpur'] = { 'Color': '#A9CCE3', 'Name': 'Jagdalpur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KumharMarenga'] = { 'Color': '#A9CCE3', 'Name': 'Kumhar Marenga', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Tokopal'] = { 'Color': '#A9CCE3', 'Name': 'Tokopal', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bodearapur'] = { 'Color': '#A9CCE3', 'Name': 'Bodearapur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Dilimili'] = { 'Color': '#FF5733', 'Name': 'Dilimili', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Silakjhori'] = { 'Color': '#F4D03F', 'Name': 'Silakjhori', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kumarsodra'] = { 'Color': '#7DCEA0', 'Name': 'Kumarsodra', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kaklur'] = { 'Color': '#FF5733', 'Name': 'Kaklur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kawaragaon'] = { 'Color': '#A9CCE3', 'Name': 'Kawaragaon', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Dabpal'] = { 'Color': '#7DCEA0', 'Name': 'Dabpal', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Gidam'] = { 'Color': '#A9CCE3', 'Name': 'Gidam', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Dantewara'] = { 'Color': '#FF5733', 'Name': 'Dantewara', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Kamalur'] = { 'Color': '#F4D03F', 'Name': 'Kamalur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bhansi'] = { 'Color': '#F4D03F', 'Name': 'Bhansi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['Bacheli'] = { 'Color': '#A9CCE3', 'Name': 'Bacheli', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

    </script>
</head>
<body>
    <form id="form1" runat="server" draggable="true">
        <%--<div class="navbar w3-margin btn-group" id="buttonDiv"></div>
        <div class="w3-margin btn-group pull-right" id="filterDiv"></div>--%>
        <%--class="container-fluid"--%>

        <%--        <nav class="navbar navbar-fixed-top w3-text-black" style="background-color:#1976D2">
            <div id="divNavbar"></div>
            <h2 style="margin-left:16%" class="w3-text-white">Waltair (Visakhapatnam) Railway Division</h2>
        </nav>--%>
        <br />
        <br />
        <div class="w3-margin btn-group" id="buttonDiv"></div>
        <div id="imageDiv" class="w3-container" style="margin-left: 15%; margin-top: 0">
            <%--<img id="mainImg" src="Image/Cyan%20color.jpg" usemap="#image-map" class="w3-centered" />--%>
            <img id="mainImg" src="Image/Cyan_rotated_1.jpeg" usemap="#image-map" class="w3-centered" />
            <map name="image-map" class="activeMap">
                <area target="_blank" id="NMDCKirandul" title="NMDCKirandul" coords="700,2985,53" shape="circle">
                <area target="_blank" id="Chhatariput" title="Chhatariput" coords="4280,2385,52" shape="circle">
                <area target="_blank" id="Jeypore" title="Jeypore" coords="4189,2540,44" shape="circle">
                <area target="_blank" id="Danapur" title="Danapur" coords="3989,2280,51" shape="circle">
                <area target="_blank" id="Khodapa" title="Khodapa" coords="3753,2044,46" shape="circle">
                <area target="_blank" id="Charamulakusimi" title="Charamulakusimi" coords="3625,1964,47" shape="circle">
                <area target="_blank" id="KotparRoad" title="KotparRoad" coords="3509,1924,47" shape="circle">
                <area target="_blank" id="Ambagaon" title="Ambagaon" coords="3381,1928,45" shape="circle">
                <area target="_blank" id="Amagura" title="Amagura" coords="3161,1850,53" shape="circle">
                <area target="_blank" id="Naktisemra" title="Naktisemra" coords="2973,1800,51" shape="circle">
                <area target="_blank" id="Jagdalpur" title="Jagdalpur" coords="2777,1828,45" shape="circle">
                <area target="_blank" id="KumharMarenga" title="KumharMarenga" coords="2597,1888,53" shape="circle">
                <area target="_blank" id="Tokopal" title="Tokopal" coords="2417,1996,44" shape="circle">
                <area target="_blank" id="Bodearapur" title="Bodearapur" coords="2229,2112,45" shape="circle">
                <area target="_blank" id="Dilimili" title="Dilimili" coords="2013,2216,46" shape="circle">
                <area target="_blank" id="Silakjhori" title="Silakjhori" coords="1790,2028,51" shape="circle">
                <area target="_blank" id="Kumarsodra" title="Kumarsodra" coords="1793,2300,48" shape="circle">
                <area target="_blank" id="Kaklur" title="Kaklur" coords="1605,2412,47" shape="circle">
                <area target="_blank" id="Kawaragaon" title="Kawaragaon" coords="1373,2384,49" shape="circle">
                <area target="_blank" id="Dabpal" title="Dabpal" coords="1156,2316,50" shape="circle">
                <area target="_blank" id="Gidam" title="Gidam" coords="933,2216,52" shape="circle">
                <area target="_blank" id="Dantewara" title="Dantewara" coords="773,2232,48" shape="circle">
                <area target="_blank" id="Kamalur" title="Kamalur" coords="683,2388,48" shape="circle">
                <area target="_blank" id="Bhansi" title="Bhansi" coords="657,2568,43" shape="circle">
                <area target="_blank" id="Bacheli" title="Bacheli" coords="680,2745,50" shape="circle">
            </map>
        </div>
    </form>
</body>
</html>
