<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="machinehub.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ============================================
         HERO SECTION (Light background with faded construction imagery)
         ============================================ -->
    <section class="mh-ab-hero">
        <div class="container">
            <h1>Building the Future of Industry</h1>
            <p>We provide the heavy machinery that powers modern construction, logistics, and manufacturing operations worldwide.</p>
        </div>
    </section>

    <!-- ============================================
         MISSION & STATS SECTION
         ============================================ -->
    <section class="mh-ab-main">
        <div class="container mh-ab-grid">
            <div class="mh-ab-card mission-card">
                <div class="mh-mission-title-row">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <circle cx="12" cy="12" r="6"></circle>
                        <circle cx="12" cy="12" r="2"></circle>
                    </svg>
                    <h3>Our Mission</h3>
                </div>
                <p>At MachineHub, we believe that access to professional-grade equipment should be seamless and reliable. Our platform connects ambitious projects with the high-performance machinery they require, reducing downtime and accelerating progress. We are dedicated to maintaining a fleet that meets the highest standards of safety and efficiency, ensuring that our partners can build with confidence.</p>
            </div>
            <div class="mh-ab-stats-col">
                <div class="mh-ab-stat dark">
                    <b>15k+</b>
                    <small>ACTIVE RENTALS</small>
                </div>
                <div class="mh-ab-stat">
                    <b>500+</b>
                    <small>EQUIPMENT TYPES</small>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================
         CORE PRINCIPLES SECTION
         ============================================ -->
    <section class="mh-ab-principles">
        <div class="container">
            <h2>Core Principles</h2>
            <div class="mh-ab-three">
                <!-- Principle 1: Uncompromising Reliability (Orange) -->
                <div class="mh-ab-card principle-card top-o">
                    <div class="mh-principle-icon">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#F97316" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                        </svg>
                    </div>
                    <h4>Uncompromising Reliability</h4>
                    <p>Every machine undergoes rigorous multi-point inspections before and after each deployment. We guarantee performance so you can focus on the job.</p>
                </div>

                <!-- Principle 2: Operational Agility (Dark Navy) -->
                <div class="mh-ab-card principle-card top-k">
                    <div class="mh-principle-icon">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#0F172A" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="m12 14 4-4"></path>
                            <path d="M3.34 19a10 10 0 1 1 17.32 0"></path>
                        </svg>
                    </div>
                    <h4>Operational Agility</h4>
                    <p>Time is critical. Our streamlined digital booking and logistics network ensures equipment arrives on-site precisely when needed.</p>
                </div>

                <!-- Principle 3: Sustainable Growth (Green) -->
                <div class="mh-ab-card principle-card top-g">
                    <div class="mh-principle-icon">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#10B981" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z"></path>
                            <path d="M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12"></path>
                        </svg>
                    </div>
                    <h4>Sustainable Growth</h4>
                    <p>We are modernizing the fleet with electric and hybrid options, minimizing the environmental footprint of heavy industry operations.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
