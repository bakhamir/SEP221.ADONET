using System.Data.SqlClient;

namespace MyConsole
{
    internal class Program
    {
         static string connectionstring1 = "Server=214-2;Database=testdb;Trusted_Connection=True";
         static string connectionstring2 = "";
        static void testconnection()
        {
            using (SqlConnection db = new SqlConnection(connectionstring1))
            {
                db.Open();
                Console.WriteLine(db.State.ToString());
                db.Close();
                Console.WriteLine(db.State.ToString());
            }
        }
        static void Main(string[] args)
        {
            testconnection();
            Console.WriteLine("Hello, World!");
        }

    }
}