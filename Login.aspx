<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="machinehub.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-auth-body">
    <form id="form1" runat="server">

        <!-- TOP NAVBAR -->
        <header class="mh-auth-navbar">
            <div class="container">
                <a href="Default.aspx" class="mh-logo">Machine<span>Hub</span></a>
            </div>
        </header>

        <!-- MAIN CONTENT -->
        <main class="mh-auth-main">
            <div class="mh-auth-card">
                <h1>Welcome Back</h1>
                <p class="subtitle">Enter your credentials to access your portal.</p>

                <!-- ERROR MESSAGE (server-side errors) -->
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

                    <!-- .NET RequiredFieldValidator -->
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgLogin" />

                    <!-- .NET RegularExpressionValidator -->
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                        ErrorMessage="Enter valid email (example@mail.com)."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgLogin" />
                </div>

                <!-- ================= PASSWORD ================= -->
                <div class="mh-form-group">
                    <label>
                        <span>PASSWORD</span>
                        <a href="ForgotPassword.aspx" class="forgot">Forgot Password?</a>
                    </label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••" />
                    </div>

                    <!--  .NET RequiredFieldValidator -->
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgLogin" />

                    <!-- .NET RegularExpressionValidator (disabled on login so any existing password format works) -->
                    <asp:RegularExpressionValidator ID="revPassword" runat="server"
                        ControlToValidate="txtPassword"
                        Enabled="false"
                        ValidationExpression="^.{1,100}$"
                        ErrorMessage="Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgLogin" />
                </div>

                <!-- .NET Button with ValidationGroup -->
                <asp:Button ID="btnLogin" runat="server" Text="Login"
                    CssClass="btn-auth orange"
                    OnClick="btnLogin_Click"
                    ValidationGroup="vgLogin" />

                <div class="mh-auth-footer">
                    Don't have an account? <a href="Register.aspx">Create account</a>
                </div>
            </div>

        </main>

        <!-- FOOTER -->
        <footer class="mh-auth-page-footer">
            <div class="container">
                <div class="brand">Machine<span>Hub</span></div>
                <div class="links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Support</a>
                    <a href="Contact.aspx">Contact Us</a>
                </div>

                <div class="copyright"> 2026 MachineHub. All rights reserved.</div>
            </div>
        </footer>

    </form>
</body>
</html>