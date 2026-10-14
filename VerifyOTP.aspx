<%@ Page Title="Verify OTP" Language="C#" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="machinehub.VerifyOTP" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Verify Your Identity - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-otp-body">
    <form id="form1" runat="server">

        <!-- DARK NAVY NAVBAR -->
        <div class="mh-auth-navbar">
            <div class="container">
                <a href="Default.aspx" class="mh-logo">Machine<span>Hub</span></a>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="mh-otp-main">

            <!-- Background shield graphic -->
            <div class="mh-otp-bg-shield"></div>

            <div class="mh-otp-card">
                <h1>Verify Your Identity</h1>
                <p class="mh-otp-subtitle">
                    For your security, we've sent a 6-digit authentication code to<br />
                    <strong><asp:Label ID="lblEmail" runat="server" Text="your email" /></strong>
                </p>

                <!-- ERROR / INFO MESSAGE -->
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                    <asp:Label ID="lblError" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                    <asp:Label ID="lblSuccess" runat="server" />
                </asp:Panel>

                <label class="mh-otp-label">Secure Code</label>

                <!-- 6 OTP Boxes -->
                <div class="mh-otp-boxes">
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp1" autofocus />
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp2" />
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp3" />
                    <span class="mh-otp-dash">–</span>
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp4" />
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp5" />
                    <input type="text" maxlength="1" class="mh-otp-box" id="otp6" />
                </div>

                <asp:HiddenField ID="hfOtp" runat="server" />

                <!-- Info box -->
                <div class="mh-otp-info">
                    Ensure you are in a secure environment before entering your credentials. Demo OTP is <strong>123456</strong> (or enter any 6 digits).
                </div>

                <!-- Authenticate button -->
                <asp:Button ID="btnVerify" runat="server" Text="Authenticate"
                    CssClass="btn-auth orange"
                    OnClick="btnVerify_Click"
                    OnClientClick="return collectOtp();" />

                <!-- Resend -->
                <div class="mh-otp-resend">
                    Didn't receive the code? <asp:LinkButton ID="btnResend" runat="server" OnClick="btnResend_Click">Resend OTP</asp:LinkButton>
                </div>

                <!-- Back to Login -->
                <div class="mh-otp-back">
                    <a href="Login.aspx">Return to Login</a>
                </div>
            </div>

            <script type="text/javascript">
                function collectOtp() {
                    var boxes = document.querySelectorAll('.mh-otp-box');
                    var otp = '';
                    boxes.forEach(function (b) { otp += b.value.trim(); });
                    document.getElementById('<%= hfOtp.ClientID %>').value = otp;
                    return true;
                }

                document.addEventListener('DOMContentLoaded', function () {
                    var boxes = document.querySelectorAll('.mh-otp-box');
                    boxes.forEach(function (box, idx) {
                        box.addEventListener('input', function () {
                            if (this.value.length === 1 && idx < boxes.length - 1) {
                                boxes[idx + 1].focus();
                            }
                        });
                        box.addEventListener('keydown', function (e) {
                            if (e.key === 'Backspace' && this.value === '' && idx > 0) {
                                boxes[idx - 1].focus();
                            }
                        });
                        box.addEventListener('paste', function (e) {
                            var paste = (e.clipboardData || window.clipboardData).getData('text');
                            if (paste && paste.length >= 6) {
                                for (var i = 0; i < boxes.length; i++) {
                                    boxes[i].value = paste[i] || '';
                                }
                                boxes[boxes.length - 1].focus();
                                e.preventDefault();
                            }
                        });
                    });
                });
            </script>
        </div>

    </form>
</body>
</html>