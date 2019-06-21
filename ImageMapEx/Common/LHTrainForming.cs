using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class LHTrainFormingData
    {
        public double load;
        public string pctLonghaulTrains;

        public LHTrainFormingData(string load, string pctLonghaulTrains)
        {
            double.TryParse(load, out this.load);
            this.pctLonghaulTrains = pctLonghaulTrains;
        }
    }

    public class LHTrainForming
    {
        public List<LHTrainFormingData> Data;
        public string Color;

        public LHTrainForming(List<LHTrainFormingData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public LHTrainForming()
        {
            Data = new List<LHTrainFormingData>();
            Color = "#FF5733";
        }
    }
}