<%@ Page Title="Verify OTP" Language="C#" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="machinehub.VerifyOTP" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Verify Your Identity - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
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
                    <strong>op**@machinehub.com</strong>
                </p>

                <label class="mh-otp-label">Secure Code</label>

                <!-- 6 OTP Boxes -->
                <div class="mh-otp-boxes">
                    <input type="text" maxlength="1" class="mh-otp-box" />
                    <input type="text" maxlength="1" class="mh-otp-box" />
                    <input type="text" maxlength="1" class="mh-otp-box" />
                    <span class="mh-otp-dash">–</span>
                    <input type="text" maxlength="1" class="mh-otp-box" />
                    <input type="text" maxlength="1" class="mh-otp-box" />
                    <input type="text" maxlength="1" class="mh-otp-box" />
                </div>

                <!-- Info box -->
                <div class="mh-otp-info">
                    Ensure you are in a secure environment before entering your credentials. This code will expire in 04:59.
                </div>

                <!-- Authenticate button -->
                <button type="button" class="btn-auth orange">Authenticate</button>

                <!-- Resend -->
                <div class="mh-otp-resend">
                    Didn't receive the code? <a href="#">Resend OTP</a>
                </div>

                <!-- Back to Login -->
                <div class="mh-otp-back">
                    <a href="Login.aspx">Return to Login</a>
                </div>
            </div>
        </div>

    </form>
</body>
</html>