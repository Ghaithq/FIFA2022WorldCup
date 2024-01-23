using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace DBProjectClone.Pages
{
    public class TeamPageModel : PageModel
    {
        //private readonly ILogger<TeamPageModel> _logger;

        //public TeamPageModel(ILogger<TeamPageModel> logger)
        //{
        //    _logger = logger;

        //}

        //Data Source=DESKTOP-US1Q8UB;Initial Catalog=Pharmacy;Integrated Security=True
        public List<string> Teams = new List<string>();

        public List<string> teamsFlags = new List<string>();

        public List<List<string>> playerNames = new List<List<string>>();
        public List<List<string>> playerPositions = new List<List<string>>();

        public List<List<string>> playerNumbers = new List<List<string>>();
        public DataTable PlayerStatsTable = new DataTable();
        public void OnGet()
        {



            string str = "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(str))
                {

                    connection.Open();
                    string q = "select Nationality , flag from Team";
                    using (SqlCommand command = new SqlCommand(q, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows == true)
                        {

                            dt.Load(reader);
                            reader.Close();
                        }
                    }
                }
            }
            catch (System.Exception)
            {

                throw;
            }

            if (dt != null)
                foreach (DataRow r in dt.Rows)
                {
                    Teams.Add(r.ItemArray[0].ToString());
                    teamsFlags.Add(r.ItemArray[1].ToString());
                }

            foreach (string Nation in Teams)
            {
                List<string> players_names = new List<string>();
                List<string> players_pos = new List<string>();
                List<string> players_num = new List<string>();



                DataTable dt2 = new DataTable();
                try
                {
                    using (SqlConnection connection2 = new SqlConnection(str))
                    {

                        connection2.Open();
                        string query = "select P_Name , P_number , Position from Player where Plays_For='" + Nation + "'";

                        using (SqlCommand command2 = new SqlCommand(query, connection2))
                        {
                            SqlDataReader reader2 = command2.ExecuteReader();
                            if (reader2.HasRows == true)
                            {

                                dt2.Load(reader2);
                                reader2.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }

                if (dt2 != null)
                    foreach (DataRow r in dt2.Rows)
                    {
                        players_names.Add(r.ItemArray[0].ToString());
                        players_num.Add(r.ItemArray[1].ToString());
                        players_pos.Add(r.ItemArray[2].ToString());
                    }


                playerNames.Add(players_names);
                playerNumbers.Add(players_num);
                playerPositions.Add(players_pos);



                try
                {
                    using (SqlConnection connection2 = new SqlConnection(str))
                    {

                        connection2.Open();
                        string query2 = "SELECT numOfYellowCards,numOfRedCards,Goals,Assists FROM PLAYER WHERE Plays_For='" + Nation + "'";

                        using (SqlCommand command2 = new SqlCommand(query2, connection2))
                        {
                            SqlDataReader reader3 = command2.ExecuteReader();
                            if (reader3.HasRows == true)
                            {

                                PlayerStatsTable.Load(reader3);
                                reader3.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }

            }










        }


    }
}