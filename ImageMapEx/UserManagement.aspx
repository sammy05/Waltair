<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="ImageMapEx.UserManagement" %>

<!DOCTYPE html>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
<script defer="defer" src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!--#include file="HTML/include.html" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <script>
        function AddUser() {
            var password = $('#txtPassword').val();
            var passwordRepeat = $('#txtPasswordRpt').val();
            if (password != passwordRepeat) {
                window.alert("password and confirm do not match");
                return;
            }

            var userName = $('#txtUsername').val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "UserManagement.aspx/AddUser",
                data: "{UserName:'" + userName + "', Password:'" + password + "'}",
                dataType: "json",
                success: function (response) {
                    data = JSON.parse(response.d);
                    if (data.Success) {
                        window.alert("User Successfully added, redirecting to login page");
                        window.location.href = "Login.aspx";
                    }
                    else
                        window.alert(data.Error);
                },
                error: function (error) {
                    window.alert(error);
                },
                statusCode: {
                    500: function () {
                        window.alert("Some error occured, please try again later");
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div class="mdl-card mdl-shadow--4dp" style="margin: 5em auto; vertical-align: middle; width: 40%">
        <div class="w3-container w3-green">
            <h2>Create User</h2>
        </div>
        <br />
        <form id="form" runat="server" class="w3-container">
            <label>Username</label>
            <input type="text" id="txtUsername" class="w3-input" />
            <br />
            <label>Password</label>
            <input type="password" id="txtPassword" class="w3-input" />
            <br />
            <label>Confirm Password</label>
            <input type="password" id="txtPasswordRpt" class="w3-input" />
            <br />
            <input type="button" id="btnlogin" onclick="AddUser()" value="Add User"
                class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored w3-block w3-text-large" />
            <br />
        </form>
    </div>
</body>
</html>
