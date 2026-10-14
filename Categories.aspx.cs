using System;
using System.Data;
using System.Web.UI;

namespace machinehub
{
    /// <summary>
    /// Categories Page:
    /// Loads equipment categories from MachineHubDB and binds to Repeater.
    /// </summary>
    public partial class Categories : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindCategories();
        }

        /// <summary>Returns categories DataTable from DB — used by ASPX repeaters.</summary>
        public DataTable GetCategoriesDataTable()
        {
            // ✅ Load from MachineHubDB.Categories
            return DbHelper.GetCategories();
        }

        private void BindCategories()
        {
            // If there is a repeater control on the page, bind it
            var rpt = FindControl("rptCategories") as System.Web.UI.WebControls.Repeater;
            if (rpt != null)
            {
                rpt.DataSource = GetCategoriesDataTable();
                rpt.DataBind();
            }
        }
    }
}