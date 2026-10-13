<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="machinehub.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="mh-ct-section">
        <div class="container">
            <div class="mh-ct-header">
                <h1>Get in Touch</h1>
                <p class="mh-ct-sub">Need assistance with an equipment rental or have a technical question? Our support team is ready to help you keep your project moving.</p>
            </div>

            <div class="mh-ct-grid">
                <!-- FORM CARD -->
                <div class="mh-ct-card form-card">
                    <h2>Send us a Message</h2>
                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                        <asp:Label ID="lblError" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="mh-alert-success">
                        <asp:Label ID="lblSuccess" runat="server" />
                    </asp:Panel>

                    <div class="mh-ct-two">
                        <div class="mh-ct-group">
                            <label>First Name</label>
                            <asp:TextBox ID="txtFirst" runat="server" MaxLength="50" placeholder="Dhruv" />
                        </div>
                        <div class="mh-ct-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtLast" runat="server" MaxLength="50" placeholder="Gohel" />
                        </div>
                    </div>

                    <div class="mh-ct-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="dhruv.gohel@company.com" />
                    </div>

                    <div class="mh-ct-group">
                        <label>Inquiry Type</label>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="mh-ct-select">
                            <asp:ListItem Value="" Text="Select an option" />
                            <asp:ListItem>Equipment Rental</asp:ListItem>
                            <asp:ListItem>Technical Support</asp:ListItem>
                            <asp:ListItem>Billing</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mh-ct-group">
                        <label>Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" MaxLength="1000" placeholder="How can we help you today?" />
                    </div>

                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" CssClass="btn-submit-orange" OnClick="btnSubmit_Click" />
                </div>

                <!-- SIDE INFO CARDS -->
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
                                <p class="mh-ct-addr">4500 Industrial Parkway<br />Suite 200<br />Rajkot,  360004<br />Gujrat</p>
                            </div>
                        </div>
                        <a href="#" class="mh-ct-dir">Get Directions</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
