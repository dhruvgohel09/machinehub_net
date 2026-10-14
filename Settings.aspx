<%@ Page Title="Account Settings" Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="machinehub.Settings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account Settings - MachineHub</title>
    <meta name="description" content="Manage your MachineHub account settings, security, and preferences." />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
    <style>
        /* ── Tab Panel System ── */
        .mh-tab-panel { display: none; }
        .mh-tab-panel.active { display: block; }

        /* ── Security Section Styles ── */
        .mh-security-section { margin-bottom: 32px; }
        .mh-security-section-title {
            font-size: 16px; font-weight: 700; color: var(--navy);
            margin: 0 0 6px; display: flex; align-items: center; gap: 8px;
        }
        .mh-security-section-desc { font-size: 13px; color: var(--gray-text); margin: 0 0 20px; }

        .mh-password-strength { margin-top: 8px; }
        .mh-strength-bar-wrap { display: flex; gap: 4px; margin-bottom: 4px; }
        .mh-strength-seg {
            flex: 1; height: 4px; border-radius: 4px;
            background: #E2E8F0; transition: background 0.3s;
        }
        .mh-strength-seg.weak   { background: #EF4444; }
        .mh-strength-seg.fair   { background: #F59E0B; }
        .mh-strength-seg.good   { background: #3B82F6; }
        .mh-strength-seg.strong { background: #22C55E; }
        .mh-strength-label { font-size: 12px; font-weight: 600; color: var(--gray-text); }

        .mh-2fa-row {
            display: flex; justify-content: space-between; align-items: center;
            background: #F8FAFC; border: 1px solid var(--border); border-radius: 12px;
            padding: 18px 20px; margin-bottom: 12px;
        }
        .mh-2fa-info h4 { font-size: 15px; font-weight: 700; color: var(--navy); margin: 0 0 4px; }
        .mh-2fa-info p  { font-size: 13px; color: var(--gray-text); margin: 0; }

        /* Toggle switch */
        .mh-toggle { position: relative; display: inline-block; width: 46px; height: 24px; flex-shrink: 0; }
        .mh-toggle input { opacity: 0; width: 0; height: 0; }
        .mh-toggle-slider {
            position: absolute; inset: 0; background: #CBD5E1; border-radius: 24px;
            cursor: pointer; transition: background 0.2s;
        }
        .mh-toggle-slider:before {
            content: ''; position: absolute; width: 18px; height: 18px;
            border-radius: 50%; background: #fff; left: 3px; top: 3px;
            transition: transform 0.2s; box-shadow: 0 1px 4px rgba(0,0,0,0.15);
        }
        .mh-toggle input:checked + .mh-toggle-slider { background: #22C55E; }
        .mh-toggle input:checked + .mh-toggle-slider:before { transform: translateX(22px); }

        .mh-session-row {
            display: flex; justify-content: space-between; align-items: center;
            padding: 14px 0; border-bottom: 1px solid #F1F5F9;
        }
        .mh-session-row:last-child { border-bottom: none; }
        .mh-session-device { display: flex; align-items: center; gap: 12px; }
        .mh-session-icon {
            width: 40px; height: 40px; border-radius: 10px;
            background: #EFF6FF; display: flex; align-items: center; justify-content: center;
            font-size: 18px;
        }
        .mh-session-device-name { font-size: 14px; font-weight: 600; color: var(--navy); margin: 0 0 2px; }
        .mh-session-device-info { font-size: 12px; color: var(--gray-text); }
        .mh-session-current {
            background: #DCFCE7; color: #166534; font-size: 11px; font-weight: 700;
            padding: 3px 8px; border-radius: 20px;
        }
        .btn-revoke {
            font-size: 12px; font-weight: 600; color: #EF4444;
            border: 1px solid #FECACA; background: #FEF2F2;
            padding: 6px 14px; border-radius: 6px; cursor: pointer;
            transition: background 0.2s; font-family: inherit;
        }
        .btn-revoke:hover { background: #FEE2E2; }

        /* ── Preferences Styles ── */
        .mh-pref-group { margin-bottom: 28px; }
        .mh-pref-group-title {
            font-size: 13px; font-weight: 700; color: var(--gray-text);
            text-transform: uppercase; letter-spacing: 0.8px; margin: 0 0 14px;
        }
        .mh-pref-row {
            display: flex; justify-content: space-between; align-items: center;
            padding: 16px 0; border-bottom: 1px solid #F1F5F9;
        }
        .mh-pref-row:last-child { border-bottom: none; }
        .mh-pref-info h4 { font-size: 14px; font-weight: 600; color: var(--navy); margin: 0 0 3px; }
        .mh-pref-info p  { font-size: 13px; color: var(--gray-text); margin: 0; }

        .mh-pref-select {
            padding: 8px 12px; border: 1px solid var(--border); border-radius: 8px;
            font-size: 13px; font-family: inherit; color: var(--dark-text);
            outline: none; cursor: pointer; background: #fff;
            transition: border-color 0.2s;
        }
        .mh-pref-select:focus { border-color: var(--orange); }

        .mh-theme-options { display: flex; gap: 10px; }
        .mh-theme-btn {
            padding: 8px 16px; border-radius: 8px; border: 2px solid var(--border);
            font-size: 13px; font-weight: 600; cursor: pointer; background: #fff;
            color: var(--gray-text); transition: all 0.2s; font-family: inherit;
        }
        .mh-theme-btn.sel, .mh-theme-btn:hover {
            border-color: var(--orange); color: var(--orange); background: #FFF7ED;
        }

        .mh-danger-zone {
            background: #FEF2F2; border: 1px solid #FECACA;
            border-radius: 12px; padding: 20px 24px;
        }
        .mh-danger-zone h4 { font-size: 15px; font-weight: 700; color: #991B1B; margin: 0 0 6px; }
        .mh-danger-zone p  { font-size: 13px; color: #B91C1C; margin: 0 0 16px; }
        .btn-danger {
            background: #EF4444; color: #fff; border: none;
            padding: 10px 20px; border-radius: 8px; font-size: 13px; font-weight: 700;
            cursor: pointer; font-family: inherit; transition: background 0.2s;
        }
        .btn-danger:hover { background: #DC2626; }

        /* ── Save Button inside Security / Prefs ── */
        .mh-panel-save-row {
            display: flex; justify-content: flex-end; padding-top: 24px;
            border-top: 1px solid var(--border); margin-top: 8px;
        }
    </style>
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
                    <a href="Settings.aspx" class="mh-user-avatar-btn">⚙ Account</a>
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
                            <li><a href="#" id="tab-personal-link" class="mh-tab-link active" data-tab="tab-personal">Personal Info</a></li>
                            <li><a href="#" id="tab-security-link" class="mh-tab-link"        data-tab="tab-security">Security</a></li>
                            <li><a href="#" id="tab-prefs-link"    class="mh-tab-link"        data-tab="tab-prefs">Preferences</a></li>
                        </ul>
                        <hr class="mh-sidebar-divider" />
                        <a href="Default.aspx?logout=1" class="mh-logout-link">Logout</a>
                    </aside>

                    <!-- MAIN PANEL (all three tabs share this card) -->
                    <main class="mh-settings-card">

                        <!-- ============================================================
                             TAB 1 — PERSONAL INFO
                             ============================================================ -->
                        <div id="tab-personal" class="mh-tab-panel active">
                            <div class="mh-settings-card-head">
                                <div>
                                    <h1>Personal Info</h1>
                                    <p>Update your personal details and contact information.</p>
                                </div>
                                <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                                    CssClass="btn-save-orange" OnClick="btnSave_Click" />
                            </div>

                            <asp:Panel ID="pnlSuccess" runat="server" Visible="false"
                                CssClass="mh-alert-success" style="margin-bottom:20px;">
                                <asp:Label ID="lblSuccess" runat="server" />
                            </asp:Panel>

                            <hr class="mh-card-divider" />

                            <!-- Avatar / Profile row -->
                            <div class="mh-user-profile-row">
                                <div class="mh-profile-avatar-circle" id="avatarCircle"
                                     style="width:64px;height:64px;border-radius:50%;background:linear-gradient(135deg,#F97316,#0F172A);
                                            display:flex;align-items:center;justify-content:center;
                                            font-size:24px;font-weight:800;color:#fff;flex-shrink:0;">
                                    DG
                                </div>
                                <div class="mh-profile-meta">
                                    <h3><asp:Label ID="lblUserDisplayName" runat="server" Text="Dhruv Gohel" /></h3>
                                    <p><asp:Label ID="lblUserPhone" runat="server" Text="+91 88546 59695" /></p>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Form Fields -->
                            <div class="mh-settings-form-grid">
                                <div class="mh-set-field">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter full name" />
                                </div>
                                <div class="mh-set-field">
                                    <label>Email Address</label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="email@example.com" />
                                </div>
                                <div class="mh-set-field">
                                    <label>Phone Number</label>
                                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="+91 XXXXX XXXXX" />
                                </div>
                                <div class="mh-set-field">
                                    <label>Company Name</label>
                                    <asp:TextBox ID="txtCompany" runat="server" Text="Machinehub Construction Ltd." />
                                </div>
                                <div class="mh-set-field full-width">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server"
                                        Text="123 Industrial Way, Suite 400, Rajkot, 360004." />
                                </div>
                            </div>
                        </div>

                        <!-- ============================================================
                             TAB 2 — SECURITY
                             ============================================================ -->
                        <div id="tab-security" class="mh-tab-panel">
                            <div class="mh-settings-card-head">
                                <div>
                                    <h1>Security</h1>
                                    <p>Manage your password, two-factor authentication, and active sessions.</p>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Change Password -->
                            <div class="mh-security-section">
                                <p class="mh-security-section-title">🔑 Change Password</p>
                                <p class="mh-security-section-desc">Choose a strong password that you don't use anywhere else.</p>

                                <div class="mh-settings-form-grid">
                                    <div class="mh-set-field full-width">
                                        <label>Current Password</label>
                                        <asp:TextBox ID="txtCurrentPwd" runat="server" TextMode="Password"
                                            placeholder="Enter current password" />
                                    </div>
                                    <div class="mh-set-field">
                                        <label>New Password</label>
                                        <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"
                                            placeholder="Min. 8 characters" ClientIDMode="Static" />
                                        <!-- Strength meter -->
                                        <div class="mh-password-strength" id="strengthWrap" style="display:none;">
                                            <div class="mh-strength-bar-wrap">
                                                <div class="mh-strength-seg" id="seg1"></div>
                                                <div class="mh-strength-seg" id="seg2"></div>
                                                <div class="mh-strength-seg" id="seg3"></div>
                                                <div class="mh-strength-seg" id="seg4"></div>
                                            </div>
                                            <span class="mh-strength-label" id="strengthLabel">Weak</span>
                                        </div>
                                    </div>
                                    <div class="mh-set-field">
                                        <label>Confirm New Password</label>
                                        <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"
                                            placeholder="Repeat new password" />
                                    </div>
                                </div>

                                <asp:Panel ID="pnlPwdError"   runat="server" Visible="false" CssClass="mh-alert-error" style="margin-top:12px;">
                                    <asp:Label ID="lblPwdError" runat="server" />
                                </asp:Panel>
                                <asp:Panel ID="pnlPwdSuccess" runat="server" Visible="false" CssClass="mh-alert-success" style="margin-top:12px;">
                                    <asp:Label ID="lblPwdSuccess" runat="server" />
                                </asp:Panel>

                                <div class="mh-panel-save-row">
                                    <asp:Button ID="btnChangePwd" runat="server" Text="Update Password"
                                        CssClass="btn-save-orange" OnClick="btnChangePwd_Click" />
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- 2FA -->
                            <div class="mh-security-section">
                                <p class="mh-security-section-title">🛡 Two-Factor Authentication</p>
                                <p class="mh-security-section-desc">Add an extra layer of security to your account.</p>

                                <div class="mh-2fa-row">
                                    <div class="mh-2fa-info">
                                        <h4>📱 Authenticator App</h4>
                                        <p>Use Google Authenticator or Authy to generate time-based OTP codes.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" id="toggle2faApp" />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                                <div class="mh-2fa-row">
                                    <div class="mh-2fa-info">
                                        <h4>💬 SMS Verification</h4>
                                        <p>Receive a one-time code via SMS to your registered phone number.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" id="toggle2faSms" checked />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                                <div class="mh-2fa-row">
                                    <div class="mh-2fa-info">
                                        <h4>📧 Email OTP</h4>
                                        <p>Receive a verification code to your registered email address.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" id="toggle2faEmail" checked />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Active Sessions -->
                            <div class="mh-security-section">
                                <p class="mh-security-section-title">💻 Active Sessions</p>
                                <p class="mh-security-section-desc">Devices currently logged into your MachineHub account.</p>

                                <div class="mh-session-row">
                                    <div class="mh-session-device">
                                        <div class="mh-session-icon">🖥</div>
                                        <div>
                                            <p class="mh-session-device-name">Windows PC — Chrome 128</p>
                                            <p class="mh-session-device-info">Mumbai, India · Active now</p>
                                        </div>
                                    </div>
                                    <span class="mh-session-current">Current</span>
                                </div>
                                <div class="mh-session-row">
                                    <div class="mh-session-device">
                                        <div class="mh-session-icon">📱</div>
                                        <div>
                                            <p class="mh-session-device-name">iPhone 14 — Safari</p>
                                            <p class="mh-session-device-info">Pune, India · 2 hours ago</p>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-revoke" onclick="revokeSession(this, 'iPhone 14')">Revoke</button>
                                </div>
                                <div class="mh-session-row">
                                    <div class="mh-session-device">
                                        <div class="mh-session-icon">💻</div>
                                        <div>
                                            <p class="mh-session-device-name">MacBook Pro — Firefox</p>
                                            <p class="mh-session-device-info">Delhi, India · Yesterday</p>
                                        </div>
                                    </div>
                                    <button type="button" class="btn-revoke" onclick="revokeSession(this, 'MacBook Pro')">Revoke</button>
                                </div>
                            </div>
                        </div>

                        <!-- ============================================================
                             TAB 3 — PREFERENCES
                             ============================================================ -->
                        <div id="tab-prefs" class="mh-tab-panel">
                            <div class="mh-settings-card-head">
                                <div>
                                    <h1>Preferences</h1>
                                    <p>Customize your MachineHub experience and notification settings.</p>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Appearance -->
                            <div class="mh-pref-group">
                                <p class="mh-pref-group-title">🎨 Appearance</p>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Theme</h4>
                                        <p>Choose between light and dark mode for the dashboard.</p>
                                    </div>
                                    <div class="mh-theme-options">
                                        <button type="button" class="mh-theme-btn sel" id="themeLight"
                                            onclick="setTheme('light')">☀ Light</button>
                                        <button type="button" class="mh-theme-btn" id="themeDark"
                                            onclick="setTheme('dark')">🌙 Dark</button>
                                        <button type="button" class="mh-theme-btn" id="themeSystem"
                                            onclick="setTheme('system')">⚙ System</button>
                                    </div>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Language</h4>
                                        <p>Select your preferred display language.</p>
                                    </div>
                                    <select class="mh-pref-select" id="selLanguage">
                                        <option value="en" selected>English (US)</option>
                                        <option value="hi">हिन्दी (Hindi)</option>
                                        <option value="gu">ગુજરાતી (Gujarati)</option>
                                        <option value="mr">मराठी (Marathi)</option>
                                    </select>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Currency</h4>
                                        <p>Choose your preferred currency for pricing display.</p>
                                    </div>
                                    <select class="mh-pref-select" id="selCurrency">
                                        <option value="inr" selected>₹ INR – Indian Rupee</option>
                                        <option value="usd">$ USD – US Dollar</option>
                                        <option value="eur">€ EUR – Euro</option>
                                    </select>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Notifications -->
                            <div class="mh-pref-group">
                                <p class="mh-pref-group-title">🔔 Notifications</p>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Booking Confirmations</h4>
                                        <p>Get notified when a booking is confirmed or cancelled.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" checked />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Payment Receipts</h4>
                                        <p>Receive email receipts for every successful payment.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" checked />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Promotional Offers</h4>
                                        <p>Receive deals and discount offers from MachineHub.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Equipment Availability Alerts</h4>
                                        <p>Get notified when a machine you viewed becomes available.</p>
                                    </div>
                                    <label class="mh-toggle">
                                        <input type="checkbox" checked />
                                        <span class="mh-toggle-slider"></span>
                                    </label>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Booking Preferences -->
                            <div class="mh-pref-group">
                                <p class="mh-pref-group-title">📋 Booking Defaults</p>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Default Pickup Time</h4>
                                        <p>Pre-select your preferred pickup time when booking equipment.</p>
                                    </div>
                                    <select class="mh-pref-select" id="selPickupTime">
                                        <option>08:00 AM</option>
                                        <option selected>09:00 AM</option>
                                        <option>10:00 AM</option>
                                        <option>11:00 AM</option>
                                    </select>
                                </div>
                                <div class="mh-pref-row">
                                    <div class="mh-pref-info">
                                        <h4>Default Delivery State</h4>
                                        <p>Auto-fill your state when filling booking delivery forms.</p>
                                    </div>
                                    <select class="mh-pref-select" id="selDefaultState">
                                        <option>Gujarat</option>
                                        <option>Maharashtra</option>
                                        <option>Delhi</option>
                                        <option>Karnataka</option>
                                        <option>Tamil Nadu</option>
                                    </select>
                                </div>
                            </div>

                            <hr class="mh-card-divider" />

                            <!-- Danger Zone -->
                            <div class="mh-pref-group">
                                <p class="mh-pref-group-title">⚠ Danger Zone</p>
                                <div class="mh-danger-zone">
                                    <h4>Delete Account</h4>
                                    <p>Permanently delete your account and all associated booking data. This action cannot be undone.</p>
                                    <button type="button" class="btn-danger"
                                        onclick="return confirm('Are you sure? This will permanently delete your account.')">
                                        Delete My Account
                                    </button>
                                </div>
                            </div>

                            <div class="mh-panel-save-row">
                                <button type="button" class="btn-save-orange"
                                    onclick="savePrefs()">Save Preferences</button>
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

    <script>
        // ── Tab switching ──────────────────────────────────────────────
        document.querySelectorAll('.mh-tab-link').forEach(function (link) {
            link.addEventListener('click', function (e) {
                e.preventDefault();
                var target = this.dataset.tab;

                // Update active link
                document.querySelectorAll('.mh-tab-link').forEach(function (l) { l.classList.remove('active'); });
                this.classList.add('active');

                // Show target panel, hide others
                document.querySelectorAll('.mh-tab-panel').forEach(function (p) { p.classList.remove('active'); });
                document.getElementById(target).classList.add('active');

                // Scroll to top of card smoothly
                document.querySelector('.mh-settings-card').scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });

        // ── Deep-link via ?tab=security or ?tab=prefs ─────────────────
        (function () {
            var params = new URLSearchParams(window.location.search);
            var tab = params.get('tab');
            if (tab) {
                var link = document.querySelector('[data-tab="tab-' + tab + '"]');
                if (link) link.click();
            }
        })();

        // ── Password strength meter ────────────────────────────────────
        var newPwdBox = document.getElementById('txtNewPwd');
        if (newPwdBox) {
            newPwdBox.addEventListener('input', function () {
                var val = this.value;
                var wrap = document.getElementById('strengthWrap');
                var label = document.getElementById('strengthLabel');
                var segs = [document.getElementById('seg1'), document.getElementById('seg2'),
                            document.getElementById('seg3'), document.getElementById('seg4')];
                wrap.style.display = val.length ? 'block' : 'none';

                var score = 0;
                if (val.length >= 8)  score++;
                if (/[A-Z]/.test(val))  score++;
                if (/[0-9]/.test(val))  score++;
                if (/[^A-Za-z0-9]/.test(val)) score++;

                var cls = ['', 'weak', 'fair', 'good', 'strong'][score] || 'weak';
                var lbl = ['', 'Weak', 'Fair', 'Good', 'Strong'][score] || 'Weak';
                segs.forEach(function (s, i) {
                    s.className = 'mh-strength-seg ' + (i < score ? cls : '');
                });
                label.textContent = lbl;
                label.style.color = { weak: '#EF4444', fair: '#F59E0B', good: '#3B82F6', strong: '#22C55E' }[cls] || '#94A3B8';
            });
        }

        // ── Theme selector ─────────────────────────────────────────────
        function setTheme(t) {
            ['light', 'dark', 'system'].forEach(function (id) {
                document.getElementById('theme' + id.charAt(0).toUpperCase() + id.slice(1))
                    .classList.toggle('sel', id === t);
            });
        }

        // ── Revoke session ─────────────────────────────────────────────
        function revokeSession(btn, name) {
            if (!confirm('Revoke session for ' + name + '?')) return;
            var row = btn.closest('.mh-session-row');
            row.style.transition = 'opacity 0.4s, transform 0.4s';
            row.style.opacity = '0';
            row.style.transform = 'translateX(20px)';
            setTimeout(function () { row.remove(); }, 400);
        }

        // ── Preferences save (client-side toast) ───────────────────────
        function savePrefs() {
            var toast = document.createElement('div');
            toast.style.cssText = 'position:fixed;bottom:30px;right:30px;background:#22C55E;color:#fff;padding:14px 24px;border-radius:10px;font-weight:700;font-size:14px;box-shadow:0 4px 20px rgba(0,0,0,0.15);z-index:9999;transition:opacity 0.4s;';
            toast.textContent = '✓ Preferences saved successfully!';
            document.body.appendChild(toast);
            setTimeout(function () { toast.style.opacity = '0'; setTimeout(function () { toast.remove(); }, 400); }, 2500);
        }

        // ── Avatar initials from name ──────────────────────────────────
        (function () {
            var nameEl = document.getElementById('<%= lblUserDisplayName.ClientID %>');
            var circle = document.getElementById('avatarCircle');
            if (nameEl && circle) {
                var parts = nameEl.textContent.trim().split(' ');
                var initials = parts.map(function (p) { return p.charAt(0).toUpperCase(); }).slice(0, 2).join('');
                if (initials) circle.textContent = initials;
            }
        })();
    </script>
</body>
</html>
