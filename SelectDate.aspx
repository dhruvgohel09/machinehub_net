<%@ Page Title="Select Rental Dates" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectDate.aspx.cs" Inherits="machinehub.SelectDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-date-page-section">
        <div class="container">

            <div class="mh-date-header">
                <h1>Select Rental Dates</h1>
                <p>Choose the duration for your <%= MachineName %> rental.</p>
            </div>

            <div class="mh-date-layout">

                <!-- ============ LEFT — CALENDAR & TIME ============ -->
                <div class="mh-date-left">

                    <!-- CALENDAR CARD -->
                    <div class="mh-calendar-card">
                        <div class="mh-cal-nav-row">
                            <button type="button" class="mh-cal-arrow" onclick="prevMonth()">&lt;</button>
                            <h2 class="mh-cal-month-title">October 2026</h2>
                            <button type="button" class="mh-cal-arrow" onclick="nextMonth()">&gt;</button>
                        </div>

                        <div class="mh-cal-weekdays-grid">
                            <span>SUN</span>
                            <span>MON</span>
                            <span>TUE</span>
                            <span>WED</span>
                            <span>THU</span>
                            <span>FRI</span>
                            <span>SAT</span>
                        </div>

                        <div class="mh-cal-days-grid" id="calDaysGrid">
                            <!-- Week 1: Oct 1 is Thursday -->
                            <div class="mh-cal-cell empty"></div>
                            <div class="mh-cal-cell empty"></div>
                            <div class="mh-cal-cell empty"></div>
                            <div class="mh-cal-cell empty"></div>
                            <div class="mh-cal-cell" data-day="1">1</div>
                            <div class="mh-cal-cell" data-day="2">2</div>
                            <div class="mh-cal-cell" data-day="3">3</div>

                            <!-- Week 2 -->
                            <div class="mh-cal-cell" data-day="4">4</div>
                            <div class="mh-cal-cell" data-day="5">5</div>
                            <div class="mh-cal-cell" data-day="6">6</div>
                            <div class="mh-cal-cell" data-day="7">7</div>
                            <div class="mh-cal-cell" data-day="8">8</div>
                            <div class="mh-cal-cell" data-day="9">9</div>
                            <div class="mh-cal-cell" data-day="10">10</div>

                            <!-- Week 3 -->
                            <div class="mh-cal-cell" data-day="11">11</div>
                            <div class="mh-cal-cell" data-day="12">12</div>
                            <div class="mh-cal-cell" data-day="13">13</div>
                            <div class="mh-cal-cell selected start" data-day="14">14</div>
                            <div class="mh-cal-cell in-range" data-day="15">15</div>
                            <div class="mh-cal-cell in-range" data-day="16">16</div>
                            <div class="mh-cal-cell in-range" data-day="17">17</div>

                            <!-- Week 4 -->
                            <div class="mh-cal-cell selected end" data-day="18">18</div>
                            <div class="mh-cal-cell" data-day="19">19</div>
                            <div class="mh-cal-cell" data-day="20">20</div>
                            <div class="mh-cal-cell" data-day="21">21</div>
                            <div class="mh-cal-cell" data-day="22">22</div>
                            <div class="mh-cal-cell" data-day="23">23</div>
                            <div class="mh-cal-cell" data-day="24">24</div>

                            <!-- Week 5 -->
                            <div class="mh-cal-cell" data-day="25">25</div>
                            <div class="mh-cal-cell" data-day="26">26</div>
                            <div class="mh-cal-cell" data-day="27">27</div>
                            <div class="mh-cal-cell" data-day="28">28</div>
                            <div class="mh-cal-cell" data-day="29">29</div>
                            <div class="mh-cal-cell" data-day="30">30</div>
                            <div class="mh-cal-cell" data-day="31">31</div>
                        </div>

                        <div class="mh-cal-legend">
                            <div class="mh-legend-item">
                                <span class="mh-legend-dot selected"></span>
                                <span>Selected</span>
                            </div>
                            <div class="mh-legend-item">
                                <span class="mh-legend-dot in-range"></span>
                                <span>In Range</span>
                            </div>
                            <div class="mh-legend-item">
                                <span class="mh-legend-dot unavailable"></span>
                                <span>Unavailable</span>
                            </div>
                        </div>
                    </div>

                    <!-- TIME SELECTION CARD -->
                    <div class="mh-time-selection-card">
                        <div class="mh-time-field">
                            <label>Pick-up Time (Oct 14)</label>
                            <asp:DropDownList ID="ddlPickupTime" runat="server" CssClass="mh-time-select">
                                <asp:ListItem Value="08:00 AM">08:00 AM</asp:ListItem>
                                <asp:ListItem Value="09:00 AM">09:00 AM</asp:ListItem>
                                <asp:ListItem Value="10:00 AM" Selected="True">10:00 AM</asp:ListItem>
                                <asp:ListItem Value="11:00 AM">11:00 AM</asp:ListItem>
                                <asp:ListItem Value="12:00 PM">12:00 PM</asp:ListItem>
                                <asp:ListItem Value="02:00 PM">02:00 PM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mh-time-field">
                            <label>Return Time (Oct 18)</label>
                            <asp:DropDownList ID="ddlReturnTime" runat="server" CssClass="mh-time-select">
                                <asp:ListItem Value="03:00 PM">03:00 PM</asp:ListItem>
                                <asp:ListItem Value="04:00 PM">04:00 PM</asp:ListItem>
                                <asp:ListItem Value="05:00 PM" Selected="True">05:00 PM</asp:ListItem>
                                <asp:ListItem Value="06:00 PM">06:00 PM</asp:ListItem>
                                <asp:ListItem Value="07:00 PM">07:00 PM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <!-- ============ RIGHT — BOOKING SUMMARY ============ -->
                <div class="mh-date-right">
                    <div class="mh-date-summary-card">

                        <!-- Machine Mini Card -->
                        <div class="mh-summary-machine-box">
                            <img src="<%= MachineImage %>" alt="<%= MachineName %>" />
                            <div>
                                <span class="mh-cat-tag"><%= MachineCategory %></span>
                                <h3><%= MachineName %></h3>
                                <p><%= DailyRateText %></p>
                            </div>
                        </div>

                        <div class="mh-summary-head-label">BOOKING SUMMARY</div>

                        <div class="mh-sum-row-item">
                            <div class="mh-sum-icon-col">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span id="dispDates">Oct 14 - Oct 18</span>
                            </div>
                            <strong id="dispDuration">5 Days</strong>
                        </div>

                        <div class="mh-sum-row-item">
                            <div class="mh-sum-icon-col">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2">
                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                    <circle cx="12" cy="10" r="3"></circle>
                                </svg>
                                <span>Mumbai, MH</span>
                            </div>
                        </div>

                        <div class="mh-sum-divider"></div>

                        <div class="mh-sum-cost-line">
                            <span id="dispRentalLabel">Rental Cost (5 days)</span>
                            <strong id="dispRentalCost">22,500</strong>
                        </div>
                        <div class="mh-sum-cost-line">
                            <span>Delivery Fee (Est.)</span>
                            <strong id="dispDeliveryFee">1,200</strong>
                        </div>
                        <div class="mh-sum-cost-line">
                            <span>Tax (18% GST)</span>
                            <strong id="dispTaxes">4,266</strong>
                        </div>

                        <div class="mh-sum-divider"></div>

                        <div class="mh-sum-total-row">
                            <span>Total</span>
                            <strong id="dispTotal">27,966</strong>
                        </div>

                        <!-- Hidden fields to pass to code-behind -->
                        <asp:HiddenField ID="hdnSelectedDates" runat="server" Value="Oct 14 - Oct 18, 2026" />
                        <asp:HiddenField ID="hdnDuration" runat="server" Value="5 Days" />
                        <asp:HiddenField ID="hdnRentalCost" runat="server" Value="22,500" />
                        <asp:HiddenField ID="hdnDeliveryFee" runat="server" Value="1,200" />
                        <asp:HiddenField ID="hdnTaxes" runat="server" Value="4,266" />
                        <asp:HiddenField ID="hdnTotal" runat="server" Value="27,966" />

                        <!-- Button to Step 2: Delivery & Details -->
                        <asp:Button ID="btnContinue" runat="server"
                            Text="Continue to Details →"
                            CssClass="mh-btn-continue"
                            OnClick="btnContinue_Click" />

                        <div class="mh-sum-foot-note">
                            You won't be charged yet.
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </section>

    <!-- CALENDAR SELECTION SCRIPT -->
    <script>
        var startDay = 14;
        var endDay = 18;
        var dailyRate = 4500;

        function updateSelectionUI() {
            var cells = document.querySelectorAll('.mh-cal-cell[data-day]');
            cells.forEach(function (c) {
                var d = parseInt(c.getAttribute('data-day'));
                c.classList.remove('selected', 'start', 'end', 'in-range');
                if (d === startDay) {
                    c.classList.add('selected', 'start');
                } else if (d === endDay) {
                    c.classList.add('selected', 'end');
                } else if (d > startDay && d < endDay) {
                    c.classList.add('in-range');
                }
            });

            var days = (endDay - startDay) + 1;
            var rental = days * dailyRate;
            var delivery = 1200;
            var tax = Math.round(rental * 0.18 + delivery * 0.18);
            var total = rental + delivery + tax;

            var dateStr = "Oct " + startDay + " - Oct " + endDay;
            var fullDateStr = dateStr + ", 2026";
            var durStr = days + " Days";

            document.getElementById('dispDates').innerText = dateStr;
            document.getElementById('dispDuration').innerText = durStr;
            document.getElementById('dispRentalLabel').innerText = "Rental Cost (" + days + " days)";
            document.getElementById('dispRentalCost').innerText = rental.toLocaleString('en-IN');
            document.getElementById('dispDeliveryFee').innerText = delivery.toLocaleString('en-IN');
            document.getElementById('dispTaxes').innerText = tax.toLocaleString('en-IN');
            document.getElementById('dispTotal').innerText = total.toLocaleString('en-IN');

            document.getElementById('<%= hdnSelectedDates.ClientID %>').value = fullDateStr;
            document.getElementById('<%= hdnDuration.ClientID %>').value = durStr;
            document.getElementById('<%= hdnRentalCost.ClientID %>').value = rental.toLocaleString('en-IN');
            document.getElementById('<%= hdnDeliveryFee.ClientID %>').value = delivery.toLocaleString('en-IN');
            document.getElementById('<%= hdnTaxes.ClientID %>').value = tax.toLocaleString('en-IN');
            document.getElementById('<%= hdnTotal.ClientID %>').value = total.toLocaleString('en-IN');
        }

        document.querySelectorAll('.mh-cal-cell[data-day]').forEach(function (c) {
            c.addEventListener('click', function () {
                var d = parseInt(this.getAttribute('data-day'));
                if (d <= 0) return;
                if (!startDay || (startDay && endDay)) {
                    startDay = d;
                    endDay = null;
                } else if (startDay && !endDay) {
                    if (d < startDay) {
                        endDay = startDay;
                        startDay = d;
                    } else if (d === startDay) {
                        endDay = d;
                    } else {
                        endDay = d;
                    }
                }
                if (startDay && endDay) {
                    updateSelectionUI();
                } else if (startDay) {
                    var cells = document.querySelectorAll('.mh-cal-cell[data-day]');
                    cells.forEach(function (cell) {
                        var cd = parseInt(cell.getAttribute('data-day'));
                        cell.classList.remove('selected', 'start', 'end', 'in-range');
                        if (cd === startDay) cell.classList.add('selected', 'start');
                    });
                }
            });
        });

        function prevMonth() { /* demo toggle */ }
        function nextMonth() { /* demo toggle */ }
    </script>

</asp:Content>
