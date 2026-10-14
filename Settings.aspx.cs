using System;
using System.Data;
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

                        // Keep session in sync
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

            // ✅ Persist profile update to MachineHubDB
            if (!string.IsNullOrEmpty(email))
            {
                DbHelper.UpdateUserProfile(
                    email,
                    string.IsNullOrEmpty(newName)  ? "User" : newName,
                    string.IsNullOrEmpty(newPhone) ? ""     : newPhone);
            }

            pnlSuccess.Visible = true;
            lblSuccess.Text    = "\u2713 Changes saved successfully!";
        }
    }
}
