using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Data;



namespace DBProjectClone.Pages
{
    public class EditPreviousMatchModel : PageModel
    {
        public MatchInfo matchInfo = new MatchInfo();
        DataTable Dt;
        public string errorMessage = "";
        public string successMessage = "";




        public void OnGet()
        {

            try
            {
                matchInfo.MatchID = Request.Query["id"];
                String connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query1 = "SELECT * FROM PREVIOUSMATCHES WHERE MatchID=" + matchInfo.MatchID;
                    using (SqlCommand command1 = new SqlCommand(query1, connection))
                    {

                        SqlDataReader reader = command1.ExecuteReader();
                        Dt = new DataTable();
                        Dt.Load(reader);
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
            }
        

            matchInfo.ScoreA = Dt.Rows[0]["ScoreA"].ToString();
            matchInfo.ScoreB = Dt.Rows[0]["ScoreB"].ToString();
            matchInfo.ShotsA = Dt.Rows[0]["ShotsA"].ToString();
            matchInfo.ShotsB = Dt.Rows[0]["ShotsB"].ToString();
            matchInfo.YellowsA = Dt.Rows[0]["YellowsA"].ToString();
            matchInfo.YellowsB = Dt.Rows[0]["YellowsB"].ToString();
            matchInfo.RedsA = Dt.Rows[0]["RedsA"].ToString();
            matchInfo.RedsB = Dt.Rows[0]["RedsB"].ToString();
            matchInfo.PassesA = Dt.Rows[0]["PassesA"].ToString();
            matchInfo.PassesB = Dt.Rows[0]["PassesB"].ToString();
            matchInfo.AccuracyA = Dt.Rows[0]["AccuracyA"].ToString();
            matchInfo.AccuracyB = Dt.Rows[0]["AccuracyB"].ToString();
            matchInfo.PossessionA = Dt.Rows[0]["PossessionA"].ToString();
            matchInfo.PossessionB = Dt.Rows[0]["PossessionB"].ToString();
            matchInfo.OffsidesA = Dt.Rows[0]["OffsidesA"].ToString();
            matchInfo.OffSidesB = Dt.Rows[0]["OffsidesB"].ToString();
            matchInfo.CornersA = Dt.Rows[0]["CornersA"].ToString();
            matchInfo.CornersB = Dt.Rows[0]["CornersB"].ToString();
            matchInfo.ShotsOnTargetA = Dt.Rows[0]["ShotsOnTargetA"].ToString();
            matchInfo.ShotsonTargetB = Dt.Rows[0]["ShotsOnTargetB"].ToString();
            matchInfo.FoulsA = Dt.Rows[0]["FoulsA"].ToString();
            matchInfo.FoulsB = Dt.Rows[0]["FoulsB"].ToString();





        

    }
        public void OnPost()
        {
            matchInfo.MatchID = Request.Query["id"];
            matchInfo.ScoreA = Request.Form["ScoreA"];
            matchInfo.ScoreB = Request.Form["ScoreB"];
            matchInfo.ShotsA = Request.Form["ShotsA"];
            matchInfo.ShotsB = Request.Form["ShotsB"];
            matchInfo.YellowsA = Request.Form["YellowsA"];
            matchInfo.YellowsB = Request.Form["YellowsB"];
            matchInfo.RedsA = Request.Form["RedsA"];
            matchInfo.RedsB = Request.Form["RedsB"];
            matchInfo.PassesA = Request.Form["PassesA"];
            matchInfo.PassesB = Request.Form["PassesB"];
            matchInfo.AccuracyA = Request.Form["AccuracyA"];
            matchInfo.AccuracyB = Request.Form["AccuracyB"];
            matchInfo.PossessionA = Request.Form["PossessionA"];
            matchInfo.PossessionB = Request.Form["PossessionB"];
            matchInfo.OffsidesA = Request.Form["OffsidesA"];
            matchInfo.OffSidesB = Request.Form["OffsidesB"];
            matchInfo.CornersA = Request.Form["CornersA"];
            matchInfo.CornersB = Request.Form["CornersB"];
            matchInfo.ShotsOnTargetA = Request.Form["ShotsOnTargetA"];
            matchInfo.ShotsonTargetB = Request.Form["ShotsOnTargetB"];
            matchInfo.FoulsA = Request.Form["FoulsA"];
            matchInfo.FoulsB = Request.Form["FoulsB"];


            try
            {
                String connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string DeleteQuery = "DELETE FROM PREVIOUSMATCHES WHERE MatchID=" + matchInfo.MatchID;
                    using (SqlCommand command3 = new SqlCommand(DeleteQuery, connection))
                    {
                        command3.ExecuteNonQuery();
                    }
                    string query1 = "INSERT INTO PREVIOUSMATCHES VALUES(" + matchInfo.MatchID + "," + matchInfo.ScoreA + "," + matchInfo.ScoreB + "," + matchInfo.ShotsA + "," + matchInfo.ShotsB + "," + matchInfo.YellowsA + "," + matchInfo.YellowsB + "," + matchInfo.RedsA + "," + matchInfo.RedsB + "," + matchInfo.PassesA + "," + matchInfo.PassesB + ",";
                    string query1d = matchInfo.AccuracyA + "," + matchInfo.AccuracyB + "," + matchInfo.PossessionA + "," + matchInfo.PossessionB + "," + matchInfo.FoulsA + "," + matchInfo.FoulsB + "," + matchInfo.OffsidesA + "," + matchInfo.OffSidesB + "," + matchInfo.CornersA + "," + matchInfo.CornersB + "," + matchInfo.ShotsOnTargetA + "," + matchInfo.ShotsonTargetB + ")";
                    query1 = query1 + query1d;
                    using (SqlCommand command1 = new SqlCommand(query1, connection))
                    {
                        command1.ExecuteNonQuery();
                    }

                }

            }
            catch (Exception ex)
            {
                if (ex.Message == "Incorrect syntax near ','.")
                    errorMessage = "All fields are required!";
                else
                    errorMessage = ex.Message;
                return;
            }




            successMessage = "Match Edited Successfully!";
                

        }
    }
}
