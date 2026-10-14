using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Step 3 of Booking Flow:
    /// Secure Payment Page.
    /// Manages payment method selection (Credit/Debit Card, UPI, Net Banking),
    /// executes .NET server-side validations, masks sensitive card details,
    /// records transaction data, and forwards to Step 4 (BookingSuccess.aspx).
    /// </summary>
    public partial class Payment : Page
    {
        // Public properties rendered in the summary card
        public string MachineName { get; set; } = "JCB 3DX EcoXcellence";
        public string MachineCategory { get; set; } = "Backhoe Loader";
        public string MachineDuration { get; set; } = "5 Days";
        public string MachineDates { get; set; } = "Oct 14 - Oct 19, 2026";
        public string RentalFee { get; set; } = "25,000";
        public string DeliveryFee { get; set; } = "3,500";
        public string Taxes { get; set; } = "5,130";
        public string TotalAmount { get; set; } = "33,630";

        /// <summary>
        /// Page Load Handler:
        /// Verifies authentication and populates order summary values from ASP.NET Session.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Protected payment page — login required
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Load machine and pricing details from session if available
            if (Session["BookingMachine"] != null) MachineName = Session["BookingMachine"].ToString();
            if (Session["BookingCategory"] != null) MachineCategory = Session["BookingCategory"].ToString();
            if (Session["BookingDuration"] != null) MachineDuration = Session["BookingDuration"].ToString();
            if (Session["BookingDates"] != null) MachineDates = Session["BookingDates"].ToString();
            if (Session["BookingRentalFee"] != null) RentalFee = Session["BookingRentalFee"].ToString();
            if (Session["BookingDelivery"] != null) DeliveryFee = Session["BookingDelivery"].ToString();
            if (Session["BookingTaxes"] != null) Taxes = Session["BookingTaxes"].ToString();
            if (Session["BookingTotal"] != null) TotalAmount = Session["BookingTotal"].ToString();

            if (!IsPostBack)
            {
                // Pre-fill cardholder name from booking or session
                string bookingName = Session["BookingFullName"] as string;
                string userName = Session["UserName"] as string;
                if (!string.IsNullOrEmpty(bookingName))
                    txtNameOnCard.Text = bookingName;
                else if (!string.IsNullOrEmpty(userName))
                    txtNameOnCard.Text = userName;
            }
        }

        /// <summary>
        /// Pay & Confirm Button Click Handler:
        /// Validates card details via native .NET Validation and server Regex,
        /// generates Transaction ID and Booking ID, and redirects to Step 4.
        /// </summary>
        protected void btnPay_Click(object sender, EventArgs e)
        {
            // .NET Server-side Page.IsValid check
            if (!Page.IsValid)
                return;

            string cardNumber = (txtCardNumber.Text ?? "").Replace(" ", "").Trim();
            string expiry = (txtExpiry.Text ?? "").Trim();
            string cvv = (txtCVV.Text ?? "").Trim();
            string nameOnCard = (txtNameOnCard.Text ?? "").Trim();
            string method = rblMethod.SelectedValue ?? "card";

            pnlError.Visible = false;

            // ========== SERVER-SIDE VALIDATION ==========
            if (!Regex.IsMatch(cardNumber, @"^\d{16}$"))
            {
                ShowError("Please enter a valid 16-digit card number.");
                return;
            }

            if (!Regex.IsMatch(expiry, @"^(0[1-9]|1[0-2])\/\d{2}$"))
            {
                ShowError("Please enter expiry in MM/YY format.");
                return;
            }

            if (!Regex.IsMatch(cvv, @"^\d{3,4}$"))
            {
                ShowError("Please enter a valid CVV.");
                return;
            }

            if (!Regex.IsMatch(nameOnCard, @"^[a-zA-Z\s]{3,50}$"))
            {
                ShowError("Please enter a valid name.");
                return;
            }

            // ========== MASK CARD NUMBER (Security) ==========
            string maskedCard = "**** **** **** " + cardNumber.Substring(Math.Max(0, cardNumber.Length - 4));
            string methodDisplay = "Credit/Debit Card";
            if (method == "upi")
            {
                methodDisplay = "UPI Apps";
                maskedCard = "upi@" + nameOnCard.ToLower().Replace(" ", "");
            }
            else if (method == "netbanking")
            {
                methodDisplay = "Net Banking";
                maskedCard = "HDFC Direct NetBanking";
            }

            // ========== SAVE TRANSACTION & BOOKING TO SESSION ==========
            Session["PaymentSuccess"] = true;
            Session["PaymentCard"] = maskedCard;
            Session["PaymentName"] = nameOnCard;
            Session["PaymentMethod"] = methodDisplay;
            Session["PaymentDate"] = DateTime.Now.ToString("dd MMM yyyy, hh:mm tt");
            Session["TransactionId"] = "TXN-" + DateTime.Now.ToString("yyyyMMdd") + "-" + (new Random()).Next(1000, 9999);
            
            if (Session["BookingId"] == null)
            {
                Session["BookingId"] = "BKG-" + (new Random()).Next(7000, 9999) + "A";
            }

            // Step 4: Redirect to Booking Confirmation Success page
            Response.Redirect("BookingSuccess.aspx");
        }

        /// <summary>
        /// Displays error alert box with error text.
        /// </summary>
        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text = msg;
        }
    }
}