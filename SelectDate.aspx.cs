using System;
using System.Data;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 1 of Booking Flow: Select Rental Dates and Times.
    /// Loads machine info from MachineHubDB by query-string parameter,
    /// stores selection in Session, and forwards to Step 2 (BookingForm.aspx).
    /// </summary>
    public partial class SelectDate : Page
    {
        // Public properties exposed to ASPX markup
        public string MachineName    { get; set; } = "JCB 3DX Backhoe";
        public string MachineCategory{ get; set; } = "Earthmoving";
        public string DailyRateText  { get; set; } = "4,500 / day";
        public string MachineImage   { get; set; } = "https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=400&q=80";

        // Track the resolved DB machine ID for session storage
        private string _machineId = "";

        /// <summary>Page Load — loads selected machine from DB.</summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            if (!IsPostBack)
            {
                string machine = Request.QueryString["machine"];

                // ✅ Map query-string shorthand to DB MachineId
                string dbMachineId = null;
                if      (machine == "CAT320")   dbMachineId = "CAT-320";
                else if (machine == "PC210LC")   dbMachineId = "KOM-210";
                else if (machine == "JCB220X")   dbMachineId = "JCB-220";
                else if (machine == "HIT210")    dbMachineId = "HIT-210";
                else if (machine == "VOL200")    dbMachineId = "VOL-200";

                if (!string.IsNullOrEmpty(dbMachineId))
                {
                    // ✅ Load machine details from MachineHubDB
                    DataRow m = DbHelper.GetMachineById(dbMachineId);
                    if (m != null)
                    {
                        MachineName     = m["Brand"].ToString() + " " + m["ModelName"].ToString();
                        MachineCategory = m["CategoryName"].ToString();
                        DailyRateText   = "₹" + m["DailyRate"].ToString() + " / day";
                        MachineImage    = m["ImageUrl"].ToString();
                        _machineId      = dbMachineId;

                        // Store machine ID in session for booking creation
                        Session["BookingMachineId"] = dbMachineId;
                    }
                }
                else
                {
                    // Default: CAT-320 (first available)
                    _machineId = "CAT-320";
                    Session["BookingMachineId"] = "CAT-320";
                }
            }
            else
            {
                // On postback, restore machine ID from session
                _machineId = Session["BookingMachineId"] as string ?? "CAT-320";
            }
        }

        /// <summary>
        /// Continue to Step 2 Handler:
        /// Gathers selected dates, calculates fees, stores in Session.
        /// </summary>
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string dates      = string.IsNullOrEmpty(hdnSelectedDates.Value) ? "Oct 14 - Oct 18, 2026" : hdnSelectedDates.Value;
            string duration   = string.IsNullOrEmpty(hdnDuration.Value)      ? "5 Days"                 : hdnDuration.Value;
            string rentalCost = string.IsNullOrEmpty(hdnRentalCost.Value)    ? "22,500"                 : hdnRentalCost.Value;
            string deliveryFee= string.IsNullOrEmpty(hdnDeliveryFee.Value)   ? "1,200"                  : hdnDeliveryFee.Value;
            string taxes      = string.IsNullOrEmpty(hdnTaxes.Value)         ? "4,266"                  : hdnTaxes.Value;
            string total      = string.IsNullOrEmpty(hdnTotal.Value)         ? "27,966"                 : hdnTotal.Value;

            // Save rental parameters into ASP.NET Session
            Session["BookingDates"]       = dates;
            Session["BookingDuration"]    = duration;
            Session["BookingPickupTime"]  = ddlPickupTime.SelectedValue;
            Session["BookingReturnTime"]  = ddlReturnTime.SelectedValue;
            Session["BookingMachine"]     = MachineName;
            Session["BookingCategory"]    = MachineCategory;
            Session["BookingRentalFee"]   = rentalCost;
            Session["BookingDelivery"]    = deliveryFee;
            Session["BookingTaxes"]       = taxes;
            Session["BookingTotal"]       = total;
            // ✅ Machine ID for DB booking creation in Step 3
            if (!string.IsNullOrEmpty(_machineId))
                Session["BookingMachineId"] = _machineId;

            Response.Redirect("BookingForm.aspx");
        }
    }
}
