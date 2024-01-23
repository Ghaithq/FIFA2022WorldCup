using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using static System.Net.WebRequestMethods;
//using WebApplication1.Pages.Users;

namespace DBProjectClone.Pages.Shared
{
    public class UserInfo
    {
        public String fullname, username, email, phone, nationality, password;
        public int Type;
    }
    public class ProfilePageModel : PageModel
    {
        public UserInfo User = new UserInfo();
        public string errormesssage = "";
        //public string successmessage = "";
        public string UserName;
        //public List<UserInfo> Users = new List<UserInfo>();
        public void OnGet()
        {
            UserName = Request.Query["id"];
            try
            {
                if (HttpContext.Session.GetString("UserType") == "2")
                {
                    String connectionstring = "Data Source=DESKTOP-8KA02T7;Initial Catalog=FIFAWorldCup;Integrated Security=True";
                    using (SqlConnection connection = new SqlConnection(connectionstring))
                    {
                        connection.Open();
                        String sql = "Select * From UserAccount where UserName='" + UserName + "'";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    UserInfo currUser = new UserInfo();
                                    currUser.username = reader.GetString(0);
                                    currUser.password = reader.GetString(1);
                                    currUser.fullname = reader.GetString(2);
                                    currUser.nationality = reader.GetString(3);
                                    currUser.email = reader.GetString(4);
                                    currUser.phone = reader.GetString(5);
                                    currUser.Type = reader.GetInt32(6);
                                    //User=currUser;
                                    User = currUser;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage = ex.Message;
                return;
            }
        }

    }
}
