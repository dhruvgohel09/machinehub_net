using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string password = txtPassword.Text.Trim();

            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            // ========== VALIDATION ==========

            // Full Name
            if (string.IsNullOrEmpty(name))
            {
                ShowError("Please enter your full name.");
                return;
            }

            if (name.Length < 3)
            {
                ShowError("Full name must be at least 3 characters.");
                return;
            }

            if (!Regex.IsMatch(name, @"^[a-zA-Z\s]+$"))
            {
                ShowError("Full name can only contain letters and spaces.");
                return;
            }

            // Email
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

            // Phone
            if (string.IsNullOrEmpty(phone))
            {
                ShowError("Please enter your phone number.");
                return;
            }

            if (!Regex.IsMatch(phone, @"^[\+\d\s\-\(\)]{10,15}$"))
            {
                ShowError("Please enter a valid phone number (10-15 digits).");
                return;
            }

            // Password
            if (string.IsNullOrEmpty(password))
            {
                ShowError("Please enter a password.");
                return;
            }

            if (password.Length < 8)
            {
                ShowError("Password must be at least 8 characters.");
                return;
            }

            if (!Regex.IsMatch(password, @"[0-9]"))
            {
                ShowError("Password must contain at least one number.");
                return;
            }

            if (!Regex.IsMatch(password, @"[!@#$%^&*(),.?""{}|<>_\-]"))
            {
                ShowError("Password must contain at least one special character.");
                return;
            }

            // ========== SAVE USER ==========
            if (!Regex.IsMatch(password, @"[A-Z]"))
            {
                ShowError("Password must contain at least one capital letter.");
                return;
            }

            if (!UserStore.Create(email, name, phone, password))
            {
                ShowError("An account with this email already exists.");
                return;
            }

            pnlSuccess.Visible = true;
            lblSuccess.Text = "\u2713 Account created successfully! You can now log in.";

            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
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