using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace machinehub
{
    /// <summary>
    /// Machines Page:
    /// Displays the heavy machinery fleet available for rental.
    /// Loads data from MachineHubDB via DbHelper and uses DataView for sorting.
    /// Provides toggle between Grid View (Cards) and Data Table View.
    /// </summary>
    public partial class Machines : Page
    {
        /// <summary>
        /// Page Load Handler:
        /// Loads and binds the equipment fleet on initial request.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindMachines();
        }

        /// <summary>Sort dropdown change event.</summary>
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMachines();
        }

        /// <summary>Switches UI to Cards Grid View.</summary>
        protected void btnGrid_Click(object sender, EventArgs e)
        {
            btnGrid.CssClass        = "mh-view-btn active";
            btnTable.CssClass       = "mh-view-btn";
            pnlMachinesGrid.Visible  = true;
            pnlMachinesTable.Visible = false;
            BindMachines();
        }

        /// <summary>Switches UI to Data Table View.</summary>
        protected void btnTable_Click(object sender, EventArgs e)
        {
            btnGrid.CssClass        = "mh-view-btn";
            btnTable.CssClass       = "mh-view-btn active";
            pnlMachinesGrid.Visible  = false;
            pnlMachinesTable.Visible = true;
            BindMachines();
        }

        /// <summary>
        /// Returns the machines DataTable from MachineHubDB.
        /// Kept public so ASPX markup can reference it if needed.
        /// </summary>
        public DataTable GetMachinesDataTable()
        {
            // ✅ Now loads from MachineHubDB.Machines via DbHelper
            return DbHelper.GetMachines();
        }

        /// <summary>Binds the machines DataTable to UI controls with optional DataView sorting.</summary>
        private void BindMachines()
        {
            DataTable dt = GetMachinesDataTable();
            DataView  dv = dt.DefaultView;

            // Apply price sorting
            string sort = ddlSort != null ? ddlSort.SelectedValue : "recommended";
            if (sort == "low-to-high")
                dv.Sort = "DailyRateVal ASC";
            else if (sort == "high-to-low")
                dv.Sort = "DailyRateVal DESC";

            // Bind to table repeater
            rptMachinesTable.DataSource = dv;
            rptMachinesTable.DataBind();
        }
    }
}