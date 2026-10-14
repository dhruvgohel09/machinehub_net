<%@ Page Title="Reset Password" Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="machinehub.ResetPassword" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reset Password - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-auth-body sunset-bg">
    <form id="form1" runat="server">

        <!-- DARK BLUE NAVBAR -->
        <div class="mh-auth-navbar">
            <div class="container">
                <a href="Default.aspx" class="mh-logo">Machine<span>Hub</span></a>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="mh-auth-main">
            <div class="mh-auth-card">
                <h1>Reset Password</h1>
                <p class="subtitle">Please enter your new password below.</p>

                <!-- ERROR MESSAGE -->
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                    <asp:Label ID="lblError" runat="server" />
                </asp:Panel>

                <!-- SUCCESS MESSAGE -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                    <asp:Label ID="lblSuccess" runat="server" />
                </asp:Panel>

                <div class="mh-form-group">
                    <label>NEW PASSWORD</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="••••••••" />
                    </div>
                </div>

                <div class="mh-form-group">
                    <label>CONFIRM PASSWORD</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="icon-refresh" placeholder="••••••••" />
                    </div>
                </div>

                <ul class="mh-pwd-rules">
                    <li>At least 8 characters</li>
                    <li>Contains a number</li>
                    <li>Contains a special character</li>
                </ul>

                <asp:Button ID="btnUpdate" runat="server" Text="Update Password" CssClass="btn-auth orange" OnClick="btnUpdate_Click" />

                <div class="mh-auth-footer">
                    <a href="Login.aspx">Back to Login</a>
                </div>
            </div>
        </div>

        <!-- DARK BLUE FOOTER -->
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