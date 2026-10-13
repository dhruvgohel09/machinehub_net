using System;
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
            string email = txtEmail.Text.Trim();

            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            // ========== VALIDATION ==========

            if (string.IsNullOrEmpty(email))
            {
                ShowError("Please enter your email address.");
                return;
            }

            if (!IsValidEmail(email))
            {
                ShowError("Please enter a valid email address.");
                return;
            }

            // ========== DUMMY CHECK ==========
            // Database pachi jodishu
            if (UserStore.Exists(email))
            {
                // Session ma email save
                Session["ResetEmail"] = email;

                // VerifyOTP page ma redirect
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
            lblError.Text = msg;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}