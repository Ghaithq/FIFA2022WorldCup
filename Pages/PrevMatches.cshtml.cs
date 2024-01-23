using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class PrevMatchesModel : PageModel
    {

        SqlDataReader PrevMatchList;
        public DataTable Matches;
        public List<String> Flags = new List<string>();
        public List<String> Refs = new List<string>();
        SqlConnection connection;

        public string UserName;
        public string UserType;

        public void OnGet()
        {
            UserType = HttpContext.Session.GetString("UserType");
            try
            {
                String connectionString = @"Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    String query = "SELECT * FROM MATCH,PREVIOUSMATCHES WHERE ID=MATCHID";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        PrevMatchList = command.ExecuteReader();
                        Matches = new DataTable();
                        Matches.Load(PrevMatchList);
                        PrevMatchList.Close();

                    }
                }
                DataTable dt2 = new DataTable();
                foreach (DataRow Row in Matches.Rows)
                {
                    string team1 = Row["team1"].ToString();
                    string team2 = Row["team2"].ToString();
                    string query = "select flag from Team where Nationality='" + team1 + "'";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();


                            dt2.Load(reader);
                            reader.Close();
                        }

                    }
                    if (dt2 != null)
                    {

                        Flags.Add(dt2.Rows[0][0].ToString());
                        dt2.Reset();
                    }



                    string query2 = "select flag from Team where Nationality='" + team2 + "'";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(query2, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();

                            dt2.Load(reader);
                            reader.Close();
                        }
                    }


                    if (dt2 != null)
                    {

                        Flags.Add(dt2.Rows[0][0].ToString());
                        dt2.Reset();
                    }

                    string refereeID1 = Row["referee1"].ToString();
                    string refereeID2 = Row["referee2"].ToString();
                    string query3 = "select R_Name from Referee where ID='" + refereeID1 + "'";





                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query3, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();


                            dt2.Load(reader);
                            reader.Close();

                        }
                    }

                    if (dt2 != null)
                    {

                        Refs.Add(dt2.Rows[0][0].ToString());
                        dt2.Reset();
                    }

                    string query4 = "select R_Name from Referee where ID='" + refereeID2 + "'";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query4, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();


                            dt2.Load(reader);
                            reader.Close();

                        }
                    }
                    if (dt2 != null)
                    {

                        Refs.Add(dt2.Rows[0][0].ToString());
                        dt2.Reset();
                    }
                }


            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.ToString());
            }
        }

    }
    public class MatchInfo
    {
        public String MatchID;
        public String TeamA;
        public String TeamB;
        public String MatchDate;
        public String MainRef;
        public String SideRef;
        public String ScoreA;
        public String ScoreB;
        public String ShotsA;
        public String ShotsB;
        public String YellowsA;
        public String YellowsB;
        public String RedsA;
        public String RedsB;
        public String PassesA;
        public String PassesB;
        public String AccuracyA;
        public String AccuracyB;
        public String PossessionA;
        public String PossessionB;
        public String OffsidesA;
        public String OffSidesB;
        public String CornersA;
        public String CornersB;
        public String ShotsOnTargetA;
        public String ShotsonTargetB;
        public String FoulsA;
        public String FoulsB;
    }
}