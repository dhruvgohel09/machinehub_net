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
                if (Session["UserName"] != null)
                {
                    lblUserDisplayName.Text = Session["UserName"].ToString();
                    txtFullName.Text = Session["UserName"].ToString();
                }
                if (User.Identity.IsAuthenticated && !string.IsNullOrEmpty(User.Identity.Name))
                {
                    txtEmail.Text = User.Identity.Name;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtFullName.Text.Trim()))
            {
                Session["UserName"] = txtFullName.Text.Trim();
                lblUserDisplayName.Text = txtFullName.Text.Trim();
            }
            pnlSuccess.Visible = true;
            lblSuccess.Text = "\u2713 Changes saved successfully!";
        }
    }
}
