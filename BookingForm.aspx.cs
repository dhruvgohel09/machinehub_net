using System;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 2 of Booking Flow:
    /// Delivery Address & Customer Details Page.
    /// Captures full name, email, phone, complete delivery address, and project details.
    /// Enforces pure .NET Web Forms Validation controls & server-side regex checks,
    /// stores delivery parameters into ASP.NET Session, and forwards to Step 3 (Payment.aspx).
    /// </summary>
    public partial class BookingForm : Page
    {
        // Public properties rendered in the booking summary side panel
        public string MachineName { get; set; } = "JCB 3DX EcoXcellence";
        public string MachineCategory { get; set; } = "Backhoe Loader";
        public string BookingDates { get; set; } = "Oct 14 - Oct 18, 2026";
        public string BookingDuration { get; set; } = "5 Days";
        public string RentalFee { get; set; } = "22,500";
        public string DeliveryFee { get; set; } = "1,200";
        public string Taxes { get; set; } = "4,266";
        public string TotalAmount { get; set; } = "27,966";

        /// <summary>
        /// Page Load Handler:
        /// Ensures authentication, populates rental summary from Step 1 (SelectDate.aspx),
        /// and pre-fills registered user details into the form.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Login required
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Retrieve rental details carried over from Step 1 Session
            if (Session["BookingMachine"] != null) MachineName = Session["BookingMachine"].ToString();
            if (Session["BookingCategory"] != null) MachineCategory = Session["BookingCategory"].ToString();
            if (Session["BookingDates"] != null) BookingDates = Session["BookingDates"].ToString();
            if (Session["BookingDuration"] != null) BookingDuration = Session["BookingDuration"].ToString();
            if (Session["BookingRentalFee"] != null) RentalFee = Session["BookingRentalFee"].ToString();
            if (Session["BookingDelivery"] != null) DeliveryFee = Session["BookingDelivery"].ToString();
            if (Session["BookingTaxes"] != null) Taxes = Session["BookingTaxes"].ToString();
            if (Session["BookingTotal"] != null) TotalAmount = Session["BookingTotal"].ToString();

            if (!IsPostBack)
            {
                // Pre-fill user profile info from session
                string userName = Session["UserName"] as string;
                if (!string.IsNullOrEmpty(userName))
                    txtFullName.Text = userName;

                if (User.Identity.IsAuthenticated)
                    txtEmail.Text = User.Identity.Name;
            }
        }

        /// <summary>
        /// Proceed to Payment Handler:
        /// Validates delivery address inputs, records details in Session, and proceeds to Payment.
        /// </summary>
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            // Native .NET server-side validation check
            if (!Page.IsValid)
                return;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string street = txtStreet.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = ddlState.SelectedValue;
            string pin = txtPin.Text.Trim();
            string landmark = txtLandmark.Text.Trim();
            string project = txtProject.Text.Trim();

            pnlError.Visible = false;
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
            Session["BookingEmail"] = email;
            Session["BookingPhone"] = phone;
            Session["BookingStreet"] = street;
            Session["BookingCity"] = city;
            Session["BookingState"] = state;
            Session["BookingPin"] = pin;
            Session["BookingLandmark"] = landmark;
            Session["BookingProject"] = string.IsNullOrWhiteSpace(project) ? "Site Construction" : project;

            // If machine was specified via query string without Step 1, set defaults
            string machine = Request.QueryString["machine"];
            if (Session["BookingMachine"] == null)
            {
                if (machine == "CAT320")
                {
                    Session["BookingMachine"] = "Caterpillar 320";
                    Session["BookingCategory"] = "Excavator";
                    Session["BookingDates"] = "Oct 14 - Oct 19, 2026";
                    Session["BookingDuration"] = "5 Days";
                    Session["BookingRentalFee"] = "45,000";
                    Session["BookingDelivery"] = "5,000";
                    Session["BookingTaxes"] = "9,000";
                    Session["BookingTotal"] = "59,000";
                }
                else
                {
                    Session["BookingMachine"] = "JCB 3DX EcoXcellence";
                    Session["BookingCategory"] = "Backhoe Loader";
                    Session["BookingDates"] = "Oct 14 - Oct 19, 2026";
                    Session["BookingDuration"] = "5 Days";
                    Session["BookingRentalFee"] = "25,000";
                    Session["BookingDelivery"] = "3,500";
                    Session["BookingTaxes"] = "5,130";
                    Session["BookingTotal"] = "33,630";
                }
            }

            // Step 3: Redirect to Secure Payment
            Response.Redirect("Payment.aspx");
        }

        /// <summary>
        /// Displays error alert box.
        /// </summary>
        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text = msg;
        }

        /// <summary>
        /// Validates email address format.
        /// </summary>
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
    }
}