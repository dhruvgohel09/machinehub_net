<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Machines.aspx.cs" Inherits="machinehub.Machines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-list-section">
        <div class="container">

            <!-- Header + Sort -->
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
                </div>
            </div>

            <!-- ============ EQUIPMENT GRID ============ -->
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
                            <a href="BookingDetail.aspx" class="btn-orange-sm">Rent</a>
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
                            <a href="BookingDetail.aspx" class="btn-orange-sm">Rent</a>
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

            <!-- ============ PAGINATION ============ -->
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

</asp:Content>