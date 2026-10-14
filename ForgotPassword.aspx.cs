using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            // ✅ .NET Server-side validation check
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim().ToLower();

            pnlError.Visible   = false;
            pnlSuccess.Visible = false;

            if (string.IsNullOrEmpty(email))
            { ShowError("Please enter your email address."); return; }

            if (!IsValidEmail(email))
            { ShowError("Please enter a valid email address."); return; }

            // ✅ Check against MachineHubDB
            if (DbHelper.UserExists(email))
            {
                Session["ResetEmail"] = email;
                Response.Redirect("VerifyOTP.aspx");
            }
            else
            {
                ShowError("Email address not found in our system.");
            }
        }

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text    = msg;
        }

        // ✅ Server-side Email validation
        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) return false;
            try
            {
                var regex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (!regex.IsMatch(email)) return false;
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch { return false; }
        }
    }
}