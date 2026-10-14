using System;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 4 of Booking Flow:
    /// Booking Confirmation & Success Page.
    /// Displays confirmation green checkmark, generated Booking ID, 
    /// booked equipment name, rental dates, and confirmed total payment amount.
    /// Matches reference screenshot media_1791955059268_809c2b3d.png.
    /// </summary>
    public partial class BookingSuccess : Page
    {
        // Public properties rendered in ASPX expressions
        public string BookingId { get; set; } = "#MH-9982-IN";
        public string EquipmentName { get; set; } = "Caterpillar 320 Excavator";
        public string BookingDates { get; set; } = "Oct 12 - Oct 16, 2026";
        public string TotalAmount { get; set; } = "₹59,000";

        /// <summary>
        /// Page Load Handler:
        /// Ensures authentication and loads confirmed booking parameters from ASP.NET Session.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify user authentication
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Retrieve confirmed booking ID generated during payment
            if (Session["BookingId"] != null)
            {
                string bId = Session["BookingId"].ToString();
                BookingId = bId.StartsWith("#") ? bId : ("#" + bId);
            }

            // Retrieve equipment name
            if (Session["BookingMachine"] != null)
            {
                EquipmentName = Session["BookingMachine"].ToString();
            }

            // Retrieve rental dates
            if (Session["BookingDates"] != null)
            {
                BookingDates = Session["BookingDates"].ToString();
            }

            // Retrieve total paid amount
            if (Session["BookingTotal"] != null)
            {
                string tot = Session["BookingTotal"].ToString();
                TotalAmount = tot.StartsWith("₹") ? tot : ("₹" + tot);
            }
        }
    }
}
