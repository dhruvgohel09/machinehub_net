using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace machinehub
{
    /// <summary>
    /// Machines Page:
    /// Displays the heavy machinery fleet available for rental.
    /// Manages data via System.Data.DataTable with DataView sorting by price.
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
            {
                BindMachines();
            }
        }

        /// <summary>
        /// Sort dropdown change event:
        /// Re-sorts the fleet DataTable via DataView.Sort without full reload.
        /// </summary>
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMachines();
        }

        /// <summary>
        /// Switches UI to Cards Grid View.
        /// </summary>
        protected void btnGrid_Click(object sender, EventArgs e)
        {
            btnGrid.CssClass = "mh-view-btn active";
            btnTable.CssClass = "mh-view-btn";
            pnlMachinesGrid.Visible = true;
            pnlMachinesTable.Visible = false;
            BindMachines();
        }

        /// <summary>
        /// Switches UI to Data Table View.
        /// </summary>
        protected void btnTable_Click(object sender, EventArgs e)
        {
            btnGrid.CssClass = "mh-view-btn";
            btnTable.CssClass = "mh-view-btn active";
            pnlMachinesGrid.Visible = false;
            pnlMachinesTable.Visible = true;
            BindMachines();
        }

        /// <summary>
        /// Retrieves the heavy machinery inventory DataTable from AppDataStore.
        /// </summary>
        /// <returns>System.Data.DataTable of machines.</returns>
        public DataTable GetMachinesDataTable()
        {
            return AppDataStore.GetMachinesDataTable();
        }

        /// <summary>
        /// Binds the machines DataTable to the UI controls using DataView sorting.
        /// </summary>
        private void BindMachines()
        {
            DataTable dt = GetMachinesDataTable();
            DataView dv = dt.DefaultView;

            // Apply price sorting
            string sort = ddlSort != null ? ddlSort.SelectedValue : "recommended";
            if (sort == "low-to-high")
            {
                dv.Sort = "DailyRateVal ASC";
            }
            else if (sort == "high-to-low")
            {
                dv.Sort = "DailyRateVal DESC";
            }

            // Bind to Data Table repeater
            rptMachinesTable.DataSource = dv;
            rptMachinesTable.DataBind();
        }
    }
}