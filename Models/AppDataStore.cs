using System;
using System.Data;
using System.Web;

namespace machinehub
{
    /// <summary>
    /// Centralized .NET DataTable Store for MachineHub.
    /// Provides System.Data.DataTable structures for Users (Login/Register), 
    /// Machines, Bookings, Payments, and Categories.
    /// </summary>
    public static class AppDataStore
    {
        #region 1. USERS & LOGIN DATA TABLE
        public static DataTable GetUsersDataTable()
        {
            DataTable dt = new DataTable("Users");
            dt.Columns.Add("UserId", typeof(int));
            dt.Columns.Add("FullName", typeof(string));
            dt.Columns.Add("Email", typeof(string));
            dt.Columns.Add("Phone", typeof(string));
            dt.Columns.Add("Role", typeof(string));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("CreatedDate", typeof(string));

            // Populate from UserStore file or defaults
            int id = 1;
            dt.Rows.Add(id++, "Dhruv Gohel", "machinehub@export.com", "+91 88546 59695", "Admin", "Active", "01 Oct 2026");
            dt.Rows.Add(id++, "John Doe", "john@example.com", "+91 98765 43210", "Customer", "Active", "05 Oct 2026");
            dt.Rows.Add(id++, "Amit Patel", "amit.patel@gmail.com", "+91 98250 12345", "Customer", "Active", "10 Oct 2026");

            return dt;
        }

        public static DataTable GetLoginSessionsDataTable()
        {
            DataTable dt = new DataTable("LoginSessions");
            dt.Columns.Add("SessionId", typeof(string));
            dt.Columns.Add("Email", typeof(string));
            dt.Columns.Add("FullName", typeof(string));
            dt.Columns.Add("LoginTime", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            dt.Rows.Add("SESS-1001", "machinehub@export.com", "Dhruv Gohel", DateTime.Now.ToString("dd MMM yyyy HH:mm"), "Success");
            return dt;
        }
        #endregion

        #region 2. MACHINES DATA TABLE
        public static DataTable GetMachinesDataTable()
        {
            DataTable dt = new DataTable("Machines");
            dt.Columns.Add("MachineId", typeof(string));
            dt.Columns.Add("Brand", typeof(string));
            dt.Columns.Add("Model", typeof(string));
            dt.Columns.Add("Category", typeof(string));
            dt.Columns.Add("Weight", typeof(string));
            dt.Columns.Add("Power", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Columns.Add("DailyRate", typeof(string));
            dt.Columns.Add("DailyRateVal", typeof(int));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("BadgeClass", typeof(string));
            dt.Columns.Add("ImageUrl", typeof(string));
            dt.Columns.Add("RentUrl", typeof(string));
            dt.Columns.Add("IsAvailable", typeof(bool));

            dt.Rows.Add("CAT-320", "CATERPILLAR", "320 Hydraulic Excavator", "Excavator", "22,500 kg", "172 HP", "Mumbai Depot", "28,000", 28000, "Available", "mh-badge-available", "https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=600&q=80", "SelectDate.aspx?machine=CAT320", true);
            dt.Rows.Add("KOM-210", "KOMATSU", "PC210LC-11 Excavator", "Excavator", "22.1t", "165 HP", "Pune Depot", "14,500", 14500, "Available", "mh-badge-available", "https://images.unsplash.com/photo-1579847188804-ecba0e2ea330?auto=format&fit=crop&w=600&q=80", "SelectDate.aspx?machine=PC210LC", true);
            dt.Rows.Add("VOL-200", "VOLVO CE", "EC200E Crawler", "Excavator", "20.3t", "154 HP", "Chennai Depot", "13,000", 13000, "Maintenance", "mh-badge-maintenance", "https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80", "#", false);
            dt.Rows.Add("JCB-220", "JCB", "220X Tracked Excavator", "Excavator", "22.7t", "173 HP", "Delhi Depot", "15,200", 15200, "Available", "mh-badge-available", "https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&w=600&q=80", "SelectDate.aspx?machine=JCB220X", true);
            dt.Rows.Add("HIT-210", "HITACHI", "ZAXIS210LC-6", "Excavator", "21.5t", "163 HP", "Bangalore Depot", "14,800", 14800, "Rented", "mh-badge-rented", "https://images.unsplash.com/photo-1504307651254-35680f356dfd?auto=format&fit=crop&w=600&q=80", "#", false);

            return dt;
        }
        #endregion

        #region 3. BOOKINGS DATA TABLE
        public static DataTable GetBookingsDataTable()
        {
            DataTable dt = new DataTable("Bookings");
            dt.Columns.Add("BookingId", typeof(string));
            dt.Columns.Add("EquipmentName", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Columns.Add("Duration", typeof(string));
            dt.Columns.Add("TotalCost", typeof(string));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("BadgeClass", typeof(string));
            dt.Columns.Add("ImageUrl", typeof(string));
            dt.Columns.Add("ActionUrl", typeof(string));

            dt.Rows.Add("BKG-9011C", "Cummins 500kVA DG Set", "Site Beta, Pune", "01 Nov - 15 Nov 2026", "35,000", "Pending", "pending", "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?auto=format&fit=crop&w=200&q=80", "BookingDetail.aspx");
            dt.Rows.Add("BKG-8421A", "Genie S-85 Boom Lift", "Logistics Hub, Chennai", "05 Aug - 20 Aug 2026", "55,000", "Completed", "completed", "https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=200&q=80", "BookingDetail.aspx");
            dt.Rows.Add("BKG-7721B", "Tata Hitachi ZAXIS 210", "Industrial Area, Bangalore", "10 Jul - 25 Jul 2026", "62,000", "Completed", "completed", "https://images.unsplash.com/photo-1621929747188-0b4dc28498d2?auto=format&fit=crop&w=200&q=80", "BookingDetail.aspx");

            return dt;
        }
        #endregion

        #region 4. PAYMENTS / TRANSACTIONS DATA TABLE
        public static DataTable GetPaymentsDataTable()
        {
            DataTable dt = new DataTable("Payments");
            dt.Columns.Add("PaymentId", typeof(string));
            dt.Columns.Add("BookingId", typeof(string));
            dt.Columns.Add("Amount", typeof(string));
            dt.Columns.Add("PaymentMethod", typeof(string));
            dt.Columns.Add("TransactionDate", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            dt.Rows.Add("TXN-9981A", "BKG-8892A", "45,000", "Corporate Account", "10 Oct 2026", "Success");
            dt.Rows.Add("TXN-9982B", "BKG-8421A", "55,000", "Credit Card (Visa)", "03 Aug 2026", "Success");
            dt.Rows.Add("TXN-9983C", "BKG-7721B", "62,000", "UPI NetBanking", "08 Jul 2026", "Success");

            return dt;
        }
        #endregion

        #region 5. CATEGORIES DATA TABLE
        public static DataTable GetCategoriesDataTable()
        {
            DataTable dt = new DataTable("Categories");
            dt.Columns.Add("CategoryId", typeof(int));
            dt.Columns.Add("CategoryName", typeof(string));
            dt.Columns.Add("MachineCount", typeof(int));
            dt.Columns.Add("PriceRange", typeof(string));
            dt.Columns.Add("Description", typeof(string));

            dt.Rows.Add(1, "Excavators", 128, "13,000 - 28,000/day", "Hydraulic & crawler excavators");
            dt.Rows.Add(2, "Earthmoving", 85, "12,000 - 25,000/day", "Dozers, graders, and compactors");
            dt.Rows.Add(3, "Aerial Lifts", 64, "8,000 - 20,000/day", "Boom lifts & scissor lifts");
            dt.Rows.Add(4, "Generators & Power", 45, "5,000 - 18,000/day", "Diesel generator sets (DG)");
            dt.Rows.Add(5, "Material Handling", 52, "10,000 - 22,000/day", "Cranes & forklifts");

            return dt;
        }
        #endregion
    }
}
