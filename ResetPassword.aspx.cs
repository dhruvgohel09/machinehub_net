using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class ResetPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ResetEmail"] == null)
                Response.Redirect("ForgotPassword.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newPwd     = txtNewPassword.Text.Trim();
            string confirmPwd = txtConfirmPassword.Text.Trim();

            pnlError.Visible   = false;
            pnlSuccess.Visible = false;

            // ========== VALIDATION ==========

            if (string.IsNullOrEmpty(newPwd))
            { ShowError("Please enter a new password."); return; }

            if (newPwd.Length < 8)
            { ShowError("Password must be at least 8 characters."); return; }

            if (!Regex.IsMatch(newPwd, @"[0-9]"))
            { ShowError("Password must contain at least one number."); return; }

            if (!Regex.IsMatch(newPwd, @"[!@#$%^&*(),.?""{}|<>_\-]"))
            { ShowError("Password must contain at least one special character."); return; }

            if (string.IsNullOrEmpty(confirmPwd))
            { ShowError("Please confirm your password."); return; }

            if (newPwd != confirmPwd)
            { ShowError("Passwords do not match."); return; }

            // ✅ Update password in MachineHubDB (PBKDF2 hashed)
            DbHelper.SetPassword((string)Session["ResetEmail"], newPwd);
            Session.Remove("ResetEmail");
            Response.Redirect("PasswordUpdated.aspx");
        }

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text    = msg;
        }
    }
}