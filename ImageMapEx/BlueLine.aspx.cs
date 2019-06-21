using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;

namespace ImageMapEx
{
    public partial class BlueLine : System.Web.UI.Page
    {
        //public string checkvalue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Common.PageLoad.Init();
        }

        [System.Web.Services.WebMethod]
        public static string GetData()
        {
            Dictionary<string, Data> data = new Dictionary<string, Data>();
            //string connectionString = ConfigurationManager.AppSettings["MySQLCS"].ToString();
            //MySqlConnection mysqlConnection = new MySqlConnection(connectionString);
            //MySqlCommand mysqlCommand = new MySqlCommand();
            //mysqlCommand.CommandTimeout = 120;
            //mysqlCommand.Connection = mysqlConnection;
            //mysqlConnection.Open();

            //string query = @"select ap.point_id, name, dashboard_url, freight, amount
            //                from active_points ap left join freight_details fd
            //                on ap.point_id = fd.point_id where region = 'Blue' order by ap.point_id  ";
            //mysqlCommand.CommandText = query;
            //MySqlDataReader mySqlDataReader = mysqlCommand.ExecuteReader();
            //string previousId = "";
            //string currentId = "";
            ////Data da = null;
            //while (mySqlDataReader.Read())
            //{
            //    currentId = mySqlDataReader.GetString(0);
            //    if (previousId != currentId)
            //    {
            //        Data da = new Data
            //        {
            //            Name = mySqlDataReader.IsDBNull(1) ? "" : mySqlDataReader.GetString(1),
            //            Url = mySqlDataReader.IsDBNull(2) ? "" : mySqlDataReader.GetString(2)
            //        };
            //        data[currentId] = da;
            //    }
            //    FreightData fd = new FreightData
            //    {
            //        Freight = mySqlDataReader.IsDBNull(3) ? -1 : mySqlDataReader.GetInt32(3),
            //        Amount = mySqlDataReader.IsDBNull(4) ? -1 : mySqlDataReader.GetInt32(4)
            //    };
            //    data[currentId].Details.Add(fd);
            //    previousId = currentId;
            //}

            data["Donkinavalasa"] = new Data { Name = "Donkinavalasa", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Salur"] = new Data { Name = "Salur", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Parannavalasa"] = new Data { Name = "Parannavalasa", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Rompalli"] = new Data { Name = "Rompalli", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["NarayanappaValasa"] = new Data { Name = "NarayanappaValasa", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Bobilli"] = new Data { Name = "Bobilli", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Narasipuram"] = new Data { Name = "Narasipuram", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Sitanagaram"] = new Data { Name = "Sitanagaram", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Paravatipuram"] = new Data { Name = "Paravatipuram", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["ParavatipuramTown"] = new Data { Name = "Paravatipuram Town", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Gumada"] = new Data { Name = "Gumada", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Kuneru"] = new Data { Name = "Kuneru", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Jimidipeta"] = new Data { Name = "Jimidipeta", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Ladda"] = new Data { Name = "Ladda", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["JKPaperRayagada"] = new Data { Name = "JK Paper Rayagada", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["SingapuramRd"] = new Data { Name = "Singapuram Rd", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Theruvali"] = new Data { Name = "Theruvali", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Keutgura"] = new Data { Name = "Keutgura", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Sikarpai"] = new Data { Name = "Sikarpai", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Bhalumaska"] = new Data { Name = "Bhalumaska", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Lelligumma"] = new Data { Name = "Lelligumma", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Rauli"] = new Data { Name = "Rauli", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Singaramba"] = new Data { Name = "Singaramba", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Tikri"] = new Data { Name = "Tikri", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["LaxmipurRd"] = new Data { Name = "Laxmipur Rd", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Kakrigumma"] = new Data { Name = "Kakrigumma", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Baiguda"] = new Data { Name = "Baiguda", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Damanjodi"] = new Data { Name = "Damanjodi", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };
            data["Dummuriput"] = new Data { Name = "Dummuriput", Url = "https://www.google.com/", Details = new List<FreightData> { new FreightData { Freight = 1000, Amount = 5000 }, new FreightData { Freight = 2000, Amount = 7000 }, new FreightData { Freight = 3000, Amount = 15000 } } };

            return JsonConvert.SerializeObject(data);
        }
    }


}