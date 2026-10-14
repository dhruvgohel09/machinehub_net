using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace machinehub
{
    /// <summary>
    /// MyBookings Page:
    /// Displays active and historical heavy equipment rentals from MachineHubDB.
    /// Uses DataView for server-side search filtering, card view and table view.
    /// </summary>
    public partial class MyBookings : Page
    {
        /// <summary>
        /// Page Load Handler:
        /// Ensures authentication and initializes bookings data on first load.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            if (!IsPostBack)
                BindBookingsData();
        }

        /// <summary>Search box TextChanged — re-bind with filter.</summary>
        protected void txtBookingSearch_TextChanged(object sender, EventArgs e)
        {
            BindBookingsData();
        }

        /// <summary>Switches UI to Cards Grid View.</summary>
        protected void btnCardsView_Click(object sender, EventArgs e)
        {
            btnCardsView.CssClass  = "mh-view-btn active";
            btnTableView.CssClass  = "mh-view-btn";
            pnlCardsView.Visible   = true;
            pnlTableView.Visible   = false;
            BindBookingsData();
        }

        /// <summary>Switches UI to Data Table View.</summary>
        protected void btnTableView_Click(object sender, EventArgs e)
        {
            btnCardsView.CssClass  = "mh-view-btn";
            btnTableView.CssClass  = "mh-view-btn active";
            pnlCardsView.Visible   = false;
            pnlTableView.Visible   = true;
            BindBookingsData();
        }

        /// <summary>
        /// Loads the bookings DataTable from MachineHubDB for the logged-in user.
        /// Also merges any active booking that was just completed (in session).
        /// </summary>
        public DataTable GetBookingsDataTable()
        {
            // ✅ Load from MachineHubDB for the current user
            string email = User.Identity.Name;
            DataTable dt = DbHelper.GetBookingsByUser(email);

            // Merge active booking from session if not already persisted
            if (Session["BookingId"] != null)
            {
                string bId  = Session["BookingId"].ToString();

                // Only add if not already in the DB result set
                bool alreadyIn = false;
                foreach (DataRow r in dt.Rows)
                    if (r["BookingId"].ToString() == bId) { alreadyIn = true; break; }

                if (!alreadyIn)
                {
                    string eq  = Session["BookingMachine"]      != null ? Session["BookingMachine"].ToString()      : "JCB 3DX EcoXcellence";
                    string dur = Session["BookingDates"]         != null ? Session["BookingDates"].ToString()        : "14 Oct - 18 Oct 2026";
                    string tot = Session["BookingTotal"]         != null ? Session["BookingTotal"].ToString()        : "27,966";
                    string img = Session["SelectedMachineImage"] != null ? Session["SelectedMachineImage"].ToString(): "https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=200&q=80";

                    DataRow newRow = dt.NewRow();
                    newRow["BookingId"]     = bId;
                    newRow["EquipmentName"] = eq;
                    newRow["Location"]      = "Depot, Mumbai, MH";
                    newRow["Duration"]      = dur;
                    newRow["TotalCost"]     = tot;
                    newRow["Status"]        = "Active";
                    newRow["BadgeClass"]    = "active";
                    newRow["ImageUrl"]      = img;
                    newRow["ActionUrl"]     = "BookingDetail.aspx";
                    dt.Rows.InsertAt(newRow, 0);
                }
            }

            return dt;
        }

        /// <summary>Filters and binds the Bookings DataTable to both Card and Table Repeaters.</summary>
        private void BindBookingsData()
        {
            string query = (txtBookingSearch.Text ?? "").Trim().ToUpper();
            DataTable dt = GetBookingsDataTable();

            DataView dv = dt.DefaultView;
            if (!string.IsNullOrEmpty(query))
            {
                dv.RowFilter = string.Format(
                    "BookingId LIKE '%{0}%' OR EquipmentName LIKE '%{0}%' OR Location LIKE '%{0}%' OR Status LIKE '%{0}%'",
                    query.Replace("'", "''"));

                bool activeMatches = "BKG-8892A JCB 3DX ECOXCELLENCE MUMBAI ACTIVE".Contains(query);
                pnlActiveCard.Visible = activeMatches;
            }
            else
            {
                pnlActiveCard.Visible = true;
            }

            bool hasResults = dv.Count > 0 || pnlActiveCard.Visible;
            pnlNoResults.Visible = !hasResults;

            rptBookingsCards.DataSource = dv;
            rptBookingsCards.DataBind();

            rptBookingsTable.DataSource = dv;
            rptBookingsTable.DataBind();
        }
    }
}