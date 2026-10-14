<%@ Page Title="Password Updated" Language="C#" AutoEventWireup="true" CodeBehind="PasswordUpdated.aspx.cs" Inherits="machinehub.PasswordUpdated" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Password Updated - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-success-body">
    <form id="form1" runat="server">

        <!-- DARK NAVY NAVBAR -->
        <div class="mh-auth-navbar">
            <div class="container">
                <a href="Default.aspx" class="mh-logo">Machine<span>Hub</span></a>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="mh-success-main">
            <div class="mh-success-card">
                <h1>Password Updated</h1>
                <p class="subtitle">Your password has been changed successfully. You can now use your new password to log in to your account.</p>

                <a href="Login.aspx" class="mh-success-btn">Back to Login</a>

                <div class="mh-success-footer">
                    Need further assistance? <a href="#">Contact Support</a>
                </div>
            </div>
        </div>

        <!-- DARK NAVY FOOTER -->
        <div class="mh-auth-page-footer">
            <div class="container">
                <div class="brand">Machine<span>Hub</span></div>
                <div class="links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Support</a>
                    <a href="#">Contact Us</a>
                </div>
                <div class="copyright">© 2026 MachineHub. All rights reserved.</div>
            </div>
        </div>

    </form>
</body>
</html>