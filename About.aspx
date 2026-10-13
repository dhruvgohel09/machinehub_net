<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="machinehub.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HERO -->
    <section class="mh-ab-hero">
        <div class="container">
            <h1>Building the Future of Industry</h1>
            <p>We provide the heavy machinery that powers modern construction, logistics, and manufacturing operations worldwide.</p>
        </div>
    </section>

    <!-- MISSION & STATS -->
    <section class="mh-ab-main">
        <div class="container mh-ab-grid">
            <div class="mh-ab-card mission-card">
                <h3>Our Mission</h3>
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

    <!-- CORE PRINCIPLES -->
    <section class="mh-ab-principles">
        <div class="container">
            <h2>Core Principles</h2>
            <div class="mh-ab-three">
                <div class="mh-ab-card top-o">
                    <h4>Uncompromising Reliability</h4>
                    <p>Every machine undergoes rigorous multi-point inspections before and after each deployment. We guarantee performance so you can focus on the job.</p>
                </div>
                <div class="mh-ab-card top-k">
                    <h4>Operational Agility</h4>
                    <p>Time is critical. Our streamlined digital booking and logistics network ensures equipment arrives on-site precisely when needed.</p>
                </div>
                <div class="mh-ab-card top-g">
                    <h4>Sustainable Growth</h4>
                    <p>We are modernizing the fleet with electric and hybrid options, minimizing the environmental footprint of heavy industry operations.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
