<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetImageCoords.aspx.cs" Inherits="ImageMapEx.GetImageCoords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<head runat="server">
    <title></title>
    <script>
        var data = [];

        //data.push('DMRT,DUMMURIPUT');
        //data.push('DMNJ,DAMANJODI');
        //data.push('BGUA,BAIGUDA ');
        //data.push('KKGM,KAKRIGUMMA');
        //data.push('LKMR,LAKSHMIPUR ROAD');
        //data.push('SGRM,SINGARAM');
        //data.push('TKRI,TIKIRI');
        //data.push('RUL,RAULI');
        //data.push('LLGM,LELIGUMMA');
        //data.push('BLMK,BHALUMASKA');
        //data.push('SKPI,SIKRIPAI');
        //data.push('KTGA,KEUTIGUDA');

        //data.push('SPRD,SINGAPUR ROAD JN.');
        //data.push('RGDA,RAYAGADA ');
        //data.push('LDX,LADDA');
        //data.push('JMPT,JIMIDIPETA');
        //data.push('KNRT,KUNERU ');
        //data.push('GMDA,GUMADA');
        //data.push('PVPT,PARVATIPURAM TOWN');
        //data.push('PVP,PARVATIPURAM ');
        //data.push('NSX,NARASIPURAM (PH)');
        //data.push('SNM,SITANAGARAM');
        //data.push('VBL,BOBBILI JN.');
        //data.push('DNV,DONKINAVALASA');
        //data.push('KMX,KOMATIPALLI');
        //data.push('GPI,GAJAPATINAGARAM');
        //data.push('GRBL,GARUDABALI');
        //data.push('GTLM,GOTLAM');

        //data.push('SALR,SALUR (PH)');
        //data.push('PRVA,PARANNAVALASA (PH)');
        //data.push('RML,ROMPALLI (PH)');
        //data.push('NGJ,NARAYANAPPAVALASA (PH)');

        //data.push('GNPR,GUNPUR');
        //data.push('PLSG,PALASINGHI (PH)');
        //data.push('BSDR,BANSADHARA (PH)');
        //data.push('LRI,LIHURI (PH)');
        //data.push('KNGR,KASHINAGAR (PH)');
        //data.push('HBF,HADDUBHANGI (PH)');
        //data.push('SPRM,SITAPURAM (PH)');
        //data.push('PLH,PARLAKHEMUNDI');
        //data.push('PHM,PATHAPATNAM (PH)');
        //data.push('GVA,GANGUVADA (PH)');
        //data.push('TMB,TEMBURU (PH)');
        //data.push('PDSN,PEDDASANA (PH)');
        //data.push('TEK,TEKKALI (PH)');

        //data.push('GPJ,GORAPUR');
        //data.push('ARK,ARAKU');
        //data.push('SMLG,SIMILIGUDA');
        //data.push('KVLS,KARAKAVALASA');
        //data.push('BGHU,BORRAGUHALU');
        //data.push('CMDP,CHIMIDIPALLI');
        //data.push('TXD,TYADA (Optg halt)');
        //data.push('SLPM,SHIVLINGAPURAM(Optg halt)');
        //data.push('BDVR,BODDAVARA');
        //data.push('SUP,SRUNGAVARAPUKOTA');
        //data.push('LKV,LAKKAVARAPU KOTA(Optg halt)');
        //data.push('MVW,MALLIVIDU');

        data.push('PUN,PUNDI');
        data.push('RMZ,ROUTHPURAM (PH)');
        data.push('NWP,NAUPADA JN.');
        data.push('DGB,DONDUGOPALAPURAM (PH)');
        data.push('KBM,KOTABOMMALI');
        data.push('HCM,HARISCHANDRAPURAM (PH)');
        data.push('TIU,TILARU');
        data.push('ULM,URLAM');
        data.push('CHE,SRIKAKULAM ROAD');
        data.push('DSI,DUSI');
        data.push('PDU,PONDURU');
        data.push('SGDM,SIGADAM');
        data.push('BTVA,BATUVA (PH)');
        data.push('CPP,CHIPURUPALLI');
        data.push('GVI,GARIVIDI');
        data.push('NML,NELLIMARALA');
        data.push('VZM,VIZIANAGARAM JN.');
        data.push('KUK,KORUKONDA');
        data.push('ALM,ALAMANDA');
        data.push('KPL,KANTAKAPALLI');
        data.push('KTV,KOTTAVALASA JN.');
        data.push('PDT,PENDURTI');
        data.push('SCMN,SIMHACHALAM NORTH(Optg halt)');
        data.push('SCM,SIMHACHALAM');
        data.push('MIPM,MARRIPALEM (PH)');
        data.push('VSKP,VISAKHAPATNAM JN.');
        data.push('DVD,DUVVADA');


        var i = 0;
        $(document).ready(function () {
            $('img').on("mousedown", function (e) {
                var name = data[i] + ",";
                var offset = $(this).offset();
                var X = Math.round((e.pageX - offset.left));
                var Y = Math.round((e.pageY - offset.top));
                console.log(name + X + '#' + Y + '#15');
                i++;
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="imageDiv" class="w3-container" style="margin-left: 10%; margin-top: 5%">
            <img id="mainImg" src="Image\WaltairMap.jpg" usemap="#image-map" alt="waltair rail map" />
        </div>
    </form>
</body>
</html>
