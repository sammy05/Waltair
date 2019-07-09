<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ImageMapEx.Main" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <title>Waltair Rail Map</title>
    <link rel="shortcut icon" href="\Image\IndianRailLogo.ico" />
    <script>
        var dataPresent = true;
        $(document).ready(function () {
            $('.dropdown-submenu button.test').on("click", function (e) {
                $('.test').next('div').hide();
                $(this).next('div').toggle();
                e.stopPropagation();
                e.preventDefault();
            });
        });

        $(window).on("load", function () {
            $("#imageDiv").draggable();
            setImageMap('NONE');
        });

        function showDropdown() {
            var x = document.getElementById("dropdownOnClick");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }

        function setImageMap(filter) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Main.aspx/GetImageMap",
                data: "{filter:'" + filter + "'}",
                dataType: "json",
                success: function (response) {
                    $(".activeMap").remove();
                    $("#imageDiv").append(response.d);
                    setInitialState(0.56, true);
                    $('.activeMap > area').click(function () {
                        showModal(this.id);
                    });
                },
                error: function (error) {
                    console.log(error);
                },
                statusCode: {
                    500: function () {
                        console.log("Error code 500");
                    }
                }
            });
        }

        var data = {};
    </script>

    <style>
        .dropdown-submenu {
            position: relative;
        }

            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -1px;
                /*width: auto;*/
                /*margin: 0 !important;*/
                padding: 0 !important;
                z-index: 10;
            }

        .w3-block {
            display: block;
            width: 100%;
            text-align: left;
        }

        .dropdown-menu {
            min-width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" draggable="true" style="margin-left: 15%">
        <!--#include file="HTML/navbar.html" -->
        <br />
        <br />
        <div class="w3-margin btn-group" id="buttonDiv">
            <button id="toggleBtn" type="button" onclick="toggle()"><i class="fa fa-caret-left"></i></button>
            <button type="button" onclick="zoomin()" class="toggle"><i class="fa fa-search-plus"></i></button>
            <button type="button" onclick="zoomout()" class="toggle"><i class="fa fa-search-minus"></i></button>
            <button type="button" onclick="document.location.reload(true)" class="toggle"><i class="fa fa-repeat"></i></button>
            <button id="controlBtn" type="button" onclick="hidebars()" class="toggle"><i class="fa fa-arrows-alt"></i></button>
            <button id="conetxtBtn" type="button" class="toggle" hidden="hidden"></button>
        </div>

<%--        <div class="w3-margin pull-right" id="contextDiv">
        </div>--%>
        <div id="imageDiv" class="w3-container" style="margin-left: 15%; margin-top: 5%">
            <img id="mainImg" src="Image\WaltairMap - Copy.jpg" usemap="#image-map" alt="waltair rail map" />
        </div>
    </form>
</body>

</html>
