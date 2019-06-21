using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace ImageMapEx.Common
{
    public class UserDetails
    {
        public static Dictionary<string, string> GetCredentials()
        {
            Dictionary<string, string> credentials = new Dictionary<string, string>();

            try
            {
                string path = HostingEnvironment.MapPath(@"~/App_Data/credentials.txt");
                StreamReader file = new StreamReader(path);
                string line;
                while ((line = file.ReadLine()) != null)
                {
                    string[] fields = line.Split(',');
                    credentials[fields[0]] = fields[1];
                }
                file.Close();
            }
            catch(Exception ex)
            {

            }

            return credentials;
        }

        public static bool AddCredentials(string userName, string password, ref string error)
        {
            try
            {
                string path = HostingEnvironment.MapPath(@"~/App_Data/credentials.txt");
                using (StreamWriter sw = File.AppendText(path))
                {
                    sw.WriteLine(userName + "," + password);
                }

                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
        }
    }
}