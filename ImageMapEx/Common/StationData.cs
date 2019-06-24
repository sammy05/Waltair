using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class StationData
    {
        public List<string[]> Data;
        public string Color;

        public StationData(List<string[]> data, string color)
        {
            Data = data;
            Color = color;
        }

        public StationData()
        {
            Data = new List<string[]>();
            Color = "#FF5733";
        }
    }
}