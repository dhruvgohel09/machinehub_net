using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace machinehub
{
    public partial class Settings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Resolve current user's email
                string email = (User != null && User.Identity.IsAuthenticated)
                    ? User.Identity.Name
                    : (Session["ResetEmail"] as string ?? "dhruv@example.com");

                if (!string.IsNullOrEmpty(email))
                {
                    txtEmail.Text = email;

                    // ✅ Load profile from MachineHubDB.Users
                    DataRow u = DbHelper.GetUserByEmail(email);
                    if (u != null)
                    {
                        string fullName = u["FullName"].ToString();
                        string phone    = u["Phone"].ToString();

                        lblUserDisplayName.Text = fullName;
                        txtFullName.Text        = fullName;
                        lblUserPhone.Text       = phone;
                        txtPhone.Text           = phone;

                        Session["UserName"] = fullName;
                    }
                    else if (Session["UserName"] != null)
                    {
                        lblUserDisplayName.Text = Session["UserName"].ToString();
                        txtFullName.Text        = Session["UserName"].ToString();
                    }
                }
            }
        }

        // ── TAB 1: Save Personal Info ────────────────────────────────────
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newName  = txtFullName.Text.Trim();
            string newPhone = txtPhone.Text.Trim();
            string email    = txtEmail.Text.Trim().ToLower();

            if (!string.IsNullOrEmpty(newName))
            {
                Session["UserName"]     = newName;
                lblUserDisplayName.Text = newName;
            }

            if (!string.IsNullOrEmpty(newPhone))
                lblUserPhone.Text = newPhone;

            // ✅ Persist to MachineHubDB
            if (!string.IsNullOrEmpty(email))
            {
                DbHelper.UpdateUserProfile(
                    email,
                    string.IsNullOrEmpty(newName)  ? "User" : newName,
                    string.IsNullOrEmpty(newPhone) ? ""     : newPhone);
            }

            pnlSuccess.Visible = true;
            lblSuccess.Text    = "✓ Personal info saved successfully!";
        }

        // ── TAB 2: Change Password ───────────────────────────────────────
        protected void btnChangePwd_Click(object sender, EventArgs e)
        {
            pnlPwdError.Visible   = false;
            pnlPwdSuccess.Visible = false;

            string email      = (User != null && User.Identity.IsAuthenticated) ? User.Identity.Name : txtEmail.Text.Trim().ToLower();
            string currentPwd = txtCurrentPwd.Text;
            string newPwd     = txtNewPwd.Text.Trim();
            string confirmPwd = txtConfirmPwd.Text.Trim();

            // ── Validation ────────────────────────────────────────────────
            if (string.IsNullOrEmpty(currentPwd))
            { ShowPwdError("Please enter your current password."); return; }

            // Verify current password is correct
            string validName = DbHelper.ValidateLogin(email, currentPwd);
            if (validName == null)
            { ShowPwdError("Current password is incorrect."); return; }

            if (string.IsNullOrEmpty(newPwd) || newPwd.Length < 8)
            { ShowPwdError("New password must be at least 8 characters."); return; }

            if (!Regex.IsMatch(newPwd, @"[A-Z]"))
            { ShowPwdError("Password must include at least one uppercase letter."); return; }

            if (!Regex.IsMatch(newPwd, @"[0-9]"))
            { ShowPwdError("Password must include at least one number."); return; }

            if (!Regex.IsMatch(newPwd, @"[!@#$%^&*(),.?""{}|<>_\-]"))
            { ShowPwdError("Password must include at least one special character."); return; }

            if (newPwd != confirmPwd)
            { ShowPwdError("New passwords do not match."); return; }

            if (newPwd == currentPwd)
            { ShowPwdError("New password must be different from your current password."); return; }

            // ✅ Update password in MachineHubDB
            DbHelper.SetPassword(email, newPwd);

            // Clear fields
            txtCurrentPwd.Text = "";
            txtNewPwd.Text     = "";
            txtConfirmPwd.Text = "";

            pnlPwdSuccess.Visible = true;
            lblPwdSuccess.Text    = "✓ Password updated successfully! Use your new password next time you log in.";
        }

        // ── Helpers ──────────────────────────────────────────────────────
        private void ShowPwdError(string msg)
        {
            pnlPwdError.Visible = true;
            lblPwdError.Text    = msg;
        }
    }
}
