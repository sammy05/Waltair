using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class WeighBridgesData
    {
        public int count;

        public WeighBridgesData(string count)
        {
            int.TryParse(count, out this.count);
        }
    }

    public class WeighBridges
    {
        public List<WeighBridgesData> Data;
        public string Color;

        public WeighBridges(List<WeighBridgesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public WeighBridges()
        {
            Data = new List<WeighBridgesData>();
            Color = "#FF5733";
        }
    }
}