using System;
using System.Web.UI;

namespace machinehub
{
    public partial class Settings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = (User != null && User.Identity.IsAuthenticated) ? User.Identity.Name : (Session["ResetEmail"] as string ?? "dhruv@example.com");
                if (!string.IsNullOrEmpty(email))
                {
                    txtEmail.Text = email;
                    string[] u = UserStore.GetUser(email);
                    if (u != null)
                    {
                        lblUserDisplayName.Text = u[1];
                        txtFullName.Text = u[1];
                        lblUserPhone.Text = u[2];
                        txtPhone.Text = u[2];
                    }
                    else if (Session["UserName"] != null)
                    {
                        lblUserDisplayName.Text = Session["UserName"].ToString();
                        txtFullName.Text = Session["UserName"].ToString();
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newName = txtFullName.Text.Trim();
            string newPhone = txtPhone.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (!string.IsNullOrEmpty(newName))
            {
                Session["UserName"] = newName;
                lblUserDisplayName.Text = newName;
            }

            if (!string.IsNullOrEmpty(newPhone))
            {
                lblUserPhone.Text = newPhone;
            }

            if (!string.IsNullOrEmpty(email))
            {
                UserStore.UpdateUser(email, string.IsNullOrEmpty(newName) ? "User" : newName, string.IsNullOrEmpty(newPhone) ? "" : newPhone);
            }

            pnlSuccess.Visible = true;
            lblSuccess.Text = "\u2713 Changes saved successfully!";
        }
    }
}
