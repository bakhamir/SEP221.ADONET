using System.Data.SqlClient;

namespace MyConsole
{
    internal class Program
    {
         static string connectionstring1 = "Server=214-2;Database=testdb;Trusted_Connection=True";
         static string connectionstring2 = "Server=214-2;Database=testdb;User Id=user1;Password=111;";
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
        static void testconnection1()
        {
            using (SqlConnection db = new SqlConnection(connectionstring2))
            {
                db.Open();
                Console.WriteLine(db.State.ToString());
                db.Close();
                Console.WriteLine(db.State.ToString());
            }
        }

        static void getdate()
        {
            using (SqlConnection db = new SqlConnection(connectionstring1))
            {
                db.Open();
                using(SqlCommand cmd = new SqlCommand("Select GETDATE()", db))
                {
                    var ob = cmd.ExecuteScalar();
                    if (ob != null)
                    {
                        Console.WriteLine(ob.ToString());
                    }
                    else
                        Console.WriteLine("ERR OBJ EMPTY");
                }
                Console.WriteLine();
                db.Close();
            }
        }

        static void Main(string[] args)
        {
            //testconnection();
            //testconnection1();
            getdate();
            Console.WriteLine("Hello, World!");
        }

    }
}