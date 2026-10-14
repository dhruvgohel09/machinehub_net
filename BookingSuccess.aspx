<%@ Page Title="Booking Successful" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingSuccess.aspx.cs" Inherits="machinehub.BookingSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="mh-success-full-page">
        <div class="container">

            <div class="mh-success-modal-card">

                <!-- Top Checkmark Icon -->
                <div class="mh-success-icon-outer">
                    <div class="mh-success-icon-inner">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </div>
                </div>

                <!-- Headings -->
                <h1 class="mh-success-main-title">Booking Successful!</h1>
                <p class="mh-success-sub-text">Your equipment rental has been confirmed. A confirmation email has been sent to your registered address.</p>

                <!-- Booking Summary Box -->
                <div class="mh-success-summary-box">
                    <h2 class="mh-success-box-head">Booking Summary</h2>

                    <div class="mh-success-box-grid">
                        <div class="mh-success-box-cell">
                            <span class="mh-success-cell-label">Booking ID</span>
                            <strong class="mh-success-cell-val"><%= BookingId %></strong>
                        </div>
                        <div class="mh-success-box-cell">
                            <span class="mh-success-cell-label">Equipment</span>
                            <strong class="mh-success-cell-val"><%= EquipmentName %></strong>
                        </div>
                        <div class="mh-success-box-cell">
                            <span class="mh-success-cell-label">Dates</span>
                            <strong class="mh-success-cell-val"><%= BookingDates %></strong>
                        </div>
                        <div class="mh-success-box-cell">
                            <span class="mh-success-cell-label">Total Amount</span>
                            <strong class="mh-success-cell-val-price"><%= TotalAmount %></strong>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="mh-success-btn-row">
                    <a href="MyBookings.aspx" class="mh-btn-view-bookings">View My Bookings</a>
                    <a href="Default.aspx" class="mh-btn-back-home">Back to Home</a>
                </div>

            </div>

        </div>
    </section>

</asp:Content>
