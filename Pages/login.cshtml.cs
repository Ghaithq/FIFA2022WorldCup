using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages.Clients
{
    public class loginModel : PageModel
    {

        public string errorMessage="";
        public string succesMessage="";
        public Fan fanAccount = new Fan();
        public void OnGet()
        {

        }
        public void OnPost()
        {
            errorMessage = "";
            succesMessage = "";
            fanAccount.UserName = Request.Form["username"];
            fanAccount.UserType = "0";
            fanAccount.Password = Request.Form["password"];
            if (fanAccount.UserName.Length == 0 || fanAccount.Password.Length == 0)
            {
                errorMessage = "Please fill all fields";
                return;
            }
            try
            {
                string connectionString= "Data Source=FARESATEF;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "SELECT * FROM UserAccount WHERE UserName='" + fanAccount.UserName+"';";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using(SqlDataReader reader = command.ExecuteReader())
                        {
                            if(reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    if (fanAccount.Password == reader["AccountPassword"].ToString())
                                    {
                                        succesMessage = "successfully logged in";
                                        fanAccount.UserType = reader["Type"].ToString();
                                    }
                                    else
                                    {
                                        errorMessage = "Wrong password";
                                        return;
                                    }
                                }
                            }
                            else
                            {
                                errorMessage = "No account with this username";
                                return;
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
            HttpContext.Session.SetString("Username", fanAccount.UserName);
            HttpContext.Session.SetString("UserType", fanAccount.UserType);
            var obj = HttpContext.Session.GetString("Username");
            var obj2 = HttpContext.Session.GetString("UserType");
            fanAccount.UserName = "";
            fanAccount.Password = "";
            Response.Redirect("/");
        }

    }

    
    public class Fan
    {
        public string UserName;
        public string Password;
        public string UserType;

    }

}
