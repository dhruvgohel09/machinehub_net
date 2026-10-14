using System;
using System.Data;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Booking Detail and Invoice Page:
    /// Loads booking and payment info from MachineHubDB by BookingId.
    /// Falls back to Session values when coming directly from Payment step.
    /// </summary>
    public partial class BookingDetail : Page
    {
        // Public properties rendered in the ASPX template
        public bool   IsPaymentSuccess{ get; set; } = false;
        public string BookingId       { get; set; } = "#BKG-8892A";
        public string MachineName     { get; set; } = "JCB 3DX EcoXcellence";
        public string MachineCategory { get; set; } = "Backhoe Loader • Heavy Duty";
        public string MachineImage    { get; set; } = "https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?auto=format&fit=crop&w=600&q=80";
        public string StartDateText   { get; set; } = "12 Oct 2026";
        public string EndDateText     { get; set; } = "26 Oct 2026";
        public string BookingDuration { get; set; } = "14 Days";
        public string RentalFee       { get; set; } = "35,000";
        public string DeliveryFee     { get; set; } = "4,000";
        public string OperatorFee     { get; set; } = "Included";
        public string TaxAmount       { get; set; } = "6,000";
        public string TotalAmount     { get; set; } = "45,000";
        public string PaidText        { get; set; } = "Paid via Corporate Account on 10 Oct";

        /// <summary>Page Load — loads booking from DB or session.</summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Check if coming from a successful payment
            if (Request.QueryString["payment"] == "success" || Session["PaymentSuccess"] != null)
            {
                IsPaymentSuccess = true;
                string method = Session["PaymentMethod"] as string ?? "Corporate Account";
                string date   = Session["PaymentDate"]   as string ?? "10 Oct";
                PaidText = "Paid via " + method + " on " + date;
            }

            // ✅ Try to load booking from MachineHubDB by BookingId
            string sessionBkgId = Session["BookingId"] as string;
            string qsBkgId      = Request.QueryString["id"];
            string resolvedId   = qsBkgId ?? sessionBkgId;

            if (!string.IsNullOrEmpty(resolvedId))
            {
                string cleanId = resolvedId.TrimStart('#');
                DataRow bkg = null;
                try { bkg = DbHelper.GetBookingById(cleanId); } catch { }

                if (bkg != null)
                {
                    // Populate from DB record
                    BookingId       = "#" + bkg["BookingId"].ToString();
                    MachineName     = bkg["EquipmentName"].ToString();
                    MachineCategory = bkg["CategoryName"].ToString() + " • Heavy Duty";

                    // Image from machine row
                    try
                    {
                        DataRow m = DbHelper.GetMachineById(bkg["MachineId"].ToString());
                        if (m != null) MachineImage = m["ImageUrl"].ToString();
                    }
                    catch { }

                    // Dates
                    if (bkg["StartDate"] != DBNull.Value)
                        StartDateText = ((DateTime)bkg["StartDate"]).ToString("dd MMM yyyy");
                    if (bkg["EndDate"] != DBNull.Value)
                        EndDateText = ((DateTime)bkg["EndDate"]).ToString("dd MMM yyyy");
                    if (bkg["DurationDays"] != DBNull.Value)
                        BookingDuration = bkg["DurationDays"].ToString() + " Days";

                    // Fees
                    if (bkg["RentalFee"]   != DBNull.Value) RentalFee   = FormatAmount(bkg["RentalFee"]);
                    if (bkg["DeliveryFee"] != DBNull.Value) DeliveryFee = FormatAmount(bkg["DeliveryFee"]);
                    if (bkg["Taxes"]       != DBNull.Value) TaxAmount   = FormatAmount(bkg["Taxes"]);
                    if (bkg["TotalCost"]   != DBNull.Value) TotalAmount = FormatAmount(bkg["TotalCost"]);
                    return;
                }
            }

            // ---- Fallback: use Session values (e.g., just came from Payment) ----
            if (Session["BookingId"] != null)
            {
                string bId = Session["BookingId"].ToString();
                BookingId = bId.StartsWith("#") ? bId : ("#" + bId);
            }

            if (Session["BookingMachine"] != null)
            {
                MachineName = Session["BookingMachine"].ToString();
                if (MachineName.Contains("Caterpillar"))
                {
                    MachineCategory = "Excavator • Heavy Duty";
                    MachineImage    = "https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=600&q=80";
                }
            }

            if (Session["BookingCategory"] != null) MachineCategory = Session["BookingCategory"].ToString() + " • Heavy Duty";
            if (Session["BookingDuration"] != null) BookingDuration = Session["BookingDuration"].ToString();
            if (Session["BookingRentalFee"]!= null) RentalFee       = Session["BookingRentalFee"].ToString();
            if (Session["BookingDelivery"] != null) DeliveryFee     = Session["BookingDelivery"].ToString();
            if (Session["BookingTaxes"]    != null) TaxAmount       = Session["BookingTaxes"].ToString();
            if (Session["BookingTotal"]    != null) TotalAmount     = Session["BookingTotal"].ToString();

            if (Session["BookingDates"] != null)
            {
                string dates = Session["BookingDates"].ToString();
                if (dates.Contains(" - "))
                {
                    var parts = dates.Split(new[] { " - " }, StringSplitOptions.None);
                    StartDateText = parts[0].Trim();
                    EndDateText   = parts[1].Trim();
                }
                else
                {
                    StartDateText = dates;
                }
            }
        }

        private static string FormatAmount(object val)
        {
            if (val == null || val == DBNull.Value) return "0";
            return string.Format("{0:N0}", val).Replace(",", ",");
        }
    }
}