<%@ Page Title="Forgot Password" Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="machinehub.ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password - MachineHub</title>
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
                <h1>Forgot Password?</h1>
                <p class="subtitle">Enter your email address and we'll send you a code to reset your password.</p>

                <!-- ERROR MESSAGE -->
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                    <asp:Label ID="lblError" runat="server" />
                </asp:Panel>

                <!-- SUCCESS MESSAGE -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                    <asp:Label ID="lblSuccess" runat="server" />
                </asp:Panel>

                <!-- ================= EMAIL ================= -->
                <div class="mh-form-group">
                    <label>EMAIL ADDRESS</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="operator@example.com" />
                    </div>

                    <!-- ✅ .NET RequiredFieldValidator -->
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgForgot" />

                    <!-- ✅ .NET RegularExpressionValidator -->
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                        ErrorMessage="Enter valid email (example@mail.com)."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgForgot" />
                </div>

                <!-- ✅ Button with ValidationGroup -->
                <asp:Button ID="btnSendOTP" runat="server" Text="Send Reset Code"
                    CssClass="btn-auth orange"
                    OnClick="btnSendOTP_Click"
                    ValidationGroup="vgForgot" />

                <div class="mh-auth-footer">
                    Remember your password? <a href="Login.aspx">Back to Login</a>
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