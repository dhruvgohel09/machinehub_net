using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
            pnlSuccess.Visible = false;
            string first = txtFirst.Text.Trim(), last = txtLast.Text.Trim();
            string email = txtEmail.Text.Trim(), msg = txtMessage.Text.Trim();

            if (first.Length == 0) { Err("Please enter your first name."); return; }
            if (!Regex.IsMatch(first, @"^[a-zA-Z\s]+$")) { Err("First name can only contain letters."); return; }
            if (last.Length == 0) { Err("Please enter your last name."); return; }
            if (!Regex.IsMatch(last, @"^[a-zA-Z\s]+$")) { Err("Last name can only contain letters."); return; }
            if (email.Length == 0) { Err("Please enter your email address."); return; }
            if (!IsValidEmail(email)) { Err("Please enter a valid email address."); return; }
            if (ddlType.SelectedValue == "") { Err("Please select an inquiry type."); return; }
            if (msg.Length < 10) { Err("Message must be at least 10 characters."); return; }

            pnlSuccess.Visible = true;
            lblSuccess.Text = "\u2713 Thanks! Your request was submitted. We will contact you soon.";
            txtFirst.Text = txtLast.Text = txtEmail.Text = txtMessage.Text = "";
            ddlType.SelectedIndex = 0;
        }

        private void Err(string m) { pnlError.Visible = true; lblError.Text = m; }

        private bool IsValidEmail(string email)
        {
            try { return new System.Net.Mail.MailAddress(email).Address == email; } catch { return false; }
        }
    }
}
