<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RedLine.aspx.cs" Inherits="ImageMapEx.RedLine" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Red Line</title>
    <script>
        var dataPresent = true;
        $(document).ready(function () {
            //setInitialState(0.6);
            //$(imageDiv).draggable();
        });

        $(window).on("load", function () {
            setInitialState(0.46);
            $(imageDiv).draggable();
        });
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
            <img id="mainImg" src="Image/Red%20color_Cropped.jpg" usemap="#image-map" class="w3-centered"/>
            <map name="image-map" class="activeMap">
            </map>
        </div>
    </form>
</body>
</html>
