using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class CoachData
    {
        public int totalWagon;
        public int totalRakes;

        public CoachData(string totalWagon, string totalRakes)
        {
            int.TryParse(totalWagon, out this.totalWagon);
            int.TryParse(totalRakes, out this.totalRakes);
        }
    }

    public class Coach
    {
        public List<CoachData> Data;
        public string Color;

        public Coach(List<CoachData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public Coach()
        {
            Data = new List<CoachData>();
            Color = "#FF5733";
        }
    }
}