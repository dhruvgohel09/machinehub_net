using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace machinehub
{
    // Simple file based user store (App_Data/users.txt). Passwords are stored as PBKDF2 hash + salt.
    public static class UserStore
    {
        private static readonly object Lock = new object();
        private static string FilePath { get { return HttpContext.Current.Server.MapPath("~/App_Data/users.txt"); } }

        private static string Hash(string password, byte[] salt)
        {
            using (var kdf = new Rfc2898DeriveBytes(password, salt, 10000))
                return Convert.ToBase64String(kdf.GetBytes(32));
        }

        private static void EnsureDirectory()
        {
            var dir = Path.GetDirectoryName(FilePath);
            if (!string.IsNullOrEmpty(dir) && !Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }
        }

        private static string[][] Load()
        {
            EnsureDirectory();
            if (!File.Exists(FilePath)) return new string[0][];
            return File.ReadAllLines(FilePath).Where(l => l.Trim().Length > 0).Select(l => l.Split('|')).Where(p => p.Length == 5).ToArray();
        }

        public static bool Exists(string email)
        {
            lock (Lock) { return Load().Any(u => u[0].Equals(email, StringComparison.OrdinalIgnoreCase)); }
        }

        public static bool Create(string email, string name, string phone, string password)
        {
            lock (Lock)
            {
                if (Exists(email)) return false;
                var salt = new byte[16];
                using (var rng = new RNGCryptoServiceProvider()) rng.GetBytes(salt);
                var line = string.Join("|", email.ToLower(), name.Replace("|", ""), phone.Replace("|", ""), Convert.ToBase64String(salt), Hash(password, salt));
                File.AppendAllText(FilePath, line + Environment.NewLine);
                return true;
            }
        }

        // returns user's full name if credentials are right, otherwise null
        public static string Validate(string email, string password)
        {
            lock (Lock)
            {
                var u = Load().FirstOrDefault(x => x[0].Equals(email, StringComparison.OrdinalIgnoreCase));
                if (u == null) return null;
                return Hash(password, Convert.FromBase64String(u[3])) == u[4] ? u[1] : null;
            }
        }

        public static void SetPassword(string email, string password)
        {
            lock (Lock)
            {
                var salt = new byte[16];
                using (var rng = new RNGCryptoServiceProvider()) rng.GetBytes(salt);
                var lines = Load().Select(u => u[0].Equals(email, StringComparison.OrdinalIgnoreCase)
                    ? string.Join("|", u[0], u[1], u[2], Convert.ToBase64String(salt), Hash(password, salt))
                    : string.Join("|", u)).ToArray();
                File.WriteAllLines(FilePath, lines);
            }
        }
    }
}
