using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ImageMapEx.Common
{
    public class PageLoad
    {
        public static void Init()
        {
            if (HttpContext.Current.Session["username"] == null)
                HttpContext.Current.Response.Redirect("Login.aspx");
        }

        public static string CreateDynamicImageMap(string id, string title, string coords, bool active, string shape = "circle")
        {
            coords = coords.Replace('#', ',');
            StringBuilder sb = new StringBuilder();
            sb.Append("<area target='_blank'");
            sb.Append(" id='").Append(id).Append("'");
            sb.Append(" title='").Append(title).Append("'");
            sb.Append(" coords='").Append(coords).Append("'");
            sb.Append(" shape='").Append(shape).Append("'");
            if (active)
                sb.Append(" class='activePoint'");
            else
                sb.Append(" class='inactivePoint'");

            sb.Append(">");
            return sb.ToString(); ;
        }
    }
}