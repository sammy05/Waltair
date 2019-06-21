using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class ChangeStationsData
    {
        public string ForWhom;
        public string Description;

        public ChangeStationsData(string forWhom, string description)
        {
            ForWhom = forWhom;
            Description = description;
        }
    }

    public class ChangeStations
    {
        public List<ChangeStationsData> Data;
        public string Color;

        public ChangeStations(List<ChangeStationsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public ChangeStations()
        {
            Data = new List<ChangeStationsData>();
            Color = "#FF5733";
        }
    }
}