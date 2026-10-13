<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="machinehub.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-ct-section">
        <div class="container">
            <div class="mh-ct-header">
                <h1>Get in Touch</h1>
                <p class="mh-ct-sub">Need assistance with an equipment rental or have a technical question? Our support team is ready to help you keep your project moving.</p>
            </div>

            <div class="mh-ct-grid">

                <!-- ============ FORM CARD ============ -->
                <div class="mh-ct-card form-card">
                    <h2>Send us a Message</h2>

                    <!-- Server-side alerts -->
                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                        <asp:Label ID="lblError" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                        <asp:Label ID="lblSuccess" runat="server" />
                    </asp:Panel>

                    <!-- First Name + Last Name -->
                    <div class="mh-ct-two">
                        <div class="mh-ct-group">
                            <label>First Name</label>
                            <asp:TextBox ID="txtFirst" runat="server" MaxLength="50" placeholder="Dhruv" />

                            <!-- ✅ RequiredFieldValidator -->
                            <asp:RequiredFieldValidator ID="rfvFirst" runat="server"
                                ControlToValidate="txtFirst"
                                ErrorMessage="First name is required."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationGroup="vgContact" />

                            <!-- ✅ RegularExpressionValidator (letters only, 2-50) -->
                            <asp:RegularExpressionValidator ID="revFirst" runat="server"
                                ControlToValidate="txtFirst"
                                ValidationExpression="^[a-zA-Z\s]{2,50}$"
                                ErrorMessage="First name must be 2-50 letters only."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationGroup="vgContact" />
                        </div>

                        <div class="mh-ct-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtLast" runat="server" MaxLength="50" placeholder="Gohel" />

                            <asp:RequiredFieldValidator ID="rfvLast" runat="server"
                                ControlToValidate="txtLast"
                                ErrorMessage="Last name is required."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationGroup="vgContact" />

                            <asp:RegularExpressionValidator ID="revLast" runat="server"
                                ControlToValidate="txtLast"
                                ValidationExpression="^[a-zA-Z\s]{2,50}$"
                                ErrorMessage="Last name must be 2-50 letters only."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationGroup="vgContact" />
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="mh-ct-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="dhruv.gohel@company.com" />

                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationGroup="vgContact" />

                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                            ErrorMessage="Enter valid email (example@mail.com)."
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationGroup="vgContact" />
                    </div>

                    <!-- Inquiry Type -->
                    <div class="mh-ct-group">
                        <label>Inquiry Type</label>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="mh-ct-select">
                            <asp:ListItem Value="" Text="Select an option" />
                            <asp:ListItem>Equipment Rental</asp:ListItem>
                            <asp:ListItem>Technical Support</asp:ListItem>
                            <asp:ListItem>Billing</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>

                        <!-- ✅ RequiredFieldValidator for DropDownList -->
                        <asp:RequiredFieldValidator ID="rfvType" runat="server"
                            ControlToValidate="ddlType"
                            InitialValue=""
                            ErrorMessage="Please select an inquiry type."
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationGroup="vgContact" />
                    </div>

                    <!-- Message -->
                    <div class="mh-ct-group">
                        <label>Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" MaxLength="1000"
                                     placeholder="How can we help you today?" />

                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Message is required."
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationGroup="vgContact" />

                        <asp:RegularExpressionValidator ID="revMessage" runat="server"
                            ControlToValidate="txtMessage"
                            ValidationExpression="^[\s\S]{10,1000}$"
                            ErrorMessage="Message must be between 10 and 1000 characters."
                            ForeColor="Red"
                            Display="Dynamic"
                            ValidationGroup="vgContact" />
                    </div>

                    <!-- Submit Button with ValidationGroup -->
                    <asp:Button ID="btnSubmit" runat="server"
                        Text="Submit Request"
                        CssClass="btn-submit-orange"
                        OnClick="btnSubmit_Click"
                        ValidationGroup="vgContact" />
                </div>

                <!-- ============ SIDE INFO CARDS ============ -->
                <div class="mh-ct-side">
                    <div class="mh-ct-card dark">
                        <h3>Customer Support</h3>
                        <p class="mut">Our experts are available 24/7 for critical equipment issues.</p>

                        <div class="mh-ct-info-item">
                            <div>
                                <small>Emergency Hotline</small>
                                <b>1-800-MAC-HUB9</b>
                            </div>
                        </div>

                        <div class="mh-ct-info-item">
                            <div>
                                <small>General Inquiries</small>
                                <b>support@machinehub.com</b>
                            </div>
                        </div>
                    </div>

                    <div class="mh-ct-card">
                        <h3>Global Headquarters</h3>
                        <div class="mh-ct-headquarters">
                            <div>
                                <p class="mh-ct-addr">4500 Industrial Parkway<br />Suite 200<br />Rajkot, 360004<br />Gujrat</p>
                            </div>
                        </div>
                        <a href="#" class="mh-ct-dir">Get Directions</a>
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>