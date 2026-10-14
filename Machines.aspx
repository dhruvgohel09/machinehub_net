<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Machines.aspx.cs" Inherits="machinehub.Machines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-list-section">
        <div class="container">

            <!-- Header + Sort & View Toggle -->
            <div class="mh-list-header">
                <div>
                    <h1>Heavy Equipment</h1>
                    <p>Showing available excavators and heavy industrial machinery</p>
                </div>
                <div class="mh-sort-wrap">
                    <label>Sort by:</label>
                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" CssClass="mh-sort-select">
                        <asp:ListItem Value="recommended">Recommended</asp:ListItem>
                        <asp:ListItem Value="low-to-high">Price: Low to High</asp:ListItem>
                        <asp:ListItem Value="high-to-low">Price: High to Low</asp:ListItem>
                    </asp:DropDownList>
                    <div class="mh-view-toggle">
                        <asp:LinkButton ID="btnGrid" runat="server" OnClick="btnGrid_Click" CssClass="mh-view-btn active" ToolTip="Cards Grid View">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTable" runat="server" OnClick="btnTable_Click" CssClass="mh-view-btn" ToolTip="Data Table View">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- ============ 1. EQUIPMENT CARDS GRID ============ -->
            <asp:Panel ID="pnlMachinesGrid" runat="server">
                <div class="mh-eq-grid">

                    <!-- ===== FEATURED: CAT 320 ===== -->
                    <div class="mh-eq-card-featured">
                        <div class="mh-eq-img-wrap">
                            <span class="mh-badge-available">Available</span>
                            <span class="mh-badge-featured">Featured</span>
                            <img src="https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=1200&q=80"
                                 alt="Caterpillar 320 Hydraulic Excavator" />
                            <div class="mh-eq-brand-label">CATERPILLAR</div>
                            <div class="mh-eq-name-overlay">320 Hydraulic Excavator</div>
                        </div>

                        <div class="mh-eq-specs-row">
                            <div class="mh-eq-spec"><div><small>Operating Weight</small><strong>22,500 kg</strong></div></div>
                            <div class="mh-eq-spec"><div><small>Engine Power</small><strong>172 HP</strong></div></div>
                            <div class="mh-eq-spec"><div><small>Year Model</small><strong>2023</strong></div></div>
                            <div class="mh-eq-spec"><div><small>Location</small><strong>Mumbai Depot</strong></div></div>
                        </div>

                        <p class="mh-eq-desc">Next generation excavator delivering premium performance with integrated Cat GRADE with 2D, Grade Assist, and Payload.</p>

                        <div class="mh-eq-price-row">
                            <div>
                                <small>Daily Rate</small>
                                <div class="mh-eq-price">28,000<small>/day</small></div>
                            </div>
                            <div class="mh-eq-buttons">
                                <a href="BookingDetail.aspx" class="btn-outline-dark">More Details</a>
                                <a href="SelectDate.aspx?machine=CAT320" class="btn-orange">Rent Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- ===== KOMATSU ===== -->
                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-available">Available</span>
                            <img src="https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?auto=format&fit=crop&w=600&q=80"
                                 alt="Komatsu PC210LC-11 Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">KOMATSU</div>
                            <h3>PC210LC-11</h3>
                            <div class="mh-eq-specs-sm"><span>22.1t</span><span>165 HP</span></div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>14,500</strong><small>/day</small></div>
                                <a href="SelectDate.aspx?machine=PC210LC" class="btn-orange-sm">Rent</a>
                            </div>
                        </div>
                    </div>

                    <!-- ===== VOLVO (Maintenance) ===== -->
                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-maintenance">Maintenance</span>
                            <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80"
                                 alt="Volvo EC200E Crawler Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">VOLVO CE</div>
                            <h3>EC200E Crawler</h3>
                            <div class="mh-eq-specs-sm"><span>20.3t</span><span>154 HP</span></div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>13,000</strong><small>/day</small></div>
                                <button class="btn-disabled-sm" disabled>Unavailable</button>
                            </div>
                        </div>
                    </div>

                    <!-- ===== JCB ===== -->
                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-available">Available</span>
                            <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&w=600&q=80"
                                 alt="JCB 220X Tracked Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">JCB</div>
                            <h3>220X Tracked</h3>
                            <div class="mh-eq-specs-sm"><span>22.7t</span><span>173 HP</span></div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>15,200</strong><small>/day</small></div>
                                <a href="SelectDate.aspx?machine=JCB220X" class="btn-orange-sm">Rent</a>
                            </div>
                        </div>
                    </div>

                    <!-- ===== HITACHI (Rented) ===== -->
                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-rented">Rented</span>
                            <img src="https://images.unsplash.com/photo-1504307651254-35680f356dfd?auto=format&fit=crop&w=600&q=80"
                                 alt="Hitachi ZAXIS210LC-6 Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">HITACHI</div>
                            <h3>ZAXIS210LC-6</h3>
                            <div class="mh-eq-specs-sm"><span>21.5t</span><span>163 HP</span></div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>14,800</strong><small>/day</small></div>
                                <a href="#" class="btn-outline-dark-sm">Waitlist</a>
                            </div>
                        </div>
                    </div>

                </div>
            </asp:Panel>

            <!-- ============ 2. DATA TABLE VIEW (Bound via DataTable) ============ -->
            <asp:Panel ID="pnlMachinesTable" runat="server" Visible="false">
                <div class="mh-table-responsive">
                    <table class="mh-data-table">
                        <thead>
                            <tr>
                                <th>Machine ID</th>
                                <th>Equipment</th>
                                <th>Brand</th>
                                <th>Specifications</th>
                                <th>Location</th>
                                <th>Daily Rate</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptMachinesTable" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><span class="mh-table-id-tag"><%# Eval("MachineId") %></span></td>
                                        <td>
                                            <div class="mh-table-machine-cell">
                                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Model") %>' class="mh-table-thumb" />
                                                <div>
                                                    <div class="mh-table-machine-title"><%# Eval("Model") %></div>
                                                    <div class="mh-table-machine-loc"><%# Eval("Category") %></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><strong><%# Eval("Brand") %></strong></td>
                                        <td><%# Eval("Weight") %> / <%# Eval("Power") %></td>
                                        <td><%# Eval("Location") %></td>
                                        <td><strong class="mh-table-price"><%# Eval("DailyRate") %><small style="font-size: 11px; color: #64748B;">/day</small></strong></td>
                                        <td>
                                            <span class='mh-bkg-badge <%# Eval("BadgeClass") %>'>
                                                <%# Eval("Status") %>
                                            </span>
                                        </td>
                                        <td>
                                            <a href='<%# Eval("RentUrl") %>' class="mh-btn-table-action" style='<%# (bool)Eval("IsAvailable") ? "" : "pointer-events: none; opacity: 0.5; background: #F1F5F9; color: #94A3B8 !important; border-color: #E2E8F0;" %>'>
                                                <%# (bool)Eval("IsAvailable") ? "Rent Now" : Eval("Status") %>
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </asp:Panel>

        </div>
    </section>

</asp:Content>