using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class SelectTypeModel : PageModel
    {
        public List<data_type> typelist = new List<data_type>();
        public string errormesssage1 = "";


        public void OnGet(string StadiumName, string MatchID)
        {

            TempData["StadiumName"] = StadiumName;
            TempData["UserName"] = HttpContext.Session.GetString("Username");
            TempData["MatchID"] = MatchID;

            try
            {
                String connectionstring = "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    String sql = "select * from Ticket_Type";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                data_type dt = new data_type();
                                dt.type = reader["Type"].ToString();
                                dt.price = int.Parse(reader["Price"].ToString());
                                typelist.Add(dt);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage1 = "Error Loading Types";
                return;
            }
        }
        public void OnPost()
        {
            TempData["TicketType"] = Request.Form["TicketType"];
            string urll = "MatchID=" + TempData["MatchID"] + "&TicketType=" + TempData["TicketType"] + "&StadiumName=" + TempData["StadiumName"];
            Response.Redirect("/bookingpage?" + urll);
        }
    }
}
