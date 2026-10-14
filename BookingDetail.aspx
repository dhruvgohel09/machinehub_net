<%@ Page Title="Booking Detail" Language="C#" AutoEventWireup="true" CodeBehind="BookingDetail.aspx.cs" Inherits="machinehub.BookingDetail" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking Detail - MachineHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body class="mh-booking-detail-body">
    <form id="form1" runat="server">

        <!-- NAVBAR -->
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
                    <a href="Settings.aspx" class="mh-nav-avatar" title="Account">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <circle cx="12" cy="10" r="3"></circle>
                            <path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path>
                        </svg>
                    </a>
                </div>
            </div>
        </nav>

        <!-- MAIN DETAIL SECTION -->
        <section class="mh-detail-section">
            <div class="container">

                <a href="MyBookings.aspx" class="mh-back-link">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="19" y1="12" x2="5" y2="12"></line>
                        <polyline points="12 19 5 12 12 5"></polyline>
                    </svg>
                    Back to My Bookings
                </a>

                <div class="mh-detail-header">
                    <h1>Booking <%= BookingId %></h1>
                    <div class="mh-detail-actions">
                        <span class="mh-status-active-pill"><span class="badge-dot" style="color:#10B981; margin-right:4px;">●</span> Active Rental</span>
                        <a href="javascript:void(0)" onclick="downloadInvoicePDF()" class="btn-dark-download" title="Download Official Invoice">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="margin-right:6px; vertical-align:-1px;">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                            Download Invoice
                        </a>
                    </div>
                </div>

                <div class="mh-detail-grid">

                    <!-- LEFT COLUMN -->
                    <div class="mh-detail-left">

                        <!-- MACHINE CARD -->
                        <div class="mh-detail-machine-card">
                            <div class="mh-detail-machine-img">
                                <img src="<%= MachineImage %>" alt="<%= MachineName %>" />
                            </div>
                            <div class="mh-detail-machine-info">
                                <h2><%= MachineName %></h2>
                                <p class="mh-detail-machine-sub"><%= MachineCategory %></p>

                                <div class="mh-detail-specs-grid">
                                    <div class="mh-spec-tag">
                                        <span>
                                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#64748B" stroke-width="2" style="margin-right:4px; vertical-align:-1px;">
                                                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                                            </svg>
                                            Model:
                                        </span>
                                        <strong>2024</strong>
                                    </div>
                                    <div class="mh-spec-tag">
                                        <span>
                                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#64748B" stroke-width="2" style="margin-right:4px; vertical-align:-1px;">
                                                <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                            </svg>
                                            Power:
                                        </span>
                                        <strong>76 HP</strong>
                                    </div>
                                    <div class="mh-spec-tag">
                                        <span>
                                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#64748B" stroke-width="2" style="margin-right:4px; vertical-align:-1px;">
                                                <rect x="3" y="6" width="18" height="15" rx="2"></rect>
                                                <path d="M16 6V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"></path>
                                            </svg>
                                            Weight:
                                        </span>
                                        <strong>8000 kg</strong>
                                    </div>
                                    <div class="mh-spec-tag">
                                        <span>
                                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#64748B" stroke-width="2" style="margin-right:4px; vertical-align:-1px;">
                                                <circle cx="12" cy="12" r="3"></circle>
                                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                                            </svg>
                                            Fuel:
                                        </span>
                                        <strong>Diesel</strong>
                                    </div>
                                </div>

                                <div class="mh-detail-machine-buttons">
                                    <a href="Machines.aspx" class="btn-outline-dark-pill">View Full Specs</a>
                                    <a href="#" class="btn-orange-pill">Extend Rental</a>
                                </div>
                            </div>
                        </div>

                        <!-- RENTAL SCHEDULE CARD -->
                        <div class="mh-detail-schedule-card">
                            <h3>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                Rental Schedule
                            </h3>

                            <div class="mh-schedule-vertical-timeline">
                                <div class="mh-timeline-step">
                                    <div class="mh-step-dot blue"></div>
                                    <div class="mh-step-info">
                                        <small>START DATE</small>
                                        <strong><%= StartDateText %></strong>
                                        <span>08:00 AM</span>
                                    </div>
                                </div>

                                <div class="mh-timeline-vertical-line"></div>

                                <div class="mh-timeline-step">
                                    <div class="mh-step-dot orange"></div>
                                    <div class="mh-step-info">
                                        <small>END DATE</small>
                                        <strong><%= EndDateText %></strong>
                                        <span>06:00 PM</span>
                                    </div>
                                </div>
                            </div>

                            <div class="mh-schedule-duration-row">
                                <span>Total Duration</span>
                                <strong><%= BookingDuration %></strong>
                            </div>
                        </div>

                    </div>

                    <!-- RIGHT COLUMN -->
                    <div class="mh-detail-right">

                        <!-- PRICING SUMMARY -->
                        <div class="mh-pricing-summary-card">
                            <h3>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="4" y="2" width="16" height="20" rx="2"></rect>
                                    <line x1="8" y1="6" x2="16" y2="6"></line>
                                    <line x1="8" y1="10" x2="16" y2="10"></line>
                                    <line x1="8" y1="14" x2="12" y2="14"></line>
                                </svg>
                                Pricing Summary
                            </h3>

                            <div class="mh-price-row-item">
                                <span>Daily Rate ( 2,500 x 14 )</span>
                                <strong><%= RentalFee %></strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>Service Fee</span>
                                <strong><%= DeliveryFee %></strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>Operator Charges</span>
                                <strong><%= OperatorFee %></strong>
                            </div>
                            <div class="mh-price-row-item">
                                <span>GST (18%)</span>
                                <strong><%= TaxAmount %></strong>
                            </div>

                            <div class="mh-price-total-box">
                                <span>Total Cost</span>
                                <strong><%= TotalAmount %></strong>
                            </div>

                            <div class="mh-paid-badge-box">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#0F172A" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" style="flex-shrink:0;">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="16 9 10 15 7 12"></polyline>
                                </svg>
                                <span><%= PaidText %></span>
                            </div>
                        </div>

                        <!-- SUPPORT CARD -->
                        <div class="mh-active-support-card">
                            <div class="mh-support-icon-wrap">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M3 18v-6a9 9 0 0 1 18 0v6"></path>
                                    <path d="M21 19a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-3a2 2 0 0 1 2-2h3zM3 19a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H3z"></path>
                                </svg>
                            </div>
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

    <!-- INVOICE DOWNLOAD & PRINT -->
    <script>
        function downloadInvoicePDF() {
            window.print();
        }
    </script>
</body>
</html>