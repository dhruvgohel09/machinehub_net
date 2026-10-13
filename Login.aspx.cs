using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace machinehub
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && User.Identity.IsAuthenticated)
                Response.Redirect("Default.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //.NET Server-side validation check
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            pnlError.Visible = false;
            pnlSuccess.Visible = false;

            //  Server-side extra safety checks
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

            if (string.IsNullOrEmpty(password))
            {
                ShowError("Please enter your password.");
                return;
            }

            //  Brute force protection (5 tries)
            int tries = Session["LoginTries"] == null ? 0 : (int)Session["LoginTries"];
            if (tries >= 5)
            {
                ShowError("Too many failed attempts. Please close the browser and try again later.");
                return;
            }

            //  Database / UserStore validation
            string name = UserStore.Validate(email, password);
            if (name == null)
            {
                Session["LoginTries"] = tries + 1;
                ShowError("Invalid email or password.");
                return;
            }

            //  Login success
            Session["LoginTries"] = 0;
            Session["UserName"] = name;
            FormsAuthentication.SetAuthCookie(email.ToLower(), false);

            string ret = Request.QueryString["ReturnUrl"];
            if (!string.IsNullOrEmpty(ret) && Url.IsLocal(ret))
                Response.Redirect(ret);

            Response.Redirect("Default.aspx");
        }

        private void ShowError(string msg)
        {
            pnlError.Visible = true;
            lblError.Text = msg;
        }

        //  Server-side Email validation using Regex
        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) return false;
            try
            {
                var regex = new System.Text.RegularExpressions.Regex(
                    @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (!regex.IsMatch(email)) return false;

                return new System.Net.Mail.MailAddress(email).Address == email;
            }
            catch { return false; }
        }
    }

    internal static class Url
    {
        public static bool IsLocal(string url)
        {
            return url.StartsWith("/") && !url.StartsWith("//") && !url.StartsWith("/\\");
        }
    }
}