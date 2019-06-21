using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImageMapEx
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string AddUser(string UserName, string Password)
        {
            Dictionary<string, string> credentials = Common.UserDetails.GetCredentials();
            if (credentials.ContainsKey(UserName))
            {
                return JsonConvert.SerializeObject(new { Success = false, Error = "Username exists, choose a different user name" });
            }
            string error = "";
            if(Common.UserDetails.AddCredentials(UserName, Password, ref error))
                return JsonConvert.SerializeObject(new { Success = true, Error = "" });
            else
                return JsonConvert.SerializeObject(new { Success = false, Error = error });
        }
    }
}