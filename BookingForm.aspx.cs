using System;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace machinehub
{
    public partial class BookingForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ✅ Login required
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            if (!IsPostBack)
            {
                // Pre-fill from session
                string userName = Session["UserName"] as string;
                if (!string.IsNullOrEmpty(userName))
                    txtFullName.Text = userName;

                if (User.Identity.IsAuthenticated)
                    txtEmail.Text = User.Identity.Name;
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            // ✅ .NET Validation check
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

            // ========== SAVE TO SESSION ==========
            Session["BookingFullName"] = fullName;
            Session["BookingEmail"] = email;
            Session["BookingPhone"] = phone;
            Session["BookingStreet"] = street;
            Session["BookingCity"] = city;
            Session["BookingState"] = state;
            Session["BookingPin"] = pin;
            Session["BookingLandmark"] = landmark;
            Session["BookingProject"] = project;

            // ✅ Redirect to BookingDetail page (confirmation)
            Response.Redirect("BookingDetail.aspx");
        }

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text = msg;
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
    }
}