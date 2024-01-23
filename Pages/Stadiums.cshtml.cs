using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class StadiumsModel : PageModel
    {
        public List<Stadium> Stadiums = new List<Stadium>();
        public void OnGet()
        {
            try
            {
                String connectionString = "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT * FROM Stadium";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Stadium stadium = new Stadium();
                                stadium.name = reader["StadiumName"].ToString();
                                stadium.capacity = reader["StadiumCapacity"].ToString();
                                stadium.location = reader["StadiumLocation"].ToString();
                                stadium.imgURL = reader["imgURL"].ToString();
                                Stadiums.Add(stadium);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }


    public class Stadium
    {
        public string name;
        public string capacity;
        public string location;
        public string imgURL;
    }
}
