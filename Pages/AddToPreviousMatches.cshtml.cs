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
    public class AddToPreviousMatchesModel : PageModel
    {
        public MatchInfo matchInfo = new MatchInfo();
        public string errorMessage = "";
        public string successMessage = "";
        string MatchID;
        
         
        public void OnGet()
        {
             
            try
            {

            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
            }
        }


        public void OnPost()
        {
            MatchID = Request.Query["id"];
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

                    string query1 = "INSERT INTO PREVIOUSMATCHES VALUES(" + MatchID + "," + matchInfo.ScoreA + "," + matchInfo.ScoreB + "," + matchInfo.ShotsA + "," + matchInfo.ShotsB + "," + matchInfo.YellowsA + "," + matchInfo.YellowsB + "," + matchInfo.RedsA + "," + matchInfo.RedsB + "," + matchInfo.PassesA + "," + matchInfo.PassesB + ",";
                    string query1d = matchInfo.AccuracyA + "," + matchInfo.AccuracyB + "," + matchInfo.PossessionA + "," + matchInfo.PossessionB + "," + matchInfo.FoulsA + "," + matchInfo.FoulsB + "," + matchInfo.OffsidesA + "," + matchInfo.OffSidesB + "," + matchInfo.CornersA + "," + matchInfo.CornersB + "," + matchInfo.ShotsOnTargetA + "," + matchInfo.ShotsonTargetB + ")";
                    query1 = query1 + query1d;
                    using (SqlCommand command1 = new SqlCommand(query1, connection))
                    {
                        command1.ExecuteNonQuery();
                    }
                    String query2 = "DELETE  FROM UpcomingMatch WHERE ID=" + MatchID;
                    using (SqlCommand command = new SqlCommand(query2, connection))
                    {
                        command.ExecuteNonQuery();
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



            
            successMessage = "Match Added Successfully!";
            Response.Redirect("Upcoming");
        
        }
    }
}
