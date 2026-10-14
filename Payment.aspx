<%@ Page Title="Secure Payment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="machinehub.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-pay-section">
        <div class="container">

            <div class="mh-pay-layout">

                <!-- ============ LEFT — PAYMENT FORM ============ -->
                <div class="mh-pay-card">

                    <div class="mh-pay-header">
                        <h1>Secure Payment</h1>
                        <p>Complete your transaction for the equipment rental.</p>
                    </div>

                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mh-alert-error">
                        <asp:Label ID="lblError" runat="server" />
                    </asp:Panel>

                    <h2 class="mh-pay-subtitle">Select Payment Method</h2>

                    <!-- ✅ Payment Method Radio Buttons -->
                    <asp:RadioButtonList ID="rblMethod" runat="server"
                        CssClass="mh-pay-methods"
                        RepeatDirection="Horizontal"
                        AutoPostBack="false">
                        <asp:ListItem Value="card" Selected="True">
                            <div class="mh-pay-method">
                                <span class="mh-pay-method-icon">💳</span>
                                <span>Credit/Debit Card</span>
                            </div>
                        </asp:ListItem>
                        <asp:ListItem Value="upi">
                            <div class="mh-pay-method">
                                <span class="mh-pay-method-icon">📱</span>
                                <span>UPI Apps</span>
                            </div>
                        </asp:ListItem>
                        <asp:ListItem Value="netbanking">
                            <div class="mh-pay-method">
                                <span class="mh-pay-method-icon">🏦</span>
                                <span>Net Banking</span>
                            </div>
                        </asp:ListItem>
                    </asp:RadioButtonList>

                    <!-- ============ CARD FORM ============ -->
                    <div class="mh-pay-form">

                        <div class="mh-pay-field">
                            <label>Card Number</label>
                            <asp:TextBox ID="txtCardNumber" runat="server"
                                placeholder="0000 0000 0000 0000"
                                MaxLength="19" />

                            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server"
                                ControlToValidate="txtCardNumber"
                                ErrorMessage="Card number is required."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgPayment" />

                            <asp:RegularExpressionValidator ID="revCardNumber" runat="server"
                                ControlToValidate="txtCardNumber"
                                ValidationExpression="^\d{16}$"
                                ErrorMessage="Enter valid 16-digit card number (no spaces)."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgPayment" />
                        </div>

                        <div class="mh-pay-row">
                            <div class="mh-pay-field">
                                <label>Expiry Date</label>
                                <asp:TextBox ID="txtExpiry" runat="server"
                                    placeholder="MM/YY" MaxLength="5" />

                                <asp:RequiredFieldValidator ID="rfvExpiry" runat="server"
                                    ControlToValidate="txtExpiry"
                                    ErrorMessage="Expiry date is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgPayment" />

                                <asp:RegularExpressionValidator ID="revExpiry" runat="server"
                                    ControlToValidate="txtExpiry"
                                    ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$"
                                    ErrorMessage="Enter valid expiry (MM/YY)."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgPayment" />
                            </div>

                            <div class="mh-pay-field">
                                <label>CVV</label>
                                <asp:TextBox ID="txtCVV" runat="server"
                                    placeholder="•••" MaxLength="3" TextMode="Password" />

                                <asp:RequiredFieldValidator ID="rfvCVV" runat="server"
                                    ControlToValidate="txtCVV"
                                    ErrorMessage="CVV is required."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgPayment" />

                                <asp:RegularExpressionValidator ID="revCVV" runat="server"
                                    ControlToValidate="txtCVV"
                                    ValidationExpression="^\d{3,4}$"
                                    ErrorMessage="Enter valid 3-4 digit CVV."
                                    ForeColor="Red" Display="Dynamic"
                                    ValidationGroup="vgPayment" />
                            </div>
                        </div>

                        <div class="mh-pay-field">
                            <label>Name on Card</label>
                            <asp:TextBox ID="txtNameOnCard" runat="server"
                                placeholder="e.g. Gohel Dhruv" MaxLength="50" />

                            <asp:RequiredFieldValidator ID="rfvNameOnCard" runat="server"
                                ControlToValidate="txtNameOnCard"
                                ErrorMessage="Name on card is required."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgPayment" />

                            <asp:RegularExpressionValidator ID="revNameOnCard" runat="server"
                                ControlToValidate="txtNameOnCard"
                                ValidationExpression="^[a-zA-Z\s]{3,50}$"
                                ErrorMessage="Name must be 3-50 letters only."
                                ForeColor="Red" Display="Dynamic"
                                ValidationGroup="vgPayment" />
                        </div>

                    </div>

                    <div class="mh-pay-info">
                        🔒 <strong>Your payment information is processed securely.</strong> We do not store your full card details.
                    </div>

                </div>

                <!-- ============ RIGHT — BOOKING SUMMARY ============ -->
                <div class="mh-pay-summary-wrap">
                    <div class="mh-pay-summary">

                        <div class="mh-pay-summary-head">
                            <h2>Booking Summary</h2>
                            <small>Order #MH-9982-IN</small>
                        </div>

                        <div class="mh-pay-machine">
                            <img src="https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=200&q=80"
                                 alt="Caterpillar 320 Excavator" />
                            <div>
                                <strong>Caterpillar 320</strong>
                                <small>Excavator</small>
                                <small class="mh-pay-mut">Heavy Machinery</small>
                            </div>
                        </div>

                        <div class="mh-pay-line">
                            <span>Duration</span>
                            <strong>5 Days</strong>
                        </div>
                        <div class="mh-pay-line">
                            <span>Start Date</span>
                            <strong>Oct 12, 2026</strong>
                        </div>
                        <div class="mh-pay-line">
                            <span>End Date</span>
                            <strong>Oct 16, 2026</strong>
                        </div>

                        <div class="mh-pay-divider"></div>

                        <div class="mh-pay-line">
                            <span>Rental Fee</span>
                            <strong>45,000</strong>
                        </div>
                        <div class="mh-pay-line">
                            <span>Transport</span>
                            <strong>5,000</strong>
                        </div>
                        <div class="mh-pay-line">
                            <span>Taxes (18% GST)</span>
                            <strong>9,000</strong>
                        </div>

                        <div class="mh-pay-divider"></div>

                        <div class="mh-pay-total">
                            <span>Total Amount</span>
                            <strong>59,000</strong>
                        </div>

                        <asp:Button ID="btnPay" runat="server"
                            Text="Confirm &amp; Pay →"
                            CssClass="mh-pay-btn"
                            OnClick="btnPay_Click"
                            ValidationGroup="vgPayment" />

                    </div>
                </div>

            </div>

        </div>
    </section>

</asp:Content>