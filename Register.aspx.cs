using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && User.Identity.IsAuthenticated)
                Response.Redirect("Default.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // ✅ STEP 1: .NET Validation Controls check
            if (!Page.IsValid) return;

            string name     = txtFullName.Text.Trim();
            string email    = txtEmail.Text.Trim().ToLower();
            string phone    = txtPhone.Text.Trim();
            string password = txtPassword.Text.Trim();

            pnlError.Visible   = false;
            pnlSuccess.Visible = false;

            // ========== SERVER-SIDE VALIDATION ==========

            if (string.IsNullOrEmpty(name))
            { ShowError("Please enter your full name."); return; }

            if (name.Length < 3)
            { ShowError("Full name must be at least 3 characters."); return; }

            if (!Regex.IsMatch(name, @"^[a-zA-Z\s]+$"))
            { ShowError("Full name can only contain letters and spaces."); return; }

            if (string.IsNullOrEmpty(email))
            { ShowError("Please enter your email address."); return; }

            if (!IsValidEmail(email))
            { ShowError("Please enter a valid email address."); return; }

            if (string.IsNullOrEmpty(phone))
            { ShowError("Please enter your phone number."); return; }

            if (!Regex.IsMatch(phone, @"^[\+\d\s\-\(\)]{10,15}$"))
            { ShowError("Please enter a valid phone number (10-15 digits)."); return; }

            if (string.IsNullOrEmpty(password))
            { ShowError("Please enter a password."); return; }

            if (password.Length < 8)
            { ShowError("Password must be at least 8 characters."); return; }

            if (!Regex.IsMatch(password, @"[0-9]"))
            { ShowError("Password must contain at least one number."); return; }

            if (!Regex.IsMatch(password, @"[!@#$%^&*(),.?""{}|<>_\-]"))
            { ShowError("Password must contain at least one special character."); return; }

            if (!Regex.IsMatch(password, @"[A-Z]"))
            { ShowError("Password must contain at least one capital letter."); return; }

            // ✅ Save user to MachineHubDB
            if (!DbHelper.CreateUser(email, name, phone, password))
            {
                ShowError("An account with this email already exists.");
                return;
            }

            pnlSuccess.Visible = true;
            lblSuccess.Text    = "✓ Account created successfully! You can now log in.";

            txtFullName.Text        = "";
            txtEmail.Text           = "";
            txtPhone.Text           = "";
            txtPassword.Text        = "";
            txtConfirmPassword.Text = "";
        }

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text    = msg;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch { return false; }
        }
    }
}