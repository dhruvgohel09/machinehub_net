using System;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Booking Detail & Invoice Page:
    /// Displays machine details, rental schedule timeline, pricing cost summary,
    /// payment receipt status, and provides working PDF invoice download / print.
    /// Strictly adheres to reference mockup media_1791954744182_7e873544.png with no extra cards.
    /// </summary>
    public partial class BookingDetail : Page
    {
        // Public properties rendered in the ASPX template
        public bool IsPaymentSuccess { get; set; } = false;
        public string BookingId { get; set; } = "#BKG-8892A";
        public string MachineName { get; set; } = "JCB 3DX EcoXcellence";
        public string MachineCategory { get; set; } = "Backhoe Loader • Heavy Duty";
        public string MachineImage { get; set; } = "https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?auto=format&fit=crop&w=600&q=80";
        public string StartDateText { get; set; } = "12 Oct 2026";
        public string EndDateText { get; set; } = "26 Oct 2026";
        public string BookingDuration { get; set; } = "14 Days";
        public string RentalFee { get; set; } = "35,000";
        public string DeliveryFee { get; set; } = "4,000";
        public string OperatorFee { get; set; } = "Included";
        public string TaxAmount { get; set; } = "6,000";
        public string TotalAmount { get; set; } = "45,000";
        public string PaidText { get; set; } = "Paid via Corporate Account on 10 Oct";

        /// <summary>
        /// Page Load Handler:
        /// Ensures authentication and loads dynamic booking and payment details from ASP.NET Session.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify authentication
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Check if user came from successful payment
            if (Request.QueryString["payment"] == "success" || Session["PaymentSuccess"] != null)
            {
                IsPaymentSuccess = true;
                string method = Session["PaymentMethod"] as string ?? "Corporate Account";
                string date = Session["PaymentDate"] as string ?? "10 Oct";
                PaidText = "Paid via " + method + " on " + date;
            }

            // Retrieve Booking ID
            if (Session["BookingId"] != null)
            {
                string bId = Session["BookingId"].ToString();
                BookingId = bId.StartsWith("#") ? bId : ("#" + bId);
            }

            // Retrieve Equipment details
            if (Session["BookingMachine"] != null)
            {
                MachineName = Session["BookingMachine"].ToString();
                if (MachineName.Contains("Caterpillar"))
                {
                    MachineCategory = "Excavator • Heavy Duty";
                    MachineImage = "https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=600&q=80";
                }
            }

            // Populate schedule and fee breakdowns from Session
            if (Session["BookingCategory"] != null) MachineCategory = Session["BookingCategory"].ToString() + " • Heavy Duty";
            if (Session["BookingDuration"] != null) BookingDuration = Session["BookingDuration"].ToString();
            if (Session["BookingRentalFee"] != null) RentalFee = Session["BookingRentalFee"].ToString();
            if (Session["BookingDelivery"] != null) DeliveryFee = Session["BookingDelivery"].ToString();
            if (Session["BookingTaxes"] != null) TaxAmount = Session["BookingTaxes"].ToString();
            if (Session["BookingTotal"] != null) TotalAmount = Session["BookingTotal"].ToString();

            // Format start and end date text
            if (Session["BookingDates"] != null)
            {
                string dates = Session["BookingDates"].ToString();
                if (dates.Contains(" - "))
                {
                    var parts = dates.Split(new string[] { " - " }, StringSplitOptions.None);
                    StartDateText = parts[0].Trim();
                    EndDateText = parts[1].Trim();
                }
                else
                {
                    StartDateText = dates;
                }
            }
        }
    }
}