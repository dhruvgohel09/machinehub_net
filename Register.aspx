<%@ Page Title="Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="machinehub.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Account - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-auth-body day-bg">
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
                <div class="mh-auth-card-logo">Machine<span>Hub</span></div>
                <p class="subtitle">Create your account to start managing equipment.</p>

                <!-- ERROR MESSAGE -->
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                    <asp:Label ID="lblError" runat="server" />
                </asp:Panel>

                <!-- SUCCESS MESSAGE -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                    <asp:Label ID="lblSuccess" runat="server" />
                </asp:Panel>

                <!-- ================= FULL NAME ================= -->
                <div class="mh-form-group">
                    <label>FULL NAME</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="icon-user" placeholder="Gohel Dhruv" />
                    </div>

                    <!-- ✅ RequiredFieldValidator -->
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                        ControlToValidate="txtFullName"
                        ErrorMessage="Full name is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />

                    <!-- ✅ RegularExpressionValidator (Only letters + space, 3-50) -->
                    <asp:RegularExpressionValidator ID="revFullName" runat="server"
                        ControlToValidate="txtFullName"
                        ValidationExpression="^[a-zA-Z\s]{3,50}$"
                        ErrorMessage="Name must be 3-50 letters only."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />
                </div>

                <!-- ================= EMAIL ================= -->
                <div class="mh-form-group">
                    <label>EMAIL ADDRESS</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Dhruv@gmail.com" />
                    </div>

                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />

                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                        ErrorMessage="Enter valid email (example@mail.com)."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />
                </div>

                <!-- ================= PHONE ================= -->
                <div class="mh-form-group">
                    <label>PHONE NUMBER</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="icon-phone" placeholder="+91 0000-0000" MaxLength="15" />
                    </div>

                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                        ControlToValidate="txtPhone"
                        ErrorMessage="Phone number is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />

                    <asp:RegularExpressionValidator ID="revPhone" runat="server"
                        ControlToValidate="txtPhone"
                        ValidationExpression="^[\+\d\s\-\(\)]{10,15}$"
                        ErrorMessage="Enter valid phone number."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />
                </div>

                <!-- ================= PASSWORD ================= -->
                <div class="mh-form-group">
                    <label>PASSWORD</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••" />
                    </div>

                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />

                    <asp:RegularExpressionValidator ID="revPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^()_+\-=\[\]{}|;:,.<>/~]).{8,}$"
                        ErrorMessage="Password must be 8+ chars with 1 Upper, 1 Lower, 1 Digit, 1 Special."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />
                </div>

                <!-- ================= CONFIRM PASSWORD ================= -->
                <div class="mh-form-group">
                    <label>CONFIRM PASSWORD</label>
                    <div class="mh-input-wrap">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="••••••••" />
                    </div>

                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Confirm password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />

                    <!-- ✅ CompareValidator — Password match check -->
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Password and Confirm Password do not match."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgRegister" />
                </div>

                <!-- ✅ Button with ValidationGroup -->
                <asp:Button ID="btnRegister" runat="server" Text="Create Account"
                    CssClass="btn-auth navy"
                    OnClick="btnRegister_Click"
                    ValidationGroup="vgRegister" />

                <div class="mh-auth-footer">
                    Already have an account? <a href="Login.aspx" class="navy-link">Log in</a>
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