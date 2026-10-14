using System;
using System.Data;
using System.Web;

namespace machinehub
{
    /// <summary>
    /// AppDataStore — backward-compatibility facade.
    /// All methods now delegate to DbHelper (MachineHubDB).
    /// Any existing ASPX markup or code-behind that calls AppDataStore.Get*()
    /// will continue to compile and will receive live database data.
    /// </summary>
    public static class AppDataStore
    {
        #region 1. USERS & LOGIN DATA TABLE
        /// <summary>Returns all registered users from MachineHubDB.</summary>
        public static DataTable GetUsersDataTable()
        {
            return DbHelper.GetUsers();
        }

        /// <summary>Returns recent login sessions from MachineHubDB.</summary>
        public static DataTable GetLoginSessionsDataTable()
        {
            return DbHelper.GetLoginSessions();
        }
        #endregion

        #region 2. MACHINES DATA TABLE
        /// <summary>Returns all machines from MachineHubDB.</summary>
        public static DataTable GetMachinesDataTable()
        {
            return DbHelper.GetMachines();
        }
        #endregion

        #region 3. BOOKINGS DATA TABLE
        /// <summary>
        /// Returns bookings for the currently logged-in user from MachineHubDB.
        /// Falls back to all demo bookings if no HTTP context.
        /// </summary>
        public static DataTable GetBookingsDataTable()
        {
            try
            {
                if (HttpContext.Current != null &&
                    HttpContext.Current.User != null &&
                    HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    return DbHelper.GetBookingsByUser(HttpContext.Current.User.Identity.Name);
                }
            }
            catch { }

            // Fallback: return full booking summary view
            return DbHelper.GetBookingSummary();
        }
        #endregion

        #region 4. PAYMENTS / TRANSACTIONS DATA TABLE
        /// <summary>Returns all payments from MachineHubDB.</summary>
        public static DataTable GetPaymentsDataTable()
        {
            return DbHelper.GetPayments();
        }
        #endregion

        #region 5. CATEGORIES DATA TABLE
        /// <summary>Returns all active categories from MachineHubDB.</summary>
        public static DataTable GetCategoriesDataTable()
        {
            return DbHelper.GetCategories();
        }
        #endregion
    }
}
