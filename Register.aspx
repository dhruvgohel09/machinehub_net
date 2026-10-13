<%@ Page Title="Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="machinehub.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Account - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
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
                <h1>Create Account</h1>
                <p class="subtitle">Join MachineHub to manage equipment and active rentals.</p>

                <!-- ERROR MESSAGE -->
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                    <asp:Label ID="lblError" runat="server" />
                </asp:Panel>

                <!-- SUCCESS MESSAGE -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                    <asp:Label ID="lblSuccess" runat="server" />
                </asp:Panel>

                <div class="mh-form-group">
                    <label>FULL NAME</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtFullName" runat="server" placeholder="Gohel Dhruv" />
                    </div>
                </div>

                <div class="mh-form-group">
                    <label>EMAIL ADDRESS</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="dhruv@example.com" />
                    </div>
                </div>

                <div class="mh-form-group">
                    <label>PHONE NUMBER</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="+91 98765 43210" />
                    </div>
                </div>

                <div class="mh-form-group">
                    <label>PASSWORD</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••" />
                    </div>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-auth orange" OnClick="btnRegister_Click" />

                <div class="mh-auth-footer">
                    Already have an account? <a href="Login.aspx">Log in</a>
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
                <div class="copyright">© 2026 MachineHub. All rights reserved.</div>
            </div>
        </footer>

    </form>
</body>
</html>