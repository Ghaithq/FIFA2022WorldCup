using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
namespace DBProjectClone.Pages
{
    public class EditReservationModel : PageModel
    {
        public List<string> rows = new List<string>();
        public List<string> columns = new List<string>();
        public transaction trans = new transaction();
        public string errormesssage1 = "";
        public string StadiumName;
        public string MatchID;
        public string UserName;
        public string TicketType;

        public List<string> seats=new List<string>();
        public void OnGet(string StadiumName,string UserName,string TicketType,string MatchID)
        {
            trans.ID = int.Parse(MatchID);
            trans.StadiumName = StadiumName;
            trans.UserName = UserName;
            trans.TicketType =TicketType;
            TempData["StadiumName"] = StadiumName;
            TempData["UserName"] = UserName;
            TempData["TicketType"] = TicketType;
            TempData["MatchID"] = MatchID;
           
            try
            {
                String connectionstring = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    String sql = "(select Seat_Row,Seat_Column from Seat where TicketType='" + trans.TicketType + "' and StadiumName='" + trans.StadiumName + "' )  except   ( select Seat_Row,Seat_Column from Match_Transaction where Ticket_Type='" + trans.TicketType + "' AND ID=" + trans.ID + " AND Stadium_Name = '" + trans.StadiumName + "')";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string s = reader["Seat_Row"] + "," + reader["Seat_Column"];
                                seats.Add(s);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage1 = ex.Message;
                return;
            }
        }

        public void OnPost()
        {
            string row, column;
            string seat = Request.Form["Seats"];
            row=seat.Substring(0, seat.IndexOf(','));
            column = seat.Substring(seat.IndexOf(',') + 1);
            String connectionString = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
            string sql = "UPDATE Match_Transaction Set Seat_row=" + row + ", Seat_column=" + column + " where ID=" + TempData["MatchID"]+ " and Stadium_Name='" + TempData["StadiumName"] + "' and UserName='" + TempData["UserName"] + "' and Ticket_Type='" + TempData["TicketType"] + "'";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using(SqlCommand command = new SqlCommand(sql,connection))
                        command.ExecuteNonQuery();

                }
            }
            catch(Exception ex)
            {
                TempData["errorMsg"] = ex.Message;
                return;
            }
            Response.Redirect("/");
        }

    }


    





}

