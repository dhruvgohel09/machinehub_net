using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 2 of Booking Flow: Delivery Address and Customer Details Page.
    /// Captures full name, email, phone, complete delivery address, and project details.
    /// Validates inputs, saves delivery parameters into ASP.NET Session,
    /// creates a Booking record in MachineHubDB, and forwards to Step 3 (Payment.aspx).
    /// </summary>
    public partial class BookingForm : Page
    {
        // Public properties rendered in the booking summary side panel
        public string MachineName    { get; set; } = "JCB 3DX EcoXcellence";
        public string MachineCategory{ get; set; } = "Backhoe Loader";
        public string BookingDates   { get; set; } = "Oct 14 - Oct 18, 2026";
        public string BookingDuration{ get; set; } = "5 Days";
        public string RentalFee      { get; set; } = "22,500";
        public string DeliveryFee    { get; set; } = "1,200";
        public string Taxes          { get; set; } = "4,266";
        public string TotalAmount    { get; set; } = "27,966";

        /// <summary>Page Load Handler — ensures auth and populates summary from Step 1 Session.</summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Retrieve rental details carried from Step 1
            if (Session["BookingMachine"]    != null) MachineName     = Session["BookingMachine"].ToString();
            if (Session["BookingCategory"]   != null) MachineCategory = Session["BookingCategory"].ToString();
            if (Session["BookingDates"]      != null) BookingDates    = Session["BookingDates"].ToString();
            if (Session["BookingDuration"]   != null) BookingDuration = Session["BookingDuration"].ToString();
            if (Session["BookingRentalFee"]  != null) RentalFee       = Session["BookingRentalFee"].ToString();
            if (Session["BookingDelivery"]   != null) DeliveryFee     = Session["BookingDelivery"].ToString();
            if (Session["BookingTaxes"]      != null) Taxes           = Session["BookingTaxes"].ToString();
            if (Session["BookingTotal"]      != null) TotalAmount     = Session["BookingTotal"].ToString();

            if (!IsPostBack)
            {
                // Pre-fill user profile info from session
                string userName = Session["UserName"] as string;
                if (!string.IsNullOrEmpty(userName)) txtFullName.Text = userName;
                if (User.Identity.IsAuthenticated)   txtEmail.Text    = User.Identity.Name;
            }
        }

        /// <summary>Proceed to Payment — validates, saves to DB, redirects to Payment.aspx.</summary>
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string fullName = txtFullName.Text.Trim();
            string email    = txtEmail.Text.Trim();
            string phone    = txtPhone.Text.Trim();
            string street   = txtStreet.Text.Trim();
            string city     = txtCity.Text.Trim();
            string state    = ddlState.SelectedValue;
            string pin      = txtPin.Text.Trim();
            string landmark = txtLandmark.Text.Trim();
            string project  = txtProject.Text.Trim();

            pnlError.Visible   = false;
            pnlSuccess.Visible = false;

            // ========== SERVER-SIDE VALIDATION ==========
            if (!Regex.IsMatch(fullName, @"^[a-zA-Z\s]{3,50}$"))
            { ShowError("Please enter a valid full name."); return; }

            if (!IsValidEmail(email))
            { ShowError("Please enter a valid email."); return; }

            if (!Regex.IsMatch(phone, @"^[6-9]\d{9}$"))
            { ShowError("Please enter a valid 10-digit mobile."); return; }

            if (street.Length < 5)
            { ShowError("Please enter a complete street address."); return; }

            if (!Regex.IsMatch(pin, @"^[1-9][0-9]{5}$"))
            { ShowError("Please enter a valid 6-digit PIN."); return; }

            // ========== SAVE DELIVERY DETAILS TO SESSION ==========
            Session["BookingFullName"] = fullName;
            Session["BookingEmail"]    = email;
            Session["BookingPhone"]    = phone;
            Session["BookingStreet"]   = street;
            Session["BookingCity"]     = city;
            Session["BookingState"]    = state;
            Session["BookingPin"]      = pin;
            Session["BookingLandmark"] = landmark;
            Session["BookingProject"]  = string.IsNullOrWhiteSpace(project) ? "Site Construction" : project;

            // ========== HANDLE MISSING STEP-1 SESSION ==========
            string machine = Request.QueryString["machine"];
            if (Session["BookingMachine"] == null)
            {
                if (machine == "CAT320")
                {
                    Session["BookingMachine"]    = "Caterpillar 320";
                    Session["BookingCategory"]   = "Excavator";
                    Session["BookingDates"]      = "Oct 14 - Oct 19, 2026";
                    Session["BookingDuration"]   = "5 Days";
                    Session["BookingRentalFee"]  = "45,000";
                    Session["BookingDelivery"]   = "5,000";
                    Session["BookingTaxes"]      = "9,000";
                    Session["BookingTotal"]      = "59,000";
                    Session["BookingMachineId"]  = "CAT-320";
                }
                else
                {
                    Session["BookingMachine"]    = "JCB 3DX EcoXcellence";
                    Session["BookingCategory"]   = "Backhoe Loader";
                    Session["BookingDates"]      = "Oct 14 - Oct 19, 2026";
                    Session["BookingDuration"]   = "5 Days";
                    Session["BookingRentalFee"]  = "25,000";
                    Session["BookingDelivery"]   = "3,500";
                    Session["BookingTaxes"]      = "5,130";
                    Session["BookingTotal"]      = "33,630";
                    Session["BookingMachineId"]  = "JCB-220";
                }
            }

            // ✅ Create Booking record in MachineHubDB now (Step 2 — before payment)
            try
            {
                DataRow userRow = DbHelper.GetUserByEmail(User.Identity.Name);
                if (userRow != null && Session["BookingId"] == null)
                {
                    int    userId    = (int)userRow["UserId"];
                    string machineId = Session["BookingMachineId"] as string ?? "CAT-320";
                    string eqName    = Session["BookingMachine"]   as string ?? "JCB 3DX EcoXcellence";
                    string dur       = Session["BookingDuration"]  as string ?? "5 Days";
                    string totStr    = Session["BookingTotal"]      as string ?? "0";
                    string rentStr   = Session["BookingRentalFee"] as string ?? "0";
                    string delStr    = Session["BookingDelivery"]  as string ?? "0";
                    string taxStr    = Session["BookingTaxes"]     as string ?? "0";

                    int tot  = ParseAmount(totStr);
                    int rent = ParseAmount(rentStr);
                    int del  = ParseAmount(delStr);
                    int tax  = ParseAmount(taxStr);

                    // Parse start/end dates from session dates string
                    DateTime startDate = DateTime.Today;
                    DateTime endDate   = DateTime.Today.AddDays(5);
                    int days = 5;
                    string datesStr = Session["BookingDates"] as string ?? "";
                    TryParseDates(datesStr, out startDate, out endDate, out days);

                    string newBkgId = DbHelper.CreateBooking(
                        userId, machineId, eqName,
                        startDate, endDate, days, datesStr,
                        rent, del, tax, tot,
                        fullName, email, phone,
                        street, city, state, pin, landmark,
                        string.IsNullOrWhiteSpace(project) ? "Site Construction" : project,
                        city + ", " + state);

                    Session["BookingId"] = newBkgId;
                }
            }
            catch { /* booking DB insert is non-blocking; payment will still proceed */ }

            Response.Redirect("Payment.aspx");
        }

        // ----------------------------------------------------------------
        // Helpers
        // ----------------------------------------------------------------

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text    = msg;
        }

        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) return false;
            try
            {
                var regex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (!regex.IsMatch(email)) return false;
                return new System.Net.Mail.MailAddress(email).Address == email;
            }
            catch { return false; }
        }

        /// <summary>Strips commas from amount strings like "28,000" and parses to int.</summary>
        private static int ParseAmount(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return 0;
            s = s.Replace(",", "").Replace("₹", "").Trim();
            return int.TryParse(s, out int v) ? v : 0;
        }

        /// <summary>Attempts to parse "Oct 14 - Oct 18, 2026" style date strings.</summary>
        private static void TryParseDates(string datesStr, out DateTime start, out DateTime end, out int days)
        {
            start = DateTime.Today;
            end   = DateTime.Today.AddDays(5);
            days  = 5;
            try
            {
                if (!string.IsNullOrEmpty(datesStr) && datesStr.Contains(" - "))
                {
                    var parts = datesStr.Split(new[] { " - " }, StringSplitOptions.None);
                    // Append year if missing on start part
                    string startStr = parts[0].Trim();
                    string endStr   = parts[1].Trim();
                    if (!startStr.Any(char.IsDigit && (c => c > '4')))
                    {
                        // extract year from endStr
                        var yearMatch = System.Text.RegularExpressions.Regex.Match(endStr, @"\d{4}");
                        if (yearMatch.Success) startStr += ", " + yearMatch.Value;
                    }
                    if (DateTime.TryParse(startStr, out DateTime s) &&
                        DateTime.TryParse(endStr,   out DateTime e))
                    {
                        start = s;
                        end   = e;
                        days  = Math.Max(1, (int)(e - s).TotalDays);
                    }
                }
            }
            catch { /* use defaults */ }
        }
    }
}