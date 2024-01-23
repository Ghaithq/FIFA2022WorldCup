using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace WebApplication1.Pages.Fans
{
    public class FanInfo
    {
        public String fullname, username, email, phone, nationality, password;

    }
    public class addModel : PageModel
    {
        public FanInfo fan = new FanInfo();
        public string errormesssage="";
        public string successmessage = "";
        public void OnGet()
        {
        }
        public void OnPost()
        {
            fan.fullname = Request.Form["fullname"];
            fan.username = Request.Form["username"];
            fan.email = Request.Form["email"];
            fan.phone = Request.Form["phone"];
            fan.nationality = Request.Form["Nationality"];
            fan.password = Request.Form["password"];

            if(fan.fullname.Length==0)
            {
                errormesssage = "Enter your Name";
                return;
            }
            else if (fan.username.Length == 0)
            {
                errormesssage = "Enter your User Name";
                return;
            }
            else if(fan.email.Length == 0)
            {
                errormesssage = "Enter your E_Mail";
                return;
            }
            else if(fan.phone.Length == 0)
            {
                errormesssage = "Enter your Phone Number";
                return;
            }
            else if(fan.nationality.Length == 0)
            {
                errormesssage = "Enter your User Nationality";
                return;
            }
            else if(fan.password.Length == 0)
            {
                errormesssage = "Enter your Password";
                return;
            }

            try
            {
                String connectionstring = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    String sql = "insert into UserAccount Values('" + fan.username + "','"+fan.password+"','"+fan.fullname+"','"+fan.nationality+"','"+fan.email+"','"+fan.phone+"',2)";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception ex)
            {
                errormesssage=ex.Message;
                return;
            }


            fan.fullname = "";
            fan.username = "";
            fan.email = "";
            fan.phone = "";
            fan.nationality = "";
            fan.password = "";

            successmessage = "Done! Now You Can Log in";
            //Response.Redirect("/Shared/");
        }
    }
}
