<%@ Page Title="Booking Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="machinehub.BookingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-bk-section">
        <div class="container">

            <div class="mh-bk-page-head">
                <h1>Delivery &amp; Details</h1>
                <p>Please provide your contact and delivery information for the rental.</p>
            </div>

            <div class="mh-bk-layout">

                <!-- ============ LEFT — FORM ============ -->
                <div class="mh-bk-left">

                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                        <asp:Label ID="lblError" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                        <asp:Label ID="lblSuccess" runat="server" />
                    </asp:Panel>

                    <!-- PERSONAL INFO -->
                    <div class="mh-bk-card">
                        <h2 class="mh-bk-card-title">
                            <span class="mh-bk-icon">👤</span> Personal Information
                        </h2>

                        <div class="mh-bk-row">
                            <div class="mh-bk-field">
                                <label>Full Name <span class="req">*</span></label>
                                <asp:TextBox ID="txtFullName" runat="server" placeholder="Rahul Sharma" />
                                <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                                    ControlToValidate="txtFullName"
                                    ErrorMessage="Full name is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                                <asp:RegularExpressionValidator ID="revFullName" runat="server"
                                    ControlToValidate="txtFullName"
                                    ValidationExpression="^[a-zA-Z\s]{3,50}$"
                                    ErrorMessage="Name must be 3-50 letters only."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                            </div>

                            <div class="mh-bk-field">
                                <label>Email Address <span class="req">*</span></label>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="rahul.sharma@example.com" />
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="Email is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                    ErrorMessage="Enter valid email (example@mail.com)."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                            </div>
                        </div>

                        <div class="mh-bk-field">
                            <label>Phone Number <span class="req">*</span></label>
                            <div class="mh-bk-phone-wrap">
                                <span class="mh-bk-prefix">+91</span>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="98765 43210" MaxLength="10" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ErrorMessage="Phone number is required."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgBooking" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^[6-9]\d{9}$"
                                ErrorMessage="Enter valid 10-digit mobile number."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgBooking" />
                        </div>
                    </div>

                    <!-- DELIVERY ADDRESS -->
                    <div class="mh-bk-card">
                        <h2 class="mh-bk-card-title">
                            <span class="mh-bk-icon">🚚</span> Delivery Address
                        </h2>

                        <div class="mh-bk-field">
                            <label>Street Address <span class="req">*</span></label>
                            <asp:TextBox ID="txtStreet" runat="server" placeholder="e.g. Plot 45, Industrial Area Phase 2" />
                            <asp:RequiredFieldValidator ID="rfvStreet" runat="server"
                                ControlToValidate="txtStreet"
                                ErrorMessage="Street address is required."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgBooking" />
                            <asp:RegularExpressionValidator ID="revStreet" runat="server"
                                ControlToValidate="txtStreet"
                                ValidationExpression="^.{5,200}$"
                                ErrorMessage="Street must be at least 5 characters."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgBooking" />
                        </div>

                        <div class="mh-bk-row">
                            <div class="mh-bk-field">
                                <label>City <span class="req">*</span></label>
                                <asp:TextBox ID="txtCity" runat="server" placeholder="Mumbai" />
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                    ControlToValidate="txtCity"
                                    ErrorMessage="City is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                                <asp:RegularExpressionValidator ID="revCity" runat="server"
                                    ControlToValidate="txtCity"
                                    ValidationExpression="^[a-zA-Z\s]{2,50}$"
                                    ErrorMessage="City must be 2-50 letters only."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                            </div>

                            <div class="mh-bk-field">
                                <label>State <span class="req">*</span></label>
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="mh-bk-select">
                                    <asp:ListItem Value="" Text="Select State" />
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Telangana</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server"
                                    ControlToValidate="ddlState"
                                    InitialValue=""
                                    ErrorMessage="Please select a state."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                            </div>
                        </div>

                        <div class="mh-bk-row">
                            <div class="mh-bk-field">
                                <label>PIN Code <span class="req">*</span></label>
                                <asp:TextBox ID="txtPin" runat="server" placeholder="400001" MaxLength="6" />
                                <asp:RequiredFieldValidator ID="rfvPin" runat="server"
                                    ControlToValidate="txtPin"
                                    ErrorMessage="PIN code is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                                <asp:RegularExpressionValidator ID="revPin" runat="server"
                                    ControlToValidate="txtPin"
                                    ValidationExpression="^[1-9][0-9]{5}$"
                                    ErrorMessage="Enter valid 6-digit PIN code."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgBooking" />
                            </div>

                            <div class="mh-bk-field">
                                <label>Landmark (Optional)</label>
                                <asp:TextBox ID="txtLandmark" runat="server" placeholder="Near Metro Pillar 45" MaxLength="100" />
                            </div>
                        </div>
                    </div>

                    <!-- PROJECT DETAILS -->
                    <div class="mh-bk-card">
                        <h2 class="mh-bk-card-title">
                            <span class="mh-bk-icon">🏗️</span> Project Details
                            <span class="mh-bk-optional">(Optional)</span>
                        </h2>
                        <div class="mh-bk-field">
                            <label>Project Name / Site ID</label>
                            <asp:TextBox ID="txtProject" runat="server" placeholder="e.g. Metro Line 3 Extension" MaxLength="100" />
                        </div>
                    </div>

                </div>

                <!-- ============ RIGHT — SUMMARY ============ -->
                <div class="mh-bk-right">
                    <div class="mh-bk-summary">
                        <h2>Booking Summary</h2>

                        <div class="mh-bk-machine">
                            <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=200&q=80"
                                 alt="<%= MachineName %>" />
                            <div>
                                <strong><%= MachineName %></strong>
                                <small><%= MachineCategory %></small>
                            </div>
                        </div>

                        <div class="mh-bk-sum-row">
                            <span>📅 Dates</span>
                            <div>
                                <strong><%= BookingDates %></strong>
                                <small><%= BookingDuration %></small>
                            </div>
                        </div>

                        <div class="mh-bk-sum-row">
                            <span>📍 Location</span>
                            <strong>Mumbai, MH</strong>
                        </div>

                        <div class="mh-bk-sum-divider"></div>

                        <div class="mh-bk-sum-line">
                            <span>Rental Fee (<%= BookingDuration %>)</span>
                            <strong><%= RentalFee %></strong>
                        </div>
                        <div class="mh-bk-sum-line">
                            <span>Delivery &amp; Pickup</span>
                            <strong><%= DeliveryFee %></strong>
                        </div>
                        <div class="mh-bk-sum-line">
                            <span>Taxes (18% GST)</span>
                            <strong><%= Taxes %></strong>
                        </div>

                        <div class="mh-bk-sum-divider"></div>

                        <div class="mh-bk-sum-total">
                            <span>Total</span>
                            <strong><%= TotalAmount %></strong>
                        </div>

                        <asp:Button ID="btnProceed" runat="server"
                            Text="Proceed to Payment →"
                            CssClass="mh-bk-proceed-btn"
                            OnClick="btnProceed_Click"
                            ValidationGroup="vgBooking" />

                        <div class="mh-bk-secure">
                            🔒 Secure Checkout
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>