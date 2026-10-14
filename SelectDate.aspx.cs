using System;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 1 of Booking Flow:
    /// Select Rental Dates & Times.
    /// Allows interactive date range picking (e.g. Oct 14 - Oct 18), 
    /// pick-up / return time dropdowns, dynamic pricing breakdown, 
    /// and securely stores the selection in Session for Step 2 (BookingForm.aspx).
    /// </summary>
    public partial class SelectDate : Page
    {
        // Public properties exposed to ASPX markup
        public string MachineName { get; set; } = "JCB 3DX Backhoe";
        public string MachineCategory { get; set; } = "Earthmoving";
        public string DailyRateText { get; set; } = "4,500 / day";
        public string MachineImage { get; set; } = "https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=400&q=80";

        /// <summary>
        /// Page Load Handler:
        /// Ensures user authentication and loads selected equipment information.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Must be authenticated to book equipment
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Load machine query parameter
            if (!IsPostBack)
            {
                string machine = Request.QueryString["machine"];
                if (machine == "CAT320")
                {
                    MachineName = "Caterpillar 320 Excavator";
                    MachineCategory = "Heavy Machinery";
                    DailyRateText = "9,000 / day";
                    MachineImage = "https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=400&q=80";
                }
            }
        }

        /// <summary>
        /// Continue to Step 2 Handler:
        /// Gathers selected calendar dates, duration, calculated fees, and times,
        /// writes them into ASP.NET Session, and redirects to BookingForm.aspx.
        /// </summary>
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            // Fallback values from hidden fields
            string dates = string.IsNullOrEmpty(hdnSelectedDates.Value) ? "Oct 14 - Oct 18, 2026" : hdnSelectedDates.Value;
            string duration = string.IsNullOrEmpty(hdnDuration.Value) ? "5 Days" : hdnDuration.Value;
            string rentalCost = string.IsNullOrEmpty(hdnRentalCost.Value) ? "22,500" : hdnRentalCost.Value;
            string deliveryFee = string.IsNullOrEmpty(hdnDeliveryFee.Value) ? "1,200" : hdnDeliveryFee.Value;
            string taxes = string.IsNullOrEmpty(hdnTaxes.Value) ? "4,266" : hdnTaxes.Value;
            string total = string.IsNullOrEmpty(hdnTotal.Value) ? "27,966" : hdnTotal.Value;

            // Save rental parameters into ASP.NET Session
            Session["BookingDates"] = dates;
            Session["BookingDuration"] = duration;
            Session["BookingPickupTime"] = ddlPickupTime.SelectedValue;
            Session["BookingReturnTime"] = ddlReturnTime.SelectedValue;
            Session["BookingMachine"] = MachineName;
            Session["BookingCategory"] = MachineCategory;
            Session["BookingRentalFee"] = rentalCost;
            Session["BookingDelivery"] = deliveryFee;
            Session["BookingTaxes"] = taxes;
            Session["BookingTotal"] = total;

            // Advance to Step 2: Delivery & Customer Details
            Response.Redirect("BookingForm.aspx");
        }
    }
}
