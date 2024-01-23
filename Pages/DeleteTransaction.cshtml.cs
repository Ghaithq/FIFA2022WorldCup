using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
namespace DBProjectClone.Pages
{
    public class DeleteTransactionModel : PageModel
    {
        //[HttpGet("{id}/{StadiumName}/{SeatRow}/{SeatColumn}")]
        public void OnGet(string ID, string StadiumName, string SeatRow, string SeatColumn)
        {
            try
            {
                string connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    connection.Open();

                    string DeleteQuery = "DELETE FROM Match_Transaction WHERE ID=" + ID + " and Seat_Row=" + SeatRow + " and Seat_Column=" + SeatColumn + " and Stadium_Name='" + StadiumName+"';";
                    using (SqlCommand command = new SqlCommand(DeleteQuery, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }


                Response.Redirect("/");

            }
            catch (Exception ex)
            {
            }
        }
    }
}
