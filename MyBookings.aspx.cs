using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace machinehub
{
    /// <summary>
    /// MyBookings Page:
    /// Displays active and historical heavy equipment rentals.
    /// Utilizes pure .NET server-side controls and System.Data.DataTable with DataView 
    /// for search filtering, supporting both Cards View and Data Table View.
    /// </summary>
    public partial class MyBookings : Page
    {
        /// <summary>
        /// Page Load Handler:
        /// Ensures authentication and initializes bookings data on first load.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Authenticate user before showing their private bookings
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            // Initial binding on GET request
            if (!IsPostBack)
            {
                BindBookingsData();
            }
        }

        /// <summary>
        /// TextChanged Event Handler:
        /// Triggered when the user types in the .NET search box (AutoPostBack=true).
        /// </summary>
        protected void txtBookingSearch_TextChanged(object sender, EventArgs e)
        {
            BindBookingsData();
        }

        /// <summary>
        /// Switches UI to Cards Grid View.
        /// </summary>
        protected void btnCardsView_Click(object sender, EventArgs e)
        {
            btnCardsView.CssClass = "mh-view-btn active";
            btnTableView.CssClass = "mh-view-btn";
            pnlCardsView.Visible = true;
            pnlTableView.Visible = false;
            BindBookingsData();
        }

        /// <summary>
        /// Switches UI to Data Table View.
        /// </summary>
        protected void btnTableView_Click(object sender, EventArgs e)
        {
            btnCardsView.CssClass = "mh-view-btn";
            btnTableView.CssClass = "mh-view-btn active";
            pnlCardsView.Visible = false;
            pnlTableView.Visible = true;
            BindBookingsData();
        }

        /// <summary>
        /// Creates and populates the Bookings DataTable.
        /// Also checks Session for newly booked equipment from the 4-step rental flow.
        /// </summary>
        /// <returns>System.Data.DataTable containing booking records.</returns>
        public DataTable GetBookingsDataTable()
        {
            // Delegate to centralized AppDataStore for consistent data modeling
            DataTable dt = AppDataStore.GetBookingsDataTable();

            // Check if there is an active booking from current user session
            if (Session["BookingId"] != null)
            {
                string bId = Session["BookingId"].ToString();
                string eq = Session["SelectedMachine"] != null ? Session["SelectedMachine"].ToString() : "JCB 3DX EcoXcellence";
                string dur = Session["SelectedDates"] != null ? Session["SelectedDates"].ToString() : "14 Oct - 18 Oct 2026";
                string tot = Session["BookingTotal"] != null ? Session["BookingTotal"].ToString() : "27,966";
                string img = Session["SelectedMachineImage"] != null ? Session["SelectedMachineImage"].ToString() : "https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=200&q=80";

                // Insert at the top of the DataTable
                DataRow newRow = dt.NewRow();
                newRow["BookingId"] = bId;
                newRow["EquipmentName"] = eq;
                newRow["Location"] = "Depot, Mumbai, MH";
                newRow["Duration"] = dur;
                newRow["TotalCost"] = tot;
                newRow["Status"] = "Active";
                newRow["BadgeClass"] = "active";
                newRow["ImageUrl"] = img;
                newRow["ActionUrl"] = "BookingDetail.aspx";
                dt.Rows.InsertAt(newRow, 0);
            }

            return dt;
        }

        /// <summary>
        /// Filters and binds the Bookings DataTable to both Card and Table Repeaters.
        /// Uses DataView.RowFilter for fast, server-side search without client-side JS errors.
        /// </summary>
        private void BindBookingsData()
        {
            string query = (txtBookingSearch.Text ?? "").Trim().ToUpper();
            DataTable dt = GetBookingsDataTable();

            // Create DataView for server-side filtering
            DataView dv = dt.DefaultView;
            if (!string.IsNullOrEmpty(query))
            {
                // Multi-column search filter
                dv.RowFilter = string.Format("BookingId LIKE '%{0}%' OR EquipmentName LIKE '%{0}%' OR Location LIKE '%{0}%' OR Status LIKE '%{0}%'", query);

                // Featured active card visibility check
                bool activeMatches = "BKG-8892A JCB 3DX ECOXCELLENCE MUMBAI ACTIVE".Contains(query);
                pnlActiveCard.Visible = activeMatches;
            }
            else
            {
                pnlActiveCard.Visible = true;
            }

            // Determine if any results exist
            bool hasResults = dv.Count > 0 || pnlActiveCard.Visible;
            pnlNoResults.Visible = !hasResults;

            // Bind DataTable to both Repeaters
            rptBookingsCards.DataSource = dv;
            rptBookingsCards.DataBind();

            rptBookingsTable.DataSource = dv;
            rptBookingsTable.DataBind();
        }
    }
}