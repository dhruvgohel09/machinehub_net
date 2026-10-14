using System;
using System.Web.UI;

namespace machinehub
{
    public partial class VerifyOTP : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = Session["ResetEmail"] as string;
                if (string.IsNullOrEmpty(email))
                {
                    email = "operator@machinehub.com";
                    Session["ResetEmail"] = email;
                }
                lblEmail.Text = MaskEmail(email);
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            string otp = hfOtp.Value.Trim();

            if (string.IsNullOrEmpty(otp) || otp.Length < 6)
            {
                pnlError.Visible = true;
                lblError.Text = "Please enter the complete 6-digit verification code.";
                return;
            }

            // In demo mode, accept 123456 or any 6 digits
            Response.Redirect("ResetPassword.aspx");
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = true;
            lblSuccess.Text = "A new verification code has been sent to your email.";
        }

        private string MaskEmail(string email)
        {
            if (string.IsNullOrEmpty(email) || !email.Contains("@")) return "op**@machinehub.com";
            var parts = email.Split('@');
            string name = parts[0];
            string domain = parts[1];
            string masked = name.Length <= 2 ? name + "**" : name.Substring(0, 2) + new string('*', Math.Max(2, name.Length - 2));
            return masked + "@" + domain;
        }
    }
}