<%@ Page Title="Personal Info" Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="machinehub.Settings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account Settings - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-settings-body">
    <form id="form1" runat="server">

        <!-- DARK NAVBAR -->
        <nav class="mh-navbar-dark">
            <div class="container">
                <a href="Default.aspx" class="mh-logo-light">Machine<span>Hub</span></a>
                <ul class="mh-menu-light">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Machines.aspx">Equipment</a></li>
                    <li><a href="Categories.aspx">Categories</a></li>
                    <li><a href="MyBookings.aspx">My Bookings</a></li>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
                <div class="mh-actions-light">
                    <a href="Settings.aspx" class="mh-user-avatar-btn">Account</a>
                </div>
            </div>
        </nav>

        <!-- SETTINGS MAIN -->
        <section class="mh-settings-section">
            <div class="container">
                <div class="mh-settings-layout">

                    <!-- SIDEBAR -->
                    <aside class="mh-settings-sidebar">
                        <h2>Settings</h2>
                        <ul class="mh-settings-nav">
                            <li><a href="Settings.aspx" class="active">Personal Info</a></li>
                            <li><a href="#">Security</a></li>
                            <li><a href="#">Preferences</a></li>
                        </ul>
                        <hr class="mh-sidebar-divider" />
                        <a href="Default.aspx?logout=1" class="mh-logout-link">Logout</a>
                    </aside>

                    <!-- MAIN SETTINGS CARD -->
                    <main class="mh-settings-card">
                        <div class="mh-settings-card-head">
                            <div>
                                <h1>Personal Info</h1>
                                <p>Update your personal details and contact information.</p>
                            </div>
                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn-save-orange" OnClick="btnSave_Click" />
                        </div>

                        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success" style="margin-top: 20px;">
                            <asp:Label ID="lblSuccess" runat="server" />
                        </asp:Panel>

                        <hr class="mh-card-divider" />

                        <!-- AVATAR PROFILE -->
                        <div class="mh-user-profile-row">
                            <div class="mh-profile-meta">
                                <h3><asp:Label ID="lblUserDisplayName" runat="server" Text="Dhruv Gohel" /></h3>
                                <p><asp:Label ID="lblUserPhone" runat="server" Text="+91 88546 59695" /></p>
                            </div>
                        </div>

                        <hr class="mh-card-divider" />

                        <!-- FORM FIELDS -->
                        <div class="mh-settings-form-grid">
                            <div class="mh-set-field">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server" Text="Gohel Dhruv" />
                            </div>

                            <div class="mh-set-field">
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Text="machinehub@export.com" />
                            </div>

                            <div class="mh-set-field">
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Text="+91 55659 39849" />
                            </div>

                            <div class="mh-set-field">
                                <label>Company Name</label>
                                <asp:TextBox ID="txtCompany" runat="server" Text="Machinehub Construction Ltd." />
                            </div>

                            <div class="mh-set-field full-width">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" Text="123 Industrial Way, Suite 400, Rajkot, 360004." />
                            </div>
                        </div>

                    </main>

                </div>
            </div>
        </section>

        <!-- FOOTER -->
        <footer class="mh-footer-settings">
            <div class="container">
                <div class="mh-footer-settings-grid">
                    <div>
                        <div class="brand">Machine<span>Hub</span></div>
                        <p>Industrial Strength Rental Management. Powering your projects with reliable equipment.</p>
                    </div>
                    <div>
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="Machines.aspx">Equipment Catalog</a></li>
                            <li><a href="Categories.aspx">Rental Categories</a></li>
                            <li><a href="Machines.aspx">Pricing</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4>Support</h4>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Safety Guidelines</a></li>
                            <li><a href="Contact.aspx">Report an Issue</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Cookie Policy</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mh-footer-settings-bottom">
                    © 2026 MachineHub. All rights reserved.
                </div>
            </div>
        </footer>

    </form>
</body>
</html>
