using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;

namespace DBProjectClone.Pages
{
    public class Upcoming : PageModel
    {
        private readonly ILogger<Upcoming> _logger;

        public Upcoming(ILogger<Upcoming> logger)
        {
            _logger = logger;
        }
        public List<List<string>> matches = new List<List<string>>();
        public List<string> flags = new List<string>();

        public List<string> referees = new List<string>();
        public string UserType;

        public bool filterEnabled = false;
        public string stageselected = "";
        public string teamselected = "";
        public List<string> TeamNames = new List<string>();



        public string errorMessage = "";
        public string successMessage = "";
        public void OnGet()
        {


            UserType = HttpContext.Session.GetString("UserType");
            string str = @"Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
            DataTable dt = new DataTable();
            DataTable dtnames = new DataTable();
            try
            {
                using (SqlConnection connection8 = new SqlConnection(str))
                {

                    connection8.Open();
                    string q3 = "select Nationality from Team ";
                    using (SqlCommand command = new SqlCommand(q3, connection8))
                    {
                        SqlDataReader reader8 = command.ExecuteReader();
                        if (reader8.HasRows == true)
                        {

                            dtnames.Load(reader8);
                            reader8.Close();
                        }
                    }
                }


            }
            catch (System.Exception)
            {

                throw;
            }
            if (dtnames != null)
                foreach (DataRow r in dtnames.Rows)
                {
                    TeamNames.Add(r.ItemArray[0].ToString());
                }

            try
            {
                using (SqlConnection connection = new SqlConnection(str))
                {

                    connection.Open();
                    string q = "select * from Match where ID IN (select * from UpcomingMatch)";
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
                    List<string> match = new List<string>();
                    for (int i = 0; i < 8; i++)
                        match.Add(r.ItemArray[i].ToString());

                    matches.Add(match);
                }


            foreach (List<string> match in matches)
            {
                string teama = match[1];
                string teamb = match[2];
                string query = "select flag from Team where Nationality='" + teama + "'";

                DataTable dt2 = new DataTable();
                try
                {
                    using (SqlConnection connection = new SqlConnection(str))
                    {

                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows == true)
                            {

                                dt2.Load(reader);
                                reader.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }
                if (dt2 != null)
                {

                    flags.Add(dt2.Rows[0].ItemArray[0].ToString());
                }



                string query2 = "select flag from Team where Nationality='" + teamb + "'";

                DataTable dt3 = new DataTable();
                try
                {
                    using (SqlConnection connection = new SqlConnection(str))
                    {

                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query2, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows == true)
                            {

                                dt3.Load(reader);
                                reader.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }
                if (dt3 != null)
                {

                    flags.Add(dt3.Rows[0].ItemArray[0].ToString());
                }

                string refereeID1 = match[3];
                string refereeID2 = match[4];
                string query3 = "select R_Name from Referee where ID='" + refereeID1 + "'";

                DataTable dt4 = new DataTable();
                try
                {
                    using (SqlConnection connection = new SqlConnection(str))
                    {

                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query3, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows == true)
                            {

                                dt4.Load(reader);
                                reader.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }
                if (dt4 != null)
                {

                    referees.Add(dt4.Rows[0].ItemArray[0].ToString());
                }

                string query4 = "select R_Name from Referee where ID='" + refereeID2 + "'";

                DataTable dt5 = new DataTable();
                try
                {
                    using (SqlConnection connection = new SqlConnection(str))
                    {

                        connection.Open();

                        using (SqlCommand command = new SqlCommand(query4, connection))
                        {
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows == true)
                            {

                                dt5.Load(reader);
                                reader.Close();
                            }
                        }
                    }
                }
                catch (System.Exception)
                {

                    throw;
                }
                if (dt5 != null)
                {

                    referees.Add(dt5.Rows[0].ItemArray[0].ToString());
                }





            }

        }


        public void OnPost()
        {


            filterEnabled = true;
            stageselected = Request.Form["stageComboBox"];

            teamselected = Request.Form["teamComboBox"];
            OnGet();


        }



    }

}

