using System;
using System.IO;
using System.Web.Security;
using System.Web.UI;

namespace machinehub
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["logout"] == "1")
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected string CurrentUserName
        {
            get
            {
                return (Session["UserName"] as string)
                       ?? (Page.User != null && Page.User.Identity.IsAuthenticated ? Page.User.Identity.Name : "");
            }
        }

        protected string Active(string page)
        {
            string current = Path.GetFileName(Request.Path);
            if (string.IsNullOrEmpty(current) || !current.Contains(".")) current = current + ".aspx";
            if (page == "MyBookings.aspx" && current.Equals("BookingDetail.aspx", StringComparison.OrdinalIgnoreCase)) return "active";
            return current.Equals(page, StringComparison.OrdinalIgnoreCase) ? "active" : "";
        }

        //  NEW: Check if user is logged in
        public bool IsUserLoggedIn()
        {
            return Request.IsAuthenticated;
        }
    }
}