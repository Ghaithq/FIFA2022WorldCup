using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data;
using System.Data.SqlClient;

namespace DBProjectClone.Pages
{
    public class ViewUsersModel : PageModel
    {

        SqlDataReader UserList;
        public DataTable UserTable;
        SqlConnection connection;

        public void OnGet()
        {
            try
            {
                String connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    String query = "SELECT * FROM UserAccount Where Type=2";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        UserList = command.ExecuteReader();
                        UserTable = new DataTable();
                        UserTable.Load(UserList);
                        UserList.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write("Exception: " + ex.ToString());
            }
        }
    }
}
