using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class PassengerTrafficData
    {
        //public string section;
        //public int passengers;
        //public double earnings;

        //public PassengerTrafficData(string section, string passengers, string earnings)
        //{
        //    this.section = section;
        //    int.TryParse(passengers, out this.passengers);
        //    double.TryParse(earnings, out this.earnings);
        //}

        public int passengers;
        public string pct;

        public PassengerTrafficData(string passengers, string pct)
        {
            int.TryParse(passengers, out this.passengers);
            this.pct = pct;
        }
    }

    public class PassengerTraffic
    {
        public List<PassengerTrafficData> Data;
        public string Color;

        public PassengerTraffic(List<PassengerTrafficData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public PassengerTraffic()
        {
            Data = new List<PassengerTrafficData>();
            Color = "#FF5733";
        }
    }
}