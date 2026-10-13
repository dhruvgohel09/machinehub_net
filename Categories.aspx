<%@ Page Title="Categories" Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="machinehub.Categories" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Categories - MachineHub</title>
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
                    <li><a href="Categories.aspx" class="active">Categories</a></li>
                    <li><a href="MyBookings.aspx">My Bookings</a></li>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
                <div class="mh-actions-light">
                    <a href="Login.aspx" class="mh-login-link">Login</a>
                    <a href="Register.aspx" class="mh-register-btn">Register</a>
                </div>
            </div>
        </nav>

        <section class="mh-list-section">
            <div class="container">

                <div class="mh-list-header">
                    <div>
                        <h1>Equipment Categories</h1>
                        <p>Browse our comprehensive catalog of heavy machinery. From precision earthmoving to high-reach aerial lifts, find the exact equipment your project demands.</p>
                    </div>
                    <div class="mh-cat-search">
                        <input type="text" placeholder="Search categories..." />
                    </div>
                </div>

                <div class="mh-cat-grid-2">

                    <div class="mh-cat-large">
                        <img src="https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?w=1000&q=80" alt="JCB" />
                        <div class="mh-cat-overlay-dark">
                            <span class="mh-cat-tag">FEATURED FLEET</span>
                            <h2>JCB Equipment</h2>
                            <p>Premium telehandlers, backhoes, and specialized JCB machinery for versatile site operations.</p>
                            <span class="mh-cat-count">42 Machines</span>
                        </div>
                    </div>

                    <div class="mh-cat-card-md">
                        <img src="https://images.unsplash.com/photo-1541888946425-d0fbb18086f6?w=600&q=80" alt="Excavators" />
                        <div class="mh-cat-overlay-dark">
                            <h3>Excavators</h3>
                            <p>Mini to Large-Scale</p>
                            <span class="mh-cat-count-sm">128 Available</span>
                        </div>
                    </div>

                    <div class="mh-cat-card-md">
                        <img src="https://images.unsplash.com/photo-1578575437130-527eed3abbec?w=600&q=80" alt="Earthmoving" />
                        <div class="mh-cat-overlay-dark">
                            <h3>Earthmoving</h3>
                            <p>Dozers &amp; Graders</p>
                            <span class="mh-cat-count-sm">85 Available</span>
                        </div>
                    </div>

                    <div class="mh-cat-card-lg">
                        <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=600&q=80" alt="Aerial Lifts" />
                        <div class="mh-cat-overlay-dark">
                            <span class="mh-cat-tag-orange">HIGH DEMAND</span>
                            <h3>Aerial Lifts</h3>
                            <p>Scissor lifts, boom lifts, and vertical mast lifts for safe high-reach operations.</p>
                            <span class="mh-cat-count-sm">156 units</span>
                            <a href="Machines.aspx" class="mh-cat-browse">Browse</a>
                        </div>
                    </div>

                    <div class="mh-cat-card-md">
                        <img src="https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=600&q=80" alt="Material Handling" />
                        <div class="mh-cat-overlay-dark">
                            <h3>Material Handling</h3>
                            <p>Forklifts &amp; Jacks</p>
                            <span class="mh-cat-count-sm">210 Available</span>
                        </div>
                    </div>

                    <div class="mh-cat-card-md">
                        <img src="https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=600&q=80" alt="Cranes" />
                        <div class="mh-cat-overlay-dark">
                            <h3>Cranes</h3>
                            <p>Tower &amp; Mobile</p>
                            <span class="mh-cat-count-sm">18 Available</span>
                        </div>
                    </div>

                    <div class="mh-cat-card-md">
                        <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600&q=80" alt="Dump Trucks" />
                        <div class="mh-cat-overlay-dark">
                            <h3>Dump Trucks</h3>
                            <p>Articulated &amp; Rigid</p>
                            <span class="mh-cat-count-sm">64 Available</span>
                        </div>
                    </div>

                </div>

                <div class="mh-cat-wide">
                    <img src="https://images.unsplash.com/photo-1589939705384-5185137a7f0f?w=1400&q=80" alt="Compaction" />
                    <div class="mh-cat-overlay-dark">
                        <h3>Compaction Equipment</h3>
                        <p>Rollers &amp; Tampers</p>
                        <span class="mh-cat-count-sm">48 Available</span>
                    </div>
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