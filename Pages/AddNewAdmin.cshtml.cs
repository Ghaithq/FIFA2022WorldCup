using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
namespace DBProjectClone.Pages
{
    public class AddNewAdminModel : PageModel
    {


        public string errorMessage = "";


        public void OnGet()
        {
        }


        public void OnPost()
        {
            try
            {
                string userName=Request.Form["Username"];
                string passWord=Request.Form["Password"];

                string query = "INSERT [dbo].[UserAccount] ([UserName], [AccountPassword], [Type]) VALUES('" + userName + "','" + passWord + "',1)";
                String connectionString = @"Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    using (SqlCommand command1 = new SqlCommand(query, connection))
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

            errorMessage = "Admin Added Successfully";

        }
    }
}
