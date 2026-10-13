<%@ Page Title="My Bookings" Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="machinehub.MyBookings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Bookings - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <nav class="mh-navbar-dark">
            <div class="container">
                <a href="Default.aspx" class="mh-logo-light">Machine<span>Hub</span></a>
                <ul class="mh-menu-light">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Machines.aspx">Equipment</a></li>
                    <li><a href="Categories.aspx">Categories</a></li>
                    <li><a href="MyBookings.aspx" class="active">My Bookings</a></li>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
                <div class="mh-actions-light">
                    <a href="Settings.aspx" class="mh-login-link">Account</a>
                </div>
            </div>
        </nav>

        <section class="mh-list-section">
            <div class="container">

                <div class="mh-list-header">
                    <div>
                        <h1>My Bookings</h1>
                        <p>Manage and track your heavy equipment rentals.</p>
                    </div>
                    <div class="mh-cat-search">
                        <input type="text" placeholder="Search booking ID..." />
                    </div>
                </div>

                <div class="mh-booking-active">
                    <div class="mh-booking-active-top">
                        <span class="mh-status-active">Active</span>
                        <span class="mh-booking-id">ID: #BKG-8892A</span>
                    </div>

                    <div class="mh-booking-active-body">
                        <img src="https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?w=600&q=80" alt="Backhoe" />

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

                <div class="mh-bookings-grid">

                    <div class="mh-booking-card">
                        <div class="mh-booking-card-top">
                            <span class="mh-status-pending">Pending</span>
                            <span class="mh-booking-id-sm">#BKG-9011C</span>
                        </div>
                        <div class="mh-booking-card-body">
                            <div class="mh-booking-item">
                                <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=300&q=80" alt="Machine" />
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

                    <div class="mh-booking-card">
                        <div class="mh-booking-card-top">
                            <span class="mh-status-completed">Completed</span>
                            <span class="mh-booking-id-sm">#BKG-8421A</span>
                        </div>
                        <div class="mh-booking-card-body">
                            <div class="mh-booking-item">
                                <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=300&q=80" alt="Machine" />
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

                    <div class="mh-booking-card">
                        <div class="mh-booking-card-top">
                            <span class="mh-status-completed">Completed</span>
                            <span class="mh-booking-id-sm">#BKG-7721B</span>
                        </div>
                        <div class="mh-booking-card-body">
                            <div class="mh-booking-item">
                                <img src="https://images.unsplash.com/photo-1541888946425-d0fbb18086f6?w=300&q=80" alt="Tata Hitachi" />
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

        <footer class="mh-footer-big">
            <div class="container">
                <div class="mh-footer-big-grid">
                    <div>
                        <div class="brand-big">Machine<span>Hub</span></div>
                        <p>The premier marketplace for industrial equipment rentals. Connecting project managers with reliable machinery across India.</p>
                    </div>
                    <div>
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="Machines.aspx">Browse Equipment</a></li>
                            <li><a href="Categories.aspx">Categories</a></li>
                            <li><a href="#">How it Works</a></li>
                            <li><a href="#">Pricing</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4>Support</h4>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="Contact.aspx">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mh-footer-bottom">
                    <span>© 2026 MachineHub Industrial. All rights reserved.</span>
                </div>
            </div>
        </footer>

    </form>
</body>
</html>