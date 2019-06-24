<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ImageMapEx.Login" %>

<!DOCTYPE html>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />--%>
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
<%--<script defer="defer" src="https://code.getmdl.io/1.3.0/material.min.js"></script>--%>
<!--#include file="HTML/include.html" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="shortcut icon" href="\Image\IndianRailLogo.ico" />
    <script>
        function btnlogin_Click() {
            var userName = $('#txtUsername').val();
            var password = $('#txtPassword').val();

            // window.alert("UserName:" + userName + ", Password:" + password);

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Login.aspx/LoginUser",
                data: "{UserName:'" + userName + "', Password:'" + password + "'}",
                dataType: "json",
                success: function (response) {
                    data = JSON.parse(response.d);
                    if (data.Success)
                        window.location.href = "Main.aspx";
                    else
                        window.alert(data.Error);
                },
                error: function (error) {
                    window.alert(error);
                },
                statusCode: {
                    500: function () {

                    }
                }
            });
        }
    </script>
    <style>
       
    </style>
</head>
<%--<body style="background-image: url(/Image/TrainBlueLong.png); background-repeat:repeat; background-size:250px">--%>
<body>
    <div class="w3-responsive w3-row-padding w3-container w3-card-4" id="loginDiv">
        <div class="w3-row w3-third" style="margin: 1em">
            <div class="w3-col">
                <img src="/Image/IndianRailLogoRed.png" id="logoImg" style="">
                <h1 id="nameTag" class="w3-text-large" style="font:verdana"><b>South Coast Railway</b></h1>
            </div>
        </div>
        <div class="w3-row w3-card-4 w3-rest" style="margin: 1em; height: 350px;">
            <div class="w3-container w3-green">
                <%--<h2>Waltair(SCoR) and Rayagada(ECoR) Divisions</h2>--%>
                <h2>Waltair Division (SCoR and ECoR Jurisdictions)</h2>
            </div>
            <br />
            <form id="form" runat="server" class="w3-container">
                <label id="lblUsername" class="w3-section">Username</label>
                <input type="text" id="txtUsername" class="w3-input">
                <br />
                <label id="lblPassword">Password</label>
                <input type="password" id="txtPassword" class="w3-input">
                <br />
                <input type="button" id="btnlogin" onclick="btnlogin_Click()" value="Login"
                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored w3-block w3-text-large w3-hover-green" />
                <br />
                <%--<button class="w3-button w3-hover-blue w3-round pull-right" formaction="UserManagement.aspx">Create User</button>
            <br />--%>
            </form>
        </div>
    </div>
</body>
</html>
