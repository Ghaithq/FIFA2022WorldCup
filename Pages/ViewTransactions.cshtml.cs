using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class ViewTransactionsModel : PageModel
    {
        public List<Transaction> transactions = new List<Transaction>();
        public string UserName;
        public void OnGet()
        {
            UserName = Request.Query["id"];
            try
            {
                String connectionString = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT * FROM Match_Transaction Where UserName='"+UserName+"'";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Transaction transaction = new Transaction();
                                transaction.ID = reader["ID"].ToString();
                                transaction.SeatRow = reader["Seat_Row"].ToString();
                                transaction.SeatCol = reader["Seat_column"].ToString();
                                transaction.StadiumName = reader["Stadium_Name"].ToString();
                                transaction.Ticket_Type = reader["Ticket_Type"].ToString();
                                transactions.Add(transaction);
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


    public class Transaction
    {
        public string ID;
        public string SeatRow;
        public string SeatCol;
        public string StadiumName;
        public string Ticket_Type;

    }
}
