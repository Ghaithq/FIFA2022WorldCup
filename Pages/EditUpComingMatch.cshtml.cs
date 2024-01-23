using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class EditUpComingMatchModel : PageModel
    {
        public List<string> StadiumsUp = new List<string>();
        public List<string> Teams = new List<string>();
        public List<Referee> referees = new List<Referee>();
        public Match match = new Match();
        string MatchID;
        public void OnGet()
        {
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            match.ID = 1;
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ///



            String connectionString = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql1 = "Select * from Stadium";
                    string sql2 = "Select * from Team";
                    string sql3 = "Select * from Referee";
                    SqlCommand command1 = new SqlCommand(sql1, connection);
                    SqlCommand command2 = new SqlCommand(sql2, connection);
                    SqlCommand command3 = new SqlCommand(sql3, connection);

                    using (SqlDataReader reader = command1.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            StadiumsUp.Add(reader["StadiumName"].ToString());
                        }
                    }

                    using (SqlDataReader reader = command2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Teams.Add(reader["Nationality"].ToString());
                        }
                    }
                    using (SqlDataReader reader = command3.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Referee refe = new Referee();
                            refe.name = reader["R_Name"].ToString();
                            refe.id = reader["ID"].ToString();
                            referees.Add(refe);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["errorMsg"] = ex.Message;
            }
        }
        public void OnPost()
        {
            MatchID = Request.Query["id"];
            TempData["errorMsg"] = "";
            TempData["successMsg"] = "";
            try
            {
                if ( Request.Form["matchDate"] == ""
                    || Request.Form["MatchID"] == "" || Request.Form["Stage"] == "")
                {
                    TempData["errorMsg"] = "Please Fill All forms";
                    OnGet();
                    return;
                }
                
                if (!int.TryParse(Request.Form["Stage"], out int result2))
                {
                    TempData["errorMsg"] = "Please enter an integer Stage";
                    OnGet();
                    return;
                }


                //////////////////////////////////////////////////////////////////////////
                match.ID = int.Parse(MatchID);
                //////////////////////////////////////////////////////////////////////////
                match.Stadium = Request.Form["Stadium"];
                match.Team1 = Request.Form["Team1"];
                match.Team2 = Request.Form["Team2"];
                match.DateTime = Request.Form["matchDate"];
                match.stage = int.Parse(Request.Form["Stage"]);
                match.IDRef1 = int.Parse(Request.Form["Referee1"]);
                match.IDRef2 = int.Parse(Request.Form["Referee2"]);

                if (match.Team2 == match.Team1)
                {
                    TempData["errorMsg"] = "Please select two different teams";
                    OnGet();
                    return;
                }
                if (match.IDRef1 == match.IDRef2)
                {
                    TempData["errorMsg"] = "Please select two different referees";
                    OnGet();
                    return;
                }

                string sql41 = "select * from Match where MatchDateTime = '" + match.DateTime + "' and (" + "team1 = '" + match.Team1 + "' or team2 = '" + match.Team1 + "')";
                string sql42 = "select * from Match where MatchDateTime = '" + match.DateTime + "' and (" + "team1 = '" + match.Team2 + "' or team2 = '" + match.Team2 + "')";
                string sql51 = "select * from Match where MatchDateTime = '" + match.DateTime + "' and (" + "referee1 = " + match.IDRef1 + " or referee2 = " + match.IDRef1 + ")";
                string sql52 = "select * from Match where MatchDateTime = '" + match.DateTime + "' and (" + "referee1 = " + match.IDRef2 + " or referee2 = " + match.IDRef2 + ")";
                string sql6 = "select * from Match where stadium='" + match.Stadium + "' and MatchDateTime = '" + match.DateTime + "'";
                String connectionString = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                   
                    using (SqlCommand command = new SqlCommand(sql41, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                TempData["errorMsg"] = "Team1 has a match on this date";
                                connection.Close();
                                OnGet();
                                return;
                            }
                        }
                    }
                    using (SqlCommand command = new SqlCommand(sql42, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                TempData["errorMsg"] = "Team2 has a match on this date";
                                connection.Close();
                                OnGet();
                                return;
                            }
                        }
                    }
                    using (SqlCommand command = new SqlCommand(sql51, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                TempData["errorMsg"] = "referee1 is unavilable on this date";
                                connection.Close();
                                OnGet();
                                return;
                            }
                        }
                    }
                    using (SqlCommand command = new SqlCommand(sql52, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                TempData["errorMsg"] = "referee2 is unavilable on this date";
                                connection.Close();
                                OnGet();
                                return;
                            }
                        }
                    }
                    using (SqlCommand command = new SqlCommand(sql6, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                TempData["errorMsg"] = "Stadium is unavilable on this date";
                                connection.Close();
                                OnGet();
                                return;
                            }
                        }
                    }
                    string sql2 = "Update Match set team1='" + match.Team1 + "', team2='" + match.Team2 + "', referee1= " + match.IDRef1 + ", referee2=" + match.IDRef2 + ", stadium='" + match.Stadium + "', stage=" + match.stage + ", MatchDateTime='" + match.DateTime + "' where ID=" + match.ID;
                    try
                    {

                        using (SqlCommand command = new SqlCommand(sql2, connection))
                        {
                            command.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        TempData["errorMsg"] = ex.Message;
                        connection.Close();
                        OnGet();
                        return;
                    }
                    TempData["successMsg"] = "Match Updated";
                    connection.Close();
                    Response.Redirect("/Upcoming");
                    return;
                }
            }
            catch (Exception ex)
            {
                TempData["errorMsg"] = ex.Message;
                OnGet();
                return;
            }
        }
    }
    public class Referee
    {
        public string name;
        public string id;
    }


    public class Match
    {
        public int ID;
        public string Team1;
        public string Team2;
        public int IDRef1;
        public int IDRef2;
        public string Stadium;
        public string DateTime;
        public int stage;
    }
}

