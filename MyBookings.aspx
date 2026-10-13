<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="machinehub.MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-list-section">
        <div class="container">

            <!-- Header + Search -->
            <div class="mh-list-header">
                <div>
                    <h1>My Bookings</h1>
                    <p>Manage and track your heavy equipment rentals.</p>
                </div>
                <div class="mh-cat-search">
                    <input type="text" placeholder="Search booking ID..." />
                </div>
            </div>

            <!-- ============ ACTIVE BOOKING ============ -->
            <div class="mh-booking-active">
                <div class="mh-booking-active-top">
                    <span class="mh-status-active">Active</span>
                    <span class="mh-booking-id">ID: #BKG-8892A</span>
                </div>

                <div class="mh-booking-active-body">
                    <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80"
                         alt="JCB 3DX Backhoe Loader" />

                    <div class="mh-booking-active-info">
                        <h2>JCB 3DX EcoXcellence</h2>
                        <p class="mh-location">Site Alpha, Mumbai, IN</p>

                        <div class="mh-booking-row">
                            <div><small>DURATION</small><strong>12 Oct – 26 Oct 2026</strong></div>
                            <div><small>TOTAL COST</small><strong>45,000</strong></div>
                        </div>

                        <a href="BookingDetail.aspx" class="btn-orange-block">View Details</a>
                    </div>
                </div>
            </div>

            <!-- ============ BOOKINGS GRID ============ -->
            <div class="mh-bookings-grid">

                <!-- Pending -->
                <div class="mh-booking-card">
                    <div class="mh-booking-card-top">
                        <span class="mh-status-pending">Pending</span>
                        <span class="mh-booking-id-sm">#BKG-9011C</span>
                    </div>
                    <div class="mh-booking-card-body">
                        <div class="mh-booking-item">
                            <img src="https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?auto=format&fit=crop&w=300&q=80"
                                 alt="Cummins Generator" />
                            <div>
                                <h4>Cummins 500kVA DG Set</h4>
                                <p>Site Beta, Pune</p>
                            </div>
                        </div>
                        <div class="mh-booking-row-sm">
                            <div><small>DURATION</small><strong>01 Nov – 15 Nov 2026</strong></div>
                            <div><small>TOTAL</small><strong>35,000</strong></div>
                        </div>
                        <a href="#" class="btn-outline-orange">REVIEW BOOKING</a>
                    </div>
                </div>

                <!-- Completed 1 -->
                <div class="mh-booking-card">
                    <div class="mh-booking-card-top">
                        <span class="mh-status-completed">Completed</span>
                        <span class="mh-booking-id-sm">#BKG-8421A</span>
                    </div>
                    <div class="mh-booking-card-body">
                        <div class="mh-booking-item">
                            <img src="https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=300&q=80"
                                 alt="Genie Boom Lift" />
                            <div>
                                <h4>Genie S-85 Boom Lift</h4>
                                <p>Logistics Hub, Chennai</p>
                            </div>
                        </div>
                        <div class="mh-booking-row-sm">
                            <div><small>DURATION</small><strong>05 Aug – 20 Aug 2026</strong></div>
                            <div><small>TOTAL</small><strong>55,000</strong></div>
                        </div>
                    </div>
                </div>

                <!-- Completed 2 -->
                <div class="mh-booking-card">
                    <div class="mh-booking-card-top">
                        <span class="mh-status-completed">Completed</span>
                        <span class="mh-booking-id-sm">#BKG-7721B</span>
                    </div>
                    <div class="mh-booking-card-body">
                        <div class="mh-booking-item">
                            <img src="https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=300&q=80"
                                 alt="Tata Hitachi Excavator" />
                            <div>
                                <h4>Tata Hitachi ZAXIS 210</h4>
                                <p>Industrial Area, Bangalore</p>
                            </div>
                        </div>
                        <div class="mh-booking-row-sm">
                            <div><small>DURATION</small><strong>10 Jul – 25 Jul 2026</strong></div>
                            <div><small>TOTAL</small><strong>62,000</strong></div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>

</asp:Content>