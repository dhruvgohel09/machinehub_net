using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace machinehub
{
    /// <summary>
    /// Central database helper for MachineHub.
    /// Wraps all CRUD operations against MachineHubDB (SQL Server LocalDB / App_Data\MachineHubDB.mdf).
    ///
    /// Tables:
    ///   1. Users          — registered user accounts (with PBKDF2 password hashing)
    ///   2. LoginSessions  — login history / session tracking
    ///   3. Categories     — equipment categories
    ///   4. Machines       — machine/equipment inventory
    ///   5. Bookings       — rental bookings
    ///   6. Payments       — payment / transaction records
    /// </summary>
    public static class DbHelper
    {
        // ----------------------------------------------------------------
        // Connection
        // ----------------------------------------------------------------
        private static string ConnStr =>
            ConfigurationManager.ConnectionStrings["MachineHubDB"].ConnectionString;

        private static SqlConnection OpenConn()
        {
            var conn = new SqlConnection(ConnStr);
            conn.Open();
            return conn;
        }

        // ================================================================
        // PASSWORD HASHING (PBKDF2 — same algorithm as UserStore)
        // ================================================================

        /// <summary>Generates a new random 16-byte salt, returns as base64.</summary>
        public static string GenerateSalt()
        {
            var salt = new byte[16];
            using (var rng = new RNGCryptoServiceProvider())
                rng.GetBytes(salt);
            return Convert.ToBase64String(salt);
        }

        /// <summary>Hashes password with PBKDF2 + provided base64 salt. Returns base64 hash.</summary>
        public static string HashPassword(string password, string base64Salt)
        {
            byte[] salt = Convert.FromBase64String(base64Salt);
            using (var kdf = new Rfc2898DeriveBytes(password, salt, 10000))
                return Convert.ToBase64String(kdf.GetBytes(32));
        }

        /// <summary>
        /// Validates email + password against DB.
        /// Returns user's FullName on success, null on failure.
        /// </summary>
        public static string ValidateLogin(string email, string password)
        {
            const string sql = "SELECT FullName, PasswordHash, PasswordSalt FROM dbo.Users WHERE Email = @Email AND Status = 'Active'";
            var dt = ExecuteQuery(sql, new SqlParameter("@Email", email.ToLower()));
            if (dt.Rows.Count == 0) return null;

            var row    = dt.Rows[0];
            string salt = row["PasswordSalt"].ToString();
            string hash = row["PasswordHash"].ToString();
            if (string.IsNullOrEmpty(salt) || string.IsNullOrEmpty(hash)) return null;

            return HashPassword(password, salt) == hash ? row["FullName"].ToString() : null;
        }

        // ================================================================
        // TABLE 1 — USERS
        // ================================================================

        /// <summary>Returns all users as a DataTable.</summary>
        public static DataTable GetUsers()
        {
            const string sql = @"
                SELECT UserId, FullName, Email, Phone, Role, Status,
                       FORMAT(CreatedDate,'dd MMM yyyy') AS CreatedDate
                FROM   dbo.Users
                ORDER  BY UserId";
            return ExecuteQuery(sql);
        }

        /// <summary>Returns user DataRow for a given email, or null.</summary>
        public static DataRow GetUserByEmail(string email)
        {
            const string sql = "SELECT * FROM dbo.Users WHERE Email = @Email";
            var dt = ExecuteQuery(sql, new SqlParameter("@Email", email.ToLower()));
            return dt.Rows.Count > 0 ? dt.Rows[0] : null;
        }

        /// <summary>Returns true if an account with that email already exists.</summary>
        public static bool UserExists(string email)
        {
            const string sql = "SELECT COUNT(1) FROM dbo.Users WHERE Email = @Email";
            return (int)ExecuteScalar(sql, new SqlParameter("@Email", email.ToLower())) > 0;
        }

        /// <summary>
        /// Creates a new user with PBKDF2 hashed password.
        /// Returns false if email already registered.
        /// </summary>
        public static bool CreateUser(string email, string name, string phone, string password, string role = "Customer")
        {
            if (UserExists(email)) return false;

            string salt = GenerateSalt();
            string hash = HashPassword(password, salt);

            const string sql = @"
                INSERT INTO dbo.Users (FullName, Email, Phone, PasswordHash, PasswordSalt, Role, Status)
                VALUES (@Name, @Email, @Phone, @Hash, @Salt, @Role, 'Active')";
            ExecuteNonQuery(sql,
                new SqlParameter("@Name",  name),
                new SqlParameter("@Email", email.ToLower()),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@Hash",  hash),
                new SqlParameter("@Salt",  salt),
                new SqlParameter("@Role",  role));
            return true;
        }

        /// <summary>Updates a user's password with a fresh PBKDF2 hash.</summary>
        public static void SetPassword(string email, string newPassword)
        {
            string salt = GenerateSalt();
            string hash = HashPassword(newPassword, salt);

            const string sql = @"
                UPDATE dbo.Users SET PasswordHash = @Hash, PasswordSalt = @Salt
                WHERE  Email = @Email";
            ExecuteNonQuery(sql,
                new SqlParameter("@Hash",  hash),
                new SqlParameter("@Salt",  salt),
                new SqlParameter("@Email", email.ToLower()));
        }

        /// <summary>Updates a user's full name and phone.</summary>
        public static void UpdateUserProfile(string email, string name, string phone)
        {
            const string sql = @"
                UPDATE dbo.Users SET FullName = @Name, Phone = @Phone
                WHERE  Email = @Email";
            ExecuteNonQuery(sql,
                new SqlParameter("@Name",  name),
                new SqlParameter("@Phone", phone),
                new SqlParameter("@Email", email.ToLower()));
        }

        // ================================================================
        // TABLE 2 — LOGIN SESSIONS
        // ================================================================

        /// <summary>Records a new login session entry.</summary>
        public static void LogSession(string sessionId, int userId, string email,
                                      string fullName, string ipAddress = null,
                                      string status = "Success")
        {
            const string sql = @"
                INSERT INTO dbo.LoginSessions (SessionId, UserId, Email, FullName, IpAddress, Status)
                VALUES (@Sid, @Uid, @Email, @Name, @Ip, @Status)";
            ExecuteNonQuery(sql,
                new SqlParameter("@Sid",    sessionId),
                new SqlParameter("@Uid",    userId),
                new SqlParameter("@Email",  email),
                new SqlParameter("@Name",   fullName),
                new SqlParameter("@Ip",     (object)ipAddress ?? DBNull.Value),
                new SqlParameter("@Status", status));
        }

        /// <summary>Returns recent login sessions as a DataTable.</summary>
        public static DataTable GetLoginSessions(int top = 50)
        {
            string sql = $@"
                SELECT TOP {top} SessionId, Email, FullName,
                       FORMAT(LoginTime,'dd MMM yyyy HH:mm') AS LoginTime, Status
                FROM   dbo.LoginSessions
                ORDER  BY LoginTime DESC";
            return ExecuteQuery(sql);
        }

        // ================================================================
        // TABLE 3 — CATEGORIES
        // ================================================================

        /// <summary>Returns all active categories.</summary>
        public static DataTable GetCategories()
        {
            const string sql = @"
                SELECT CategoryId, CategoryName, MachineCount, PriceRange, Description
                FROM   dbo.Categories
                WHERE  IsActive = 1
                ORDER  BY CategoryId";
            return ExecuteQuery(sql);
        }

        // ================================================================
        // TABLE 4 — MACHINES
        // ================================================================

        /// <summary>Returns all machines with their category name.</summary>
        public static DataTable GetMachines(string categoryFilter = null)
        {
            string sql = @"
                SELECT m.MachineId, m.Brand, m.ModelName AS Model, c.CategoryName AS Category,
                       m.Weight, m.Power, m.Location, m.DailyRate, m.DailyRateVal,
                       m.Status, m.BadgeClass, m.ImageUrl, m.RentUrl, m.IsAvailable
                FROM   dbo.Machines m
                INNER  JOIN dbo.Categories c ON m.CategoryId = c.CategoryId";

            if (!string.IsNullOrEmpty(categoryFilter))
                sql += " WHERE c.CategoryName = @Cat ORDER BY m.MachineId";
            else
                sql += " ORDER BY m.MachineId";

            if (!string.IsNullOrEmpty(categoryFilter))
                return ExecuteQuery(sql, new SqlParameter("@Cat", categoryFilter));

            return ExecuteQuery(sql);
        }

        /// <summary>Returns a single machine DataRow by MachineId.</summary>
        public static DataRow GetMachineById(string machineId)
        {
            const string sql = @"
                SELECT m.*, c.CategoryName
                FROM   dbo.Machines m
                INNER  JOIN dbo.Categories c ON m.CategoryId = c.CategoryId
                WHERE  m.MachineId = @Id";
            var dt = ExecuteQuery(sql, new SqlParameter("@Id", machineId));
            return dt.Rows.Count > 0 ? dt.Rows[0] : null;
        }

        // ================================================================
        // TABLE 5 — BOOKINGS
        // ================================================================

        /// <summary>Returns all bookings for a user (by email).</summary>
        public static DataTable GetBookingsByUser(string email)
        {
            const string sql = @"
                SELECT b.BookingId, b.EquipmentName, b.Location, b.Duration,
                       CAST(b.TotalCost AS NVARCHAR) AS TotalCost,
                       b.Status, b.BadgeClass, b.ImageUrl, b.ActionUrl
                FROM   dbo.Bookings b
                INNER  JOIN dbo.Users u ON b.UserId = u.UserId
                WHERE  u.Email = @Email
                ORDER  BY b.BookingDate DESC";
            return ExecuteQuery(sql, new SqlParameter("@Email", email.ToLower()));
        }

        /// <summary>Returns a single booking DataRow by BookingId.</summary>
        public static DataRow GetBookingById(string bookingId)
        {
            const string sql = @"
                SELECT b.*, u.FullName AS CustomerName, u.Email AS CustomerEmail,
                       m.Brand, m.ModelName, c.CategoryName
                FROM   dbo.Bookings b
                INNER  JOIN dbo.Users     u ON b.UserId    = u.UserId
                INNER  JOIN dbo.Machines  m ON b.MachineId = m.MachineId
                INNER  JOIN dbo.Categories c ON m.CategoryId = c.CategoryId
                WHERE  b.BookingId = @Id";
            var dt = ExecuteQuery(sql, new SqlParameter("@Id", bookingId));
            return dt.Rows.Count > 0 ? dt.Rows[0] : null;
        }

        /// <summary>Creates a new booking record. Returns the generated BookingId.</summary>
        public static string CreateBooking(
            int userId, string machineId, string equipmentName,
            DateTime startDate, DateTime endDate, int durationDays,
            string duration, int rentalFee, int deliveryFee, int taxes, int totalCost,
            string deliveryFullName, string deliveryEmail, string deliveryPhone,
            string deliveryStreet, string deliveryCity, string deliveryState,
            string deliveryPin, string deliveryLandmark, string projectName,
            string location, string imageUrl = null)
        {
            var rnd   = new Random();
            string bkg = "BKG-" + rnd.Next(7000, 9999) + (char)('A' + rnd.Next(0, 3));

            const string sql = @"
                INSERT INTO dbo.Bookings
                    (BookingId, UserId, MachineId, EquipmentName,
                     StartDate, EndDate, DurationDays, Duration,
                     RentalFee, DeliveryFee, Taxes, TotalCost,
                     DeliveryFullName, DeliveryEmail, DeliveryPhone,
                     DeliveryStreet, DeliveryCity, DeliveryState,
                     DeliveryPin, DeliveryLandmark, ProjectName, Location,
                     Status, BadgeClass, ImageUrl, ActionUrl)
                VALUES
                    (@Bkg, @Uid, @Mid, @Equip,
                     @Sd, @Ed, @Days, @Dur,
                     @Rent, @Del, @Tax, @Tot,
                     @DName, @DEmail, @DPhone,
                     @DStreet, @DCity, @DState,
                     @DPin, @DLand, @Proj, @Loc,
                     'Pending', 'pending', @Img, 'BookingDetail.aspx')";

            ExecuteNonQuery(sql,
                new SqlParameter("@Bkg",    bkg),
                new SqlParameter("@Uid",    userId),
                new SqlParameter("@Mid",    machineId),
                new SqlParameter("@Equip",  equipmentName),
                new SqlParameter("@Sd",     startDate),
                new SqlParameter("@Ed",     endDate),
                new SqlParameter("@Days",   durationDays),
                new SqlParameter("@Dur",    duration ?? ""),
                new SqlParameter("@Rent",   rentalFee),
                new SqlParameter("@Del",    deliveryFee),
                new SqlParameter("@Tax",    taxes),
                new SqlParameter("@Tot",    totalCost),
                new SqlParameter("@DName",   deliveryFullName ?? ""),
                new SqlParameter("@DEmail",  deliveryEmail    ?? ""),
                new SqlParameter("@DPhone",  deliveryPhone    ?? ""),
                new SqlParameter("@DStreet", deliveryStreet   ?? ""),
                new SqlParameter("@DCity",   deliveryCity     ?? ""),
                new SqlParameter("@DState",  deliveryState    ?? ""),
                new SqlParameter("@DPin",    deliveryPin      ?? ""),
                new SqlParameter("@DLand",   (object)deliveryLandmark ?? DBNull.Value),
                new SqlParameter("@Proj",    (object)projectName      ?? DBNull.Value),
                new SqlParameter("@Loc",     (object)location         ?? DBNull.Value),
                new SqlParameter("@Img",     (object)imageUrl         ?? DBNull.Value));

            return bkg;
        }

        // ================================================================
        // TABLE 6 — PAYMENTS
        // ================================================================

        /// <summary>Returns all payments as a DataTable.</summary>
        public static DataTable GetPayments()
        {
            const string sql = @"
                SELECT PaymentId, BookingId,
                       CAST(Amount AS NVARCHAR) AS Amount,
                       PaymentMethod,
                       FORMAT(TransactionDate,'dd MMM yyyy') AS TransactionDate,
                       Status
                FROM   dbo.Payments
                ORDER  BY TransactionDate DESC";
            return ExecuteQuery(sql);
        }

        /// <summary>Returns payments for a specific user.</summary>
        public static DataTable GetPaymentsByUser(string email)
        {
            const string sql = @"
                SELECT p.PaymentId, p.BookingId,
                       CAST(p.Amount AS NVARCHAR) AS Amount,
                       p.PaymentMethod,
                       FORMAT(p.TransactionDate,'dd MMM yyyy') AS TransactionDate,
                       p.Status
                FROM   dbo.Payments p
                INNER  JOIN dbo.Users u ON p.UserId = u.UserId
                WHERE  u.Email = @Email
                ORDER  BY p.TransactionDate DESC";
            return ExecuteQuery(sql, new SqlParameter("@Email", email.ToLower()));
        }

        /// <summary>Records a new payment and marks booking as Confirmed. Returns TransactionId.</summary>
        public static string CreatePayment(string bookingId, int userId, int amount,
                                           string paymentMethod, string cardMasked = null,
                                           string nameOnCard = null)
        {
            var rnd = new Random();
            string txn = "TXN-" + DateTime.Now.ToString("yyyyMMdd") + "-" + rnd.Next(1000, 9999);

            const string ins = @"
                INSERT INTO dbo.Payments (PaymentId, BookingId, UserId, Amount, PaymentMethod, CardMasked, NameOnCard, Status)
                VALUES (@Txn, @Bkg, @Uid, @Amt, @Method, @Card, @Name, 'Success')";
            ExecuteNonQuery(ins,
                new SqlParameter("@Txn",    txn),
                new SqlParameter("@Bkg",    bookingId),
                new SqlParameter("@Uid",    userId),
                new SqlParameter("@Amt",    amount),
                new SqlParameter("@Method", paymentMethod),
                new SqlParameter("@Card",   (object)cardMasked ?? DBNull.Value),
                new SqlParameter("@Name",   (object)nameOnCard ?? DBNull.Value));

            // Mark booking as Confirmed
            const string upd = "UPDATE dbo.Bookings SET Status='Confirmed', BadgeClass='confirmed' WHERE BookingId=@Bkg";
            ExecuteNonQuery(upd, new SqlParameter("@Bkg", bookingId));

            return txn;
        }

        // ================================================================
        // VIEW — BookingSummary
        // ================================================================

        /// <summary>Returns the full booking summary view (admin use).</summary>
        public static DataTable GetBookingSummary()
        {
            return ExecuteQuery("SELECT * FROM dbo.vw_BookingSummary ORDER BY BookingDate DESC");
        }

        // ================================================================
        // PRIVATE HELPERS
        // ================================================================

        private static DataTable ExecuteQuery(string sql, params SqlParameter[] prms)
        {
            using (var conn = OpenConn())
            using (var cmd  = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                var dt = new DataTable();
                using (var da = new SqlDataAdapter(cmd))
                    da.Fill(dt);
                return dt;
            }
        }

        private static void ExecuteNonQuery(string sql, params SqlParameter[] prms)
        {
            using (var conn = OpenConn())
            using (var cmd  = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                cmd.ExecuteNonQuery();
            }
        }

        private static object ExecuteScalar(string sql, params SqlParameter[] prms)
        {
            using (var conn = OpenConn())
            using (var cmd  = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                return cmd.ExecuteScalar();
            }
        }
    }
}
