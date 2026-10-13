using System;
using System.Web.UI;

namespace machinehub
{
    public partial class MyBookings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        }
    }
}