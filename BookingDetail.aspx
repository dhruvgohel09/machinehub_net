<%@ Page Title="Booking Detail" Language="C#" AutoEventWireup="true" CodeBehind="BookingDetail.aspx.cs" Inherits="machinehub.BookingDetail" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking Detail - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-booking-detail-body">
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

        <section class="mh-detail-section">
            <div class="container">

                <a href="MyBookings.aspx" class="mh-back-link">Back to My Bookings</a>

                <div class="mh-detail-header">
                    <h1>Booking #BKG-8892A</h1>
                    <div class="mh-detail-actions">
                        <span class="mh-status-active-pill">Active Rental</span>
                        <a href="#" class="btn-dark-download">Download Invoice</a>
                    </div>
                </div>

                <div class="mh-detail-grid">

                    <!-- LEFT COLUMN -->
                    <div class="mh-detail-left">

                        <!-- MACHINE CARD -->
                        <div class="mh-detail-machine-card">
                            <div class="mh-detail-machine-img">
                                <img src="https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?auto=format&fit=crop&w=600&q=80" alt="JCB Excavator" />
                            </div>
                            <div class="mh-detail-machine-info">
                                <h2>JCB 3DX EcoXcellence</h2>
                                <p class="mh-detail-machine-sub">Backhoe Loader • Heavy Duty</p>

                                <div class="mh-detail-specs-grid">
                                    <div class="mh-spec-tag"><span>Model:</span> <strong>2024</strong></div>
                                    <div class="mh-spec-tag"><span>Power:</span> <strong>76 HP</strong></div>
                                    <div class="mh-spec-tag"><span>Weight:</span> <strong>8000 kg</strong></div>
                                    <div class="mh-spec-tag"><span>Fuel:</span> <strong>Diesel</strong></div>
                                </div>

                                <div class="mh-detail-machine-buttons">
                                    <a href="Machines.aspx" class="btn-outline-dark-pill">View Full Specs</a>
                                    <a href="#" class="btn-orange-pill">Extend Rental</a>
                                </div>
                            </div>
                        </div>

                        <!-- RENTAL SCHEDULE CARD -->
                        <div class="mh-detail-schedule-card">
                            <h3>Rental Schedule</h3>

                            <div class="mh-schedule-vertical-timeline">
                                <div class="mh-timeline-step">
                                    <div class="mh-step-dot blue"></div>
                                    <div class="mh-step-info">
                                        <small>START DATE</small>
                                        <strong>12 Oct 2026</strong>
                                        <span>08:00 AM</span>
                                    </div>
                                </div>

                                <div class="mh-timeline-vertical-line"></div>

                                <div class="mh-timeline-step">
                                    <div class="mh-step-dot orange"></div>
                                    <div class="mh-step-info">
                                        <small>END DATE</small>
                                        <strong>26 Oct 2026</strong>
                                        <span>06:00 PM</span>
                                    </div>
                                </div>
                            </div>

                            <div class="mh-schedule-duration-row">
                                <span>Total Duration</span>
                                <strong>14 Days</strong>
                            </div>
                        </div>

                    </div>

                    <!-- RIGHT COLUMN -->
                    <div class="mh-detail-right">

                        <!-- PRICING SUMMARY -->
                        <div class="mh-pricing-summary-card">
                            <h3>Pricing Summary</h3>

                            <div class="mh-price-row-item">
                                <span>Daily Rate ( 2,500 x 14 )</span>
                                <strong>35,000</strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>Service Fee</span>
                                <strong>4,000</strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>Operator Charges</span>
                                <strong>Included</strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>GST (18%)</span>
                                <strong>6,000</strong>
                            </div>

                            <div class="mh-price-total-box">
                                <span>Total Cost</span>
                                <strong>45,000</strong>
                            </div>

                            <div class="mh-paid-badge-box">
                                Paid via Corporate Account on 10 Oct
                            </div>
                        </div>

                        <!-- SUPPORT CARD -->
                        <div class="mh-active-support-card">
                            <p>Our support team is available 24/7 for active rentals.</p>
                            <a href="Contact.aspx" class="btn-white-support">Contact Support</a>
                        </div>

                    </div>

                </div>
            </div>
        </section>

        <!-- FOOTER -->
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
                            <li><a href="Default.aspx">How it Works</a></li>
                            <li><a href="Machines.aspx">Pricing</a></li>
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