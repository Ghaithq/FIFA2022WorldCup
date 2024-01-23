using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
using System.Numerics;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Data;
//using Microsoft.AspNetCore.Mvc.Rendering;

namespace DBProjectClone.Pages
{
    public class bookingpageModel : PageModel
    {
        public List<data_type> typelist = new List<data_type>();
        public List<string> seat = new List<string>();
        public transaction trans = new transaction();
        public string errormesssage1 = "";

        public void OnGet(string StadiumName, string TicketType, string MatchID)
        {
            trans.ID = int.Parse(MatchID);
            trans.StadiumName = StadiumName;
            trans.UserName = HttpContext.Session.GetString("Username");
            trans.TicketType = TicketType;
            TempData["StadiumName"] = StadiumName;
            TempData["TicketType"] = TicketType;
            TempData["MatchID"] = MatchID;

            try
            {
                String connectionstring = "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    String sql = "(select Seat_Row,Seat_Column from Seat where TicketType='" + trans.TicketType + "' and StadiumName='" + trans.StadiumName + "' )  except   ( select Seat_Row,Seat_Column from Match_Transaction where Ticket_Type='" + trans.TicketType + "' AND ID=" + trans.ID + ")";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string s = reader.GetInt32(0).ToString() + "," + reader.GetInt32(1).ToString();
                                seat.Add(s);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage1 = "Error Loading Seats";
                return;
            }
        }

        public void OnPost()
        {
            string seat = Request.Form["Seat"];
            String row;
            String column;
            if (seat == null || seat.Length == 0)
            {
                errormesssage1 = "Select A Seat";
                return;
            }
            else
            {
                row = seat.Substring(0, seat.IndexOf(','));
                column = seat.Substring(seat.IndexOf(',') + 1);
            }
            trans.ID = int.Parse(TempData["MatchID"].ToString());
            trans.StadiumName = TempData["StadiumName"].ToString();
            trans.UserName = HttpContext.Session.GetString("Username");
            trans.TicketType = TempData["TicketType"].ToString();
            try
            {
                String connectionstring = "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    String sql = "insert into Match_Transaction Values('" + trans.ID + "'," + row + "," + column + ", '" + trans.StadiumName + "' , '" + trans.UserName + "' , '" + trans.TicketType + "')";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage1 = ex.Message;
                return;
            }



            Response.Redirect("/");
        }


    }







    public class data_type
    {
        public String type;
        public int price;
    }
    public class transaction
    {
        public int ID;
        public String StadiumName;
        public int SeatNumber;
        public String UserName;
        public String TicketType;
    }

}
