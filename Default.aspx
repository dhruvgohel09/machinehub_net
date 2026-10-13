<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="machinehub._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ============================================
         HERO SECTION
         ============================================ -->
    <section class="mh-hero">
        <div class="container">
            <div class="mh-hero-left">
                <h1>Rent<br />Construction<br /><span>Equipment</span><br />Easily</h1>
                <p>Access a premium fleet of heavy machinery. From excavators to aerial lifts, get the reliable gear you need for your next big project, delivered on time.</p>

                <div class="mh-search">
                    <input type="text" placeholder="What equipment do you need?" />
                    <button type="button" class="btn-search-orange">Find Equipment</button>
                </div>

                <div class="mh-trust-hero">
                    <div class="mh-trust-pill">500+ Machines</div>
                    <div class="mh-trust-pill">Flexible Terms</div>
                    <div class="mh-trust-pill">Site Delivery</div>
                </div>
            </div>

            <div class="mh-hero-img">
                <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=1000&q=80"
                     alt="JCB Backhoe Loader on Construction Site" />
            </div>
        </div>
    </section>

    <!-- ============================================
         CATEGORIES SECTION
         ============================================ -->
    <section class="mh-section gray">
        <div class="container">
            <div class="mh-section-head">
                <div>
                    <h2>Browse by Category</h2>
                    <p>Find the right tool for every stage of your project.</p>
                </div>
                <a href="Categories.aspx" class="mh-view-all">View All Categories</a>
            </div>

            <div class="mh-categories">
                <!-- Large Card - Earthmoving (Excavator) -->
                <a href="Categories.aspx?cat=earthmoving" class="mh-cat-card large">
                    <img src="https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=800&q=80"
                         alt="Earthmoving Equipment - Yellow Excavator" />
                    <div class="mh-cat-overlay">
                        <h3>Earthmoving</h3>
                        <p>Excavators, Dozers, Loaders</p>
                    </div>
                </a>

                <!-- Aerial Lifts (Boom Lift) -->
                <a href="Categories.aspx?cat=aerial" class="mh-cat-card">
                    <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80"
                         alt="Aerial Lifts - Boom Lift and Scissor Lift" />
                    <div class="mh-cat-overlay">
                        <h3>Aerial Lifts</h3>
                        <p>Boom Lifts, Scissor Lifts</p>
                    </div>
                </a>

                <!-- Material Handling (Forklift) -->
                <a href="Categories.aspx?cat=material" class="mh-cat-card">
                    <img src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&w=600&q=80"
                         alt="Material Handling - Forklift in Warehouse" />
                    <div class="mh-cat-overlay">
                        <h3>Material Handling</h3>
                        <p>Forklifts, Telehandlers</p>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- ============================================
         FEATURED EQUIPMENT SECTION
         ============================================ -->
    <section class="mh-section">
        <div class="container">
            <div class="mh-section-head center">
                <div>
                    <h2>Featured Equipment</h2>
                    <p>Top-rated machines available for immediate dispatch.</p>
                </div>
            </div>

            <div class="mh-machines">
                <!-- Machine 1 - Excavator -->
                <div class="mh-machine-card">
                    <span class="mh-badge available">AVAILABLE</span>
                    <div class="mh-card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=600&q=80"
                             class="mh-machine-img"
                             alt="320 GC Excavator" />
                    </div>
                    <h3>320 GC Excavator</h3>
                    <div class="mh-specs">
                        <div class="mh-spec"><span>Operating Weight:</span><span>48,300 lbs</span></div>
                        <div class="mh-spec"><span>Max Dig Depth:</span><span>22' 0"</span></div>
                    </div>
                    <div class="mh-price-row">
                        <div class="mh-price">
                            <small>Rental Rate</small>
                            <strong>28,000<small>/Day</small></strong>
                        </div>
                        <a href="Machines.aspx" class="btn-rent">Rent Now</a>
                    </div>
                </div>

                <!-- Machine 2 - JCB Backhoe -->
                <div class="mh-machine-card">
                    <span class="mh-badge available">AVAILABLE</span>
                    <div class="mh-card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80"
                             class="mh-machine-img"
                             alt="JCB 3CX Backhoe Loader" />
                    </div>
                    <h3>3CX Backhoe Loader</h3>
                    <div class="mh-specs">
                        <div class="mh-spec"><span>Engine Power:</span><span>74 hp</span></div>
                        <div class="mh-spec"><span>Dig Depth:</span><span>14' 7"</span></div>
                    </div>
                    <div class="mh-price-row">
                        <div class="mh-price">
                            <small>Rental Rate</small>
                            <strong>22,000<small>/Day</small></strong>
                        </div>
                        <a href="Machines.aspx" class="btn-rent">Rent Now</a>
                    </div>
                </div>

                <!-- Machine 3 - Crane -->
                <div class="mh-machine-card">
                    <span class="mh-badge in-transit">IN-TRANSIT</span>
                    <div class="mh-card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1504307651254-35680f356dfd?auto=format&fit=crop&w=600&q=80"
                             class="mh-machine-img"
                             alt="RT540E Rough Terrain Crane" />
                    </div>
                    <h3>RT540E Rough Terrain Crane</h3>
                    <div class="mh-specs">
                        <div class="mh-spec"><span>Max Capacity:</span><span>40 tons</span></div>
                        <div class="mh-spec"><span>Boom Length:</span><span>102 ft</span></div>
                    </div>
                    <div class="mh-price-row">
                        <div class="mh-price">
                            <small>Rental Rate</small>
                            <strong>68,000<small>/Day</small></strong>
                        </div>
                        <button class="btn-rent disabled" disabled>Unavailable</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================
         HOW IT WORKS SECTION
         ============================================ -->
    <section class="mh-how">
        <div class="container">
            <div class="mh-how-head">
                <h2>How it Works</h2>
                <p>A streamlined process designed for operational efficiency.</p>
            </div>

            <div class="mh-steps">
                <div class="mh-step">
                    <div class="mh-step-icon">01</div>
                    <h3>1. Search</h3>
                    <p>Find required machinery by location and category.</p>
                </div>
                <div class="mh-step">
                    <div class="mh-step-icon">02</div>
                    <h3>2. Select</h3>
                    <p>Verify technical details and pricing instantly.</p>
                </div>
                <div class="mh-step">
                    <div class="mh-step-icon">03</div>
                    <h3>3. Book</h3>
                    <p>Select dates and secure your rental online.</p>
                </div>
                <div class="mh-step">
                    <div class="mh-step-icon">04</div>
                    <h3>4. Deploy</h3>
                    <p>Equipment arrives at your site, ready to work.</p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>