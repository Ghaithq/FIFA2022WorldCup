using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
namespace DBProjectClone.Pages
{
    public class DeleteUpComingMatchModel : PageModel
    {
        public void OnGet()
        {

            string matchID = Request.Query["id"];
            string connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                connection.Open();
                string DeleteQuery2 = "DELETE FROM UpcomingMatch WHERE ID=" + matchID;
                string DeleteQuery = "DELETE FROM Match WHERE ID=" + matchID;
                using (SqlCommand command = new SqlCommand(DeleteQuery2, connection))
                {
                    command.ExecuteNonQuery();
                }
                using (SqlCommand command = new SqlCommand(DeleteQuery, connection))
                {
                    command.ExecuteNonQuery();
                }
            }


            Response.Redirect("Upcoming");


        }
    }
}