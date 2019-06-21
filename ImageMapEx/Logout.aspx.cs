using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImageMapEx
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["username"] == null)
                HttpContext.Current.Response.Redirect("Login.aspx");
            else
            {
                HttpContext.Current.Session["username"] = null;
                HttpContext.Current.Response.Redirect("Login.aspx");
            }
        }
    }
}