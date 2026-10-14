<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="machinehub.MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-bkg-page-section">
        <div class="container">

            <!-- PAGE HEADER + SEARCH -->
            <div class="mh-bkg-header">
                <div>
                    <h1>My Bookings</h1>
                    <p>Manage and track your heavy equipment rentals.</p>
                </div>
                <div class="mh-bkg-search-wrap">
                    <svg class="search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <asp:TextBox ID="txtBookingSearch" runat="server" placeholder="Search booking ID..." AutoPostBack="true" OnTextChanged="txtBookingSearch_TextChanged" />
                </div>
            </div>

            <!-- ============ ACTIVE BOOKING (FEATURED CARD) ============ -->
            <asp:Panel ID="pnlActiveCard" runat="server" CssClass="mh-bkg-active-card">
                <div class="mh-bkg-top-row">
                    <div class="mh-bkg-status-wrap">
                        <span class="mh-bkg-badge active">
                            <span class="badge-dot">&bull;</span> Active
                        </span>
                        <span class="mh-bkg-id">ID: #BKG-8892A</span>
                    </div>
                    <div class="mh-bkg-more-btn" title="Options">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                            <circle cx="12" cy="5" r="2"></circle>
                            <circle cx="12" cy="12" r="2"></circle>
                            <circle cx="12" cy="19" r="2"></circle>
                        </svg>
                    </div>
                </div>

                <div class="mh-bkg-active-body">
                    <div class="mh-bkg-active-media">
                        <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=1200&q=80"
                             alt="JCB 3DX EcoXcellence" />
                    </div>

                    <div class="mh-bkg-active-details">
                        <h2 class="mh-bkg-machine-name">JCB 3DX EcoXcellence</h2>
                        <div class="mh-bkg-location">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                            <span>Site Alpha, Mumbai, IN</span>
                        </div>

                        <div class="mh-bkg-metrics">
                            <div class="mh-bkg-metric">
                                <span class="metric-label">DURATION</span>
                                <span class="metric-val">12 Oct - 26 Oct 2026</span>
                            </div>
                            <div class="mh-bkg-metric">
                                <span class="metric-label">TOTAL COST</span>
                                <span class="metric-cost">45,000</span>
                            </div>
                        </div>

                        <a href="BookingDetail.aspx" class="mh-btn-view-details">View Details</a>
                    </div>
                </div>
            </asp:Panel>

            <!-- ============ VIEW TOGGLE BAR ============ -->
            <div class="mh-view-toggle-bar">
                <h2>All Bookings</h2>
                <div class="mh-view-toggle-buttons">
                    <asp:LinkButton ID="btnCardsView" runat="server" OnClick="btnCardsView_Click" CssClass="mh-view-btn active">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                        Cards View
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnTableView" runat="server" OnClick="btnTableView_Click" CssClass="mh-view-btn">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                        Data Table View
                    </asp:LinkButton>
                </div>
            </div>

            <!-- ============ 1. CARDS VIEW (Bound via DataTable) ============ -->
            <asp:Panel ID="pnlCardsView" runat="server">
                <div class="mh-bkg-grid">
                    <asp:Repeater ID="rptBookingsCards" runat="server">
                        <ItemTemplate>
                            <div class="mh-bkg-subcard">
                                <div>
                                    <div class="mh-bkg-card-head">
                                        <span class='mh-bkg-badge <%# Eval("BadgeClass") %>'><%# Eval("Status") %></span>
                                        <span class="mh-bkg-card-id">#<%# Eval("BookingId") %></span>
                                    </div>
                                    <div class="mh-bkg-machine-row">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("EquipmentName") %>' class="mh-bkg-thumb" />
                                        <div class="mh-bkg-machine-meta">
                                            <h3><%# Eval("EquipmentName") %></h3>
                                            <div class="mh-bkg-subloc">
                                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                                    <circle cx="12" cy="10" r="3"></circle>
                                                </svg>
                                                <span><%# Eval("Location") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div class="mh-bkg-card-metrics">
                                        <div>
                                            <span class="metric-label">DURATION</span>
                                            <span class="metric-val-sm"><%# Eval("Duration") %></span>
                                        </div>
                                        <div class="text-right">
                                            <span class="metric-label">TOTAL</span>
                                            <span class="metric-cost-sm"><%# Eval("TotalCost") %></span>
                                        </div>
                                    </div>
                                    <a href='<%# Eval("ActionUrl") %>' class="mh-btn-review-bkg">REVIEW BOOKING</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </asp:Panel>

            <!-- ============ 2. DATA TABLE VIEW (Bound via DataTable) ============ -->
            <asp:Panel ID="pnlTableView" runat="server" Visible="false">
                <div class="mh-table-responsive">
                    <table class="mh-data-table">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Equipment</th>
                                <th>Location</th>
                                <th>Duration</th>
                                <th>Total Cost</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptBookingsTable" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <span class="mh-table-id-tag">#<%# Eval("BookingId") %></span>
                                        </td>
                                        <td>
                                            <div class="mh-table-machine-cell">
                                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("EquipmentName") %>' class="mh-table-thumb" />
                                                <div>
                                                    <div class="mh-table-machine-title"><%# Eval("EquipmentName") %></div>
                                                    <div class="mh-table-machine-loc"><%# Eval("Location") %></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><%# Eval("Location") %></td>
                                        <td><%# Eval("Duration") %></td>
                                        <td><strong class="mh-table-price"><%# Eval("TotalCost") %></strong></td>
                                        <td>
                                            <span class='mh-bkg-badge <%# Eval("BadgeClass") %>'>
                                                <%# Eval("Status") %>
                                            </span>
                                        </td>
                                        <td>
                                            <a href='<%# Eval("ActionUrl") %>' class="mh-btn-table-action">View Details</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </asp:Panel>

            <!-- NO RESULTS PANEL -->
            <asp:Panel ID="pnlNoResults" runat="server" Visible="false" style="padding: 40px; text-align: center; color: #64748B; background: #FFFFFF; border-radius: 14px; border: 1px solid #E2E8F0; margin-top: 20px;">
                <h3 style="font-size: 18px; font-weight: 700; color: #0F172A; margin-bottom: 8px;">No bookings found</h3>
                <p style="font-size: 14px; margin: 0;">No equipment bookings match your search query.</p>
            </asp:Panel>

        </div>
    </section>

</asp:Content>