0<%@ Page Title="Equipment" Language="C#" AutoEventWireup="true" CodeBehind="Machines.aspx.cs" Inherits="machinehub.Machines" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Heavy Equipment - MachineHub</title>
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
                    <li><a href="Machines.aspx" class="active">Equipment</a></li>
                    <li><a href="Categories.aspx">Categories</a></li>
                    <li><a href="MyBookings.aspx">My Bookings</a></li>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
                <div class="mh-actions-light">
                    <a href="Login.aspx" class="mh-login-link">Login</a>
                    <a href="Register.aspx" class="mh-register-btn">Register</a>
                </div>
<%--                hgvfcghh--%>
            </div>
        </nav>

        <section class="mh-list-section">
            <div class="container">

                <div class="mh-list-header">
                    <div>
                        <h1>Heavy Equipment</h1>
                        <p>Showing 24 available excavators</p>
                    </div>
                    <div class="mh-sort-wrap">
                        <label>Sort by:</label>
                        <select class="mh-sort-select">
                            <option>Recommended</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                        </select>
                        <div class="mh-view-toggle">
                            <button type="button" class="active">▦</button>
                            <button type="button">☰</button>
                        </div>
                    </div>
                </div>

                <div class="mh-eq-grid">

                    <div class="mh-eq-card-featured">
                        <div class="mh-eq-img-wrap">
                            <span class="mh-badge-available">Available</span>
                            <span class="mh-badge-featured">Featured</span>
                            <img src="https://www.magnific.com/free-photos-vectors/excavator-ai" alt="Excavator" />
                            <div class="mh-eq-brand-label">CATERPILLAR</div>
                            <div class="mh-eq-name-overlay">320 Hydraulic Excavator</div>
                        </div>

                        <div class="mh-eq-specs-row">
                            <div class="mh-eq-spec">
                                <div><small>Operating Weight</small><strong>22,500 kg</strong></div>
                            </div>
                            <div class="mh-eq-spec">
                                <div><small>Engine Power</small><strong>172 HP</strong></div>
                            </div>
                            <div class="mh-eq-spec">
                                <div><small>Year Model</small><strong>2023</strong></div>
                            </div>
                            <div class="mh-eq-spec">
                                <div><small>Location</small><strong>Mumbai Depot</strong></div>
                            </div>
                        </div>

                        <p class="mh-eq-desc">Next generation excavator delivering premium performance with integrated Cat GRADE with 2D, Grade Assist, and Payload...</p>

                        <div class="mh-eq-price-row">
                            <div>
                                <small>Daily Rate</small>
                                <div class="mh-eq-price">28,000<small>/day</small></div>
                            </div>
                            <div class="mh-eq-buttons">
                                <a href="BookingDetail.aspx" class="btn-outline-dark">More Details</a>
                                <a href="BookingDetail.aspx" class="btn-orange">Rent Now</a>
                            </div>
                        </div>
                    </div>

                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-available">Available</span>
                            <img src="https://images.unsplash.com/photo-1578575437130-527eed3abbec?w=500&q=80" alt="Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">KOMATSU</div>
                            <h3>PC210LC-11</h3>
                            <div class="mh-eq-specs-sm">
                                <span>22.1t</span>
                                <span>165 HP</span>
                            </div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>14,500</strong><small>/day</small></div>
                                <a href="BookingDetail.aspx" class="btn-orange-sm">Rent</a>
                            </div>
                        </div>
                    </div>

                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-maintenance">Maintenance</span>
                            <img src="https://images.unsplash.com/photo-1589939705384-5185137a7f0f?w=500&q=80" alt="Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">VOLVO CE</div>
                            <h3>EC200E Crawler</h3>
                            <div class="mh-eq-specs-sm">
                                <span>20.3t</span>
                                <span>154 HP</span>
                            </div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>13,000</strong><small>/day</small></div>
                                <button class="btn-disabled-sm" disabled>Unavailable</button>
                            </div>
                        </div>
                    </div>

                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-available">Available</span>
                            <img src="https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?w=500&q=80" alt="Backhoe" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">JCB</div>
                            <h3>220X Tracked</h3>
                            <div class="mh-eq-specs-sm">
                                <span>22.7t</span>
                                <span>173 HP</span>
                            </div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>15,200</strong><small>/day</small></div>
                                <a href="BookingDetail.aspx" class="btn-orange-sm">Rent</a>
                            </div>
                        </div>
                    </div>

                    <div class="mh-eq-card-small">
                        <div class="mh-eq-img-wrap-sm">
                            <span class="mh-badge-rented">Rented</span>
                            <img src="https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500&q=80" alt="Excavator" />
                        </div>
                        <div class="mh-eq-card-body">
                            <div class="mh-eq-brand-sm">HITACHI</div>
                            <h3>ZAXIS210LC-6</h3>
                            <div class="mh-eq-specs-sm">
                                <span>21.5t</span>
                                <span>163 HP</span>
                            </div>
                            <div class="mh-eq-price-row-sm">
                                <div><strong>14,800</strong><small>/day</small></div>
                                <a href="#" class="btn-outline-dark-sm">Waitlist</a>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="mh-pagination">
                    <button type="button" class="mh-page-btn">..</button>
                    <button type="button" class="mh-page-btn active">1</button>
                    <button type="button" class="mh-page-btn">2</button>
                    <button type="button" class="mh-page-btn">3</button>
                    <span class="mh-page-dots">...</span>
                    <button type="button" class="mh-page-btn">8</button>
                    <button type="button" class="mh-page-btn">></button>
                </div>

            </div>
        </section>

        <footer class="mh-footer-4col">
            <div class="container">
                <div class="mh-footer-4col-grid">
                    <div class="mh-footer-brand-col">
                        <div class="brand">Machine<span>Hub</span></div>
                        <p>Industrial Strength Rental Management for modern construction operations.</p>
                    </div>
                    <div>
                        <h4>LEGAL</h4>
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Service</a></li>
                            <li><a href="#">Cookie Policy</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4>COMPANY</h4>
                        <ul>
                            <li><a href="About.aspx">About Us</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="Contact.aspx">Contact</a></li>
                        </ul>
                    </div>
                    <div>
                        <h4>SUPPORT</h4>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Equipment Guide</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mh-footer-4col-bottom">
                    © 2026 MachineHub Industrial. All rights reserved.
                </div>
            </div>
        </footer>

    </form>
</body>
</html>