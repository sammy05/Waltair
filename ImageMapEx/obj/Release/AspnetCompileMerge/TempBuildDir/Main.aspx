<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ImageMapEx.Main" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--#include file="HTML/include.html" -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <%--<script src="https://kit.fontawesome.com/0ac05e5902.js"></script>--%>
    <title>Waltair Rail Map</title>
    <script>
        var dataPresent = true;
        $(document).ready(function () {
            //setInitialState(0.60);
            //$(imageDiv).draggable();
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

        function setImageFilteredMap(filter) {
            $(':button').attr('disabled', true);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Main.aspx/GetImageMap",
                data: "{filter:'" + filter + "'}",
                dataType: "json",
                success: function (response) {
                    $(':button').attr('disabled', false);
                    $('#canvas').remove();
                    $(".activeMap").remove();
                    $("#imageDiv").append(response.d);
                    setInitialState(0.56, false);
                    $('.activeMap > area').click(function () {
                        showModal(this.id);
                    });
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

        var data = {};

        //Cyan Line
        data['KRDL'] = { 'Color': '#FF5733', 'Name': 'NMDC Kirandul', 'Url': 'https://www.google.com/', 'Details': [{ 'Freight': 1000, 'Amount': 5000 }, { 'Freight': 2000, 'Amount': 7000 }, { 'Freight': 3000, 'Amount': 15000 }] };
        data['MVG'] = { 'Color': '#F4D03F', 'Name': 'MALIGURA', 'Url': 'https://www.apple.com/', 'Details': [{ 'Freight': 1200, 'Amount': 35000 }, { 'Freight': 2100, 'Amount': 17000 }, { 'Freight': 3600, 'Amount': 25000 }] };
        data['CTS'] = { 'Color': '#FF5733', 'Name': 'CHATTRIPUT', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['JYP'] = { 'Color': '#F4D03F', 'Name': 'Jeypore', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DIR'] = { 'Color': '#FF5733', 'Name': 'Danapur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KDPA'] = { 'Color': '#16bc5e', 'Name': 'Khodapa', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['CJS'] = { 'Color': '#FF5733', 'Name': 'Charamulakusimi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KPRR'] = { 'Color': '#16bc5e', 'Name': 'Kotpar Road', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['AGB'] = { 'Color': '#FF5733', 'Name': 'Ambagaon', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['AGZ'] = { 'Color': '#16bc5e', 'Name': 'Amagura', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NKX'] = { 'Color': '#FF5733', 'Name': 'Naktisemra', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['JDB'] = { 'Color': '#FF5733', 'Name': 'Jagdalpur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KMEZ'] = { 'Color': '#FF5733', 'Name': 'Kumhar Marenga', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TPQ'] = { 'Color': '#FF5733', 'Name': 'Tokopal', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BDXX'] = { 'Color': '#FF5733', 'Name': 'Bodearapur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DMK'] = { 'Color': '#FF5733', 'Name': 'Dilimili', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SZY'] = { 'Color': '#F4D03F', 'Name': 'Silakjhori', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KMSD'] = { 'Color': '#16bc5e', 'Name': 'Kumarsodra', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KKLU'] = { 'Color': '#FF5733', 'Name': 'Kaklur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KWGN'] = { 'Color': '#FF5733', 'Name': 'Kawaragaon', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DBF'] = { 'Color': '#16bc5e', 'Name': 'Dabpal', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GIZ'] = { 'Color': '#FF5733', 'Name': 'Gidam', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DWZ'] = { 'Color': '#FF5733', 'Name': 'Dantewara', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KMLR'] = { 'Color': '#F4D03F', 'Name': 'Kamalur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BHNS'] = { 'Color': '#F4D03F', 'Name': 'Bhansi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BCHL'] = { 'Color': '#FF5733', 'Name': 'Bacheli', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['JRT'] = { 'Color': '#FF5733', 'Name': 'JARATI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        // Pink Line
        data['MVF'] = { 'Color': '#FF5733', 'Name': 'Manabar', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['KRPU'] = { 'Color': '#FF5733', 'Name': 'Koraput', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SUKU'] = { 'Color': '#FF5733', 'Name': 'Suku', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PBV'] = { 'Color': '#FF5733', 'Name': 'Paliba', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['MKRD'] = { 'Color': '#FF5733', 'Name': 'MACHHAKUND Road', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BHJA'] = { 'Color': '#FF5733', 'Name': 'Bheja', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PFU'] = { 'Color': '#FF5733', 'Name': 'Padua', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DPC'] = { 'Color': '#FF5733', 'Name': 'Darliput', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        data['GPJ'] = { 'Color': '#F4D03F', 'Name': 'Gorapur', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['ARK'] = { 'Color': '#F4D03F', 'Name': 'Araku', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SMLG'] = { 'Color': '#FF5733', 'Name': 'Simliguda', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KVLS'] = { 'Color': '#F4D03F', 'Name': 'Karakavalasa', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BGHU'] = { 'Color': '#F4D03F', 'Name': 'BORRAGUHALU', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['CMDP'] = { 'Color': '#FF5733', 'Name': 'Chimidipalli', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TXD'] = { 'Color': '#FF5733', 'Name': 'Tyada', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SLPM'] = { 'Color': '#FF5733', 'Name': 'Shivalingapuram', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BDVR'] = { 'Color': '#F4D03F', 'Name': 'Boddavara', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SUP'] = { 'Color': '#F4D03F', 'Name': 'Shrungavarapukota', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LKV'] = { 'Color': '#F4D03F', 'Name': 'LakkavarapuKota', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['MVW'] = { 'Color': '#F4D03F', 'Name': 'Mallividu', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        //Blue Line
        data['DMRT'] = { 'Color': '#F4D03F', 'Name': 'Dummuriput', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DMNJ'] = { 'Color': '#FF5733', 'Name': 'Damanjodi', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BGUA'] = { 'Color': '#F4D03F', 'Name': 'Baiguda', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KKGM'] = { 'Color': '#FF5733', 'Name': 'Kakrigumma', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LKMR'] = { 'Color': '#FF5733', 'Name': 'LAKSHMIPUR ROAD', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SGRM'] = { 'Color': '#FF5733', 'Name': 'Singaramba', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TKRI'] = { 'Color': '#FF5733', 'Name': 'TIKIRI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['RUL'] = { 'Color': '#FF5733', 'Name': 'RAULI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LLGM'] = { 'Color': '#FF5733', 'Name': 'LELIGUMMA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BLMK'] = { 'Color': '#FF5733', 'Name': 'BHALUMASKA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SKPI'] = { 'Color': '#FF5733', 'Name': 'SIKRIPAI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KTGA'] = { 'Color': '#FF5733', 'Name': 'KEUTIGUDA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        data['SPRD'] = { 'Color': '#F4D03F', 'Name': 'SINGAPUR ROAD JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['RGDA'] = { 'Color': '#FF5733', 'Name': 'RAYAGADA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LDX'] = { 'Color': '#F4D03F', 'Name': 'LADDA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['JMPT'] = { 'Color': '#FF5733', 'Name': 'JIMIDIPETA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KNRT'] = { 'Color': '#FF5733', 'Name': 'KUNERU', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GMDA'] = { 'Color': '#FF5733', 'Name': 'GUMADA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PVPT'] = { 'Color': '#FF5733', 'Name': 'PARVATIPURAM TOWN', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PVP'] = { 'Color': '#FF5733', 'Name': 'PARVATIPURAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NSX'] = { 'Color': '#FF5733', 'Name': 'NARASIPURAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SNM'] = { 'Color': '#FF5733', 'Name': 'SITANAGARAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['VBL'] = { 'Color': '#FF5733', 'Name': 'BOBBILI JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DNV'] = { 'Color': '#FF5733', 'Name': 'DONKINAVALASA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KMX'] = { 'Color': '#FF5733', 'Name': 'KOMATIPALLI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GPI'] = { 'Color': '#FF5733', 'Name': 'GAJAPATINAGARAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GRBL'] = { 'Color': '#FF5733', 'Name': 'GARUDABALI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GTLM'] = { 'Color': '#FF5733', 'Name': 'GOTLAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        data['SALR'] = { 'Color': '#FF5733', 'Name': 'SALUR (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PRVA'] = { 'Color': '#FF5733', 'Name': 'PARANNAVALASA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['RML'] = { 'Color': '#FF5733', 'Name': 'ROMPALLI (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NGJ'] = { 'Color': '#FF5733', 'Name': 'NARAYANAPPAVALASA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        data['GNPR'] = { 'Color': '#FF5733', 'Name': 'GUNPUR', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PLSG'] = { 'Color': '#FF5733', 'Name': 'PALASINGHI (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BSDR'] = { 'Color': '#FF5733', 'Name': 'BANSADHARA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['LRI'] = { 'Color': '#FF5733', 'Name': 'LIHURI (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KNGR'] = { 'Color': '#FF5733', 'Name': 'KASHINAGAR (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['HBF'] = { 'Color': '#FF5733', 'Name': 'HADDUBHANGI (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SPRM'] = { 'Color': '#FF5733', 'Name': 'SITAPURAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PLH'] = { 'Color': '#FF5733', 'Name': 'PARLAKHEMUNDI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PHM'] = { 'Color': '#FF5733', 'Name': 'PATHAPATNAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GVA'] = { 'Color': '#FF5733', 'Name': 'GANGUVADA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TMB'] = { 'Color': '#FF5733', 'Name': 'TEMBURU (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PDSN'] = { 'Color': '#FF5733', 'Name': 'PEDDASANA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TEK'] = { 'Color': '#FF5733', 'Name': 'TEKKALI (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        data['PUN'] = { 'Color': '#FF5733', 'Name': 'PUNDI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['RMZ'] = { 'Color': '#FF5733', 'Name': 'ROUTHPURAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NWP'] = { 'Color': '#FF5733', 'Name': 'NAUPADA JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DGB'] = { 'Color': '#FF5733', 'Name': 'DONDUGOPALAPURAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KBM'] = { 'Color': '#FF5733', 'Name': 'KOTABOMMALI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['HCM'] = { 'Color': '#FF5733', 'Name': 'HARISCHANDRAPURAM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['TIU'] = { 'Color': '#FF5733', 'Name': 'TILARU', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['ULM'] = { 'Color': '#FF5733', 'Name': 'URLAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['CHE'] = { 'Color': '#FF5733', 'Name': 'SRIKAKULAM ROAD', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DSI'] = { 'Color': '#FF5733', 'Name': 'DUSI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PDU'] = { 'Color': '#FF5733', 'Name': 'PONDURU', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SGDM'] = { 'Color': '#FF5733', 'Name': 'SIGADAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['BTVA'] = { 'Color': '#FF5733', 'Name': 'BATUVA (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['CPP'] = { 'Color': '#FF5733', 'Name': 'CHIPURUPALLI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['GVI'] = { 'Color': '#FF5733', 'Name': 'GARIVIDI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['NML'] = { 'Color': '#FF5733', 'Name': 'NELLIMARALA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['VZM'] = { 'Color': '#FF5733', 'Name': 'VIZIANAGARAM JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KUK'] = { 'Color': '#FF5733', 'Name': 'KORUKONDA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['ALM'] = { 'Color': '#FF5733', 'Name': 'ALAMANDA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KPL'] = { 'Color': '#FF5733', 'Name': 'KANTAKAPALLI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['KTV'] = { 'Color': '#FF5733', 'Name': 'KOTTAVALASA JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['PDT'] = { 'Color': '#FF5733', 'Name': 'PENDURTI', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SCMN'] = { 'Color': '#FF5733', 'Name': 'SIMHACHALAM NORTH(Optg halt)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['SCM'] = { 'Color': '#FF5733', 'Name': 'SIMHACHALAM', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['MIPM'] = { 'Color': '#FF5733', 'Name': 'MARRIPALEM (PH)', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['VSKP'] = { 'Color': '#FF5733', 'Name': 'VISAKHAPATNAM JN.', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['DVD'] = { 'Color': '#FF5733', 'Name': 'DUVVADA', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };



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
        </div>
        <div id="imageDiv" class="w3-container" style="margin-left: 15%; margin-top: 5%">
            <img id="mainImg" src="Image\WaltairMap - Copy.jpg" usemap="#image-map" alt="waltair rail map" />
            <%--<map name="image-map">
                <area target="_blank" alt="SkyBlue" title="SkyBlue" href="CyanLine.aspx" coords="226,733,276,911,314,969,387,1028,568,1025,796,990,945,946,1062,876,1223,774,1354,786,1430,812,1433,663,1412,432,1284,312,1284,315,1167,193,1027,47,323,108,209,339" shape="poly" />
                <area target="_blank" alt="Pink" title="Pink" href="PinkLine.aspx" coords="1459,607,1448,812,1202,888,1144,955,919,1285,1091,1694,1328,1626,1453,1562,1640,1664,1743,1612,1836,1524,1807,1162,1564,1060,1570,984,1538,736" shape="poly" />
                <area target="_blank" alt="Blue" title="Blue" href="BlueLine.aspx" coords="1579,243,1588,540,1591,940,1702,923,1728,961,1757,1042,1839,1104,1906,1113,1985,1133,2249,1098,2269,996,2313,836,2243,684,2199,590,2292,476,2374,485,2433,395,2503,333,2482,199,2029,141,1740,120,1619,192,1576,240" shape="poly" />
                <area target="_blank" alt="Red" title="Red" href="RedLine.aspx" coords="1567,1743,1699,1667,1956,1442,2143,2237,1231,2242,1100,1921,1199,1761,1380,1702" shape="poly" />
                <area target="_blank" alt="Green" title="Green" href="GreenLine.aspx" coords="2368,499,2826,251,3203,529,3171,1040,3043,1518,2099,1997,1909,1177,2312,1078,2330,634,2283,543" shape="poly" />
            </map>--%>
            <%--<map name="image-map" class="activeMap">
                <!-- Cyan Line -->
                <area target="_blank" id="NMDCKirandul" title="NMDCKirandul" coords="361,926,15" shape="circle">
                <area target="_blank" id="Bacheli" title="Bacheli" coords="352,859,15" shape="circle">
                <area target="_blank" id="Bhansi" title="Bhansi" coords="343,803,15" shape="circle">
                <area target="_blank" id="Kamalur" title="Kamalur" coords="352,745,15" shape="circle">
                <area target="_blank" id="Dantewara" title="Dantewara" coords="378,704,15" shape="circle">
                <area target="_blank" id="Gidam" title="Gidam" coords="428,701,15" shape="circle">
                <area target="_blank" id="Dabpal" title="Dabpal" coords="492,727,15" shape="circle">
                <area target="_blank" id="Kawaragaon" title="Kawaragaon" coords="557,745,15" shape="circle">
                <area target="_blank" id="Kaklur" title="Kaklur" coords="624,753,15" shape="circle">
                <area target="_blank" id="Kumarsodra" title="Kumarsodra" coords="682,727,15" shape="circle">
                <area target="_blank" id="Silakjhori" title="Silakjhori" coords="682,642,15" shape="circle">
                <area target="_blank" id="Dilimili" title="Dilimili" coords="749,698,15" shape="circle">
                <area target="_blank" id="Bodearapur" title="Bodearapur" coords="814,666,15" shape="circle">
                <area target="_blank" id="Tokopal" title="Tokopal" coords="869,628,15" shape="circle">
                <area target="_blank" id="KumharMarenga" title="KumharMarenga" coords="922,602,15" shape="circle">
                <area target="_blank" id="Jagdalpur" title="Jagdalpur" coords="974,578,15" shape="circle">
                <area target="_blank" id="Naktisemra" title="Naktisemra" coords="1036,572,15" shape="circle">
                <area target="_blank" id="Amagura" title="Amagura" coords="1091,590,15" shape="circle">
                <area target="_blank" id="Ambagaon" title="Ambagaon" coords="1155,607,15" shape="circle">
                <area target="_blank" id="KotparRoad" title="KotparRoad" coords="1193,610,15" shape="circle">
                <area target="_blank" id="Charamulakusimi" title="Charamulakusimi" coords="1226,622,15" shape="circle">
                <area target="_blank" id="Khodapa" title="Khodapa" coords="1269,645,15" shape="circle">
                <area target="_blank" id="Danapur" title="Danapur" coords="1334,715,15" shape="circle">
                <area target="_blank" id="Jeypore" title="Jeypore" coords="1395,791,15" shape="circle">
                <area target="_blank" id="Chhatariput" title="Chhatariput" coords="1424,750,15" shape="circle">

                <!-- Pink Line -->
                <area target="_blank" id="Malligura" title="Malligura" coords="1462,695,15" shape="circle">
                <area target="_blank" id="Jarati" title="Jarati" coords="1491,745,15" shape="circle">
                <area target="_blank" id="Manabar" title="Manabar" coords="1532,826,15" shape="circle">
                <area target="_blank" id="Koraput" title="Koraput" coords="1532,914,15" shape="circle">
                <area target="_blank" id="Suku" title="Suku" coords="1515,955,15" shape="circle">
                <area target="_blank" id="Paliba" title="Paliba" coords="1483,990,15" shape="circle">
                <area target="_blank" id="Machukonda" title="Machukonda Road" coords="1445,1028,15" shape="circle">
                <area target="_blank" id="Bheja" title="Bheja" coords="1436,1086,15" shape="circle">
                <area target="_blank" id="Padua" title="Padua" coords="1450,1156,15" shape="circle">
                <area target="_blank" id="Darliput" title="Darliput" coords="1471,1224,15" shape="circle">
                <area target="_blank" id="Gorapur" title="Gorapur" coords="1585,1191,15" shape="circle">
                <area target="_blank" id="Araku" title="Araku" coords="1620,1209,15" shape="circle">
                <area target="_blank" id="Simliguda" title="Simliguda" coords="1661,1235,15" shape="circle">
                <area target="_blank" id="Karakavalasa" title="Karakavalasa" coords="1710,1270,15" shape="circle">
                <area target="_blank" id="Chimidipalli" title="Chimidipalli" coords="1786,1279,15" shape="circle">
                <area target="_blank" id="Tyada" title="Tyada" coords="1784,1323,15" shape="circle">
                <area target="_blank" id="Shivalingapuram" title="Shivalingapuram" coords="1784,1372,15" shape="circle">
                <area target="_blank" id="Boddavara" title="Boddavara" coords="1778,1422,15" shape="circle">
                <area target="_blank" id="Shrungavarapukota" title="Shrungavarapukota" coords="1804,1466,15" shape="circle">
                <area target="_blank" id="LakkavarapuKota" title="LakkavarapuKota" coords="1804,1501,15" shape="circle">
                <area target="_blank" id="Mallividu" title="Mallividu" coords="1807,1548,15" shape="circle">
            </map>--%>
        </div>
    </form>
</body>
</html>
