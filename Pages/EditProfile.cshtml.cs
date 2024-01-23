using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using DBProjectClone.Pages.Shared;
using Microsoft.AspNetCore.Http;
namespace DBProjectClone.Pages
{
    public class UserInfo
    {
        public String fullname, username, email, phone, nationality, password;
        public int Type;
    }
    public class EditProfileModel : PageModel
    {
        public UserInfo User = new UserInfo();
        public UserInfo User2=new UserInfo();
        public string errormesssage = "";
        public string successmessage = "";
        public string UserName;
        //public List<UserInfo> Users = new List<UserInfo>();

        public void OnGet()
        {

            UserName = Request.Query["id"];
            TempData["UserName"] = UserName;
            try
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
            catch (Exception ex)
            {
                errormesssage = ex.Message;
                return;
            }
        }
        public void OnPost()
        {
            UserName = TempData["UserName"].ToString();
            User2.fullname = Request.Form["fullname"];
            User2.username = Request.Form["username"];
            User2.email = Request.Form["email"];
            User2.phone = Request.Form["phone"];
            User2.nationality = Request.Form["Nationality"];
            User2.password = Request.Form["password"];

            if (User2.fullname.Length == 0)
            {
                errormesssage = "Enter your Name";
                return;
            }
            else if (User2.username.Length == 0)
            {
                errormesssage = "Enter your User Name";
                return;
            }
            else if (User2.email.Length == 0)
            {
                errormesssage = "Enter your E_Mail";
                return;
            }
            else if (User2.phone.Length == 0)
            {
                errormesssage = "Enter your Phone Number";
                return;
            }
            else if (User2.nationality.Length == 0)
            {
                errormesssage = "Enter your User Nationality";
                return;
            }
            else if (User2.password.Length == 0)
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
                    //String sql = "update UserAccount Values('" + User.fullname + "','" + User.username + "','" + User.email + "','" + User.phone + "','" + User.nationality + "','" + User.password + "')";
                    String sql = "update UserAccount set AccountPassword='" +User2.password+"' ,Name='"+User2.fullname+ "' , Nationality='"+User2.nationality+ "' ,Email='"+User2.email+ "' ,PhoneNumber='"+User2.phone+"' "+"where UserName = '"+UserName+ "'";
                    UserName = User2.username;
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                errormesssage = ex.Message;
                return;
            }


            successmessage = "Done!";

            ////Response.Redirect("/Shared/");
        }
    }
}
