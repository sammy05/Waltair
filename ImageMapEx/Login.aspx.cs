using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImageMapEx
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string LoginUser(string UserName, string Password)
        {
            Dictionary<string, string> credentials = Common.UserDetails.GetCredentials();
            //if (UserName.Equals("Sameer") && Password.Equals("abcd"))
            if (credentials.ContainsKey(UserName) && credentials[UserName].Equals(Password))
            {
                HttpContext.Current.Session["username"] = UserName;
                return JsonConvert.SerializeObject(new { Success = true, Error = "" });
            }
            return JsonConvert.SerializeObject(new { Success = false, Error = "Invalid Credentials" });
        }
    }
}