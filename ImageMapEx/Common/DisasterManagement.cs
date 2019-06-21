using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class DisasterManagementData
    {
        public string type;
        public string scale;
        public string otherType;

        public DisasterManagementData(string type, string scale, string otherType)
        {
            this.type = type;
            this.scale = scale;
            this.otherType = otherType;
        }
    }

    public class DisasterManagement
    {
        public List<DisasterManagementData> Data;
        public string Color;

        public DisasterManagement(List<DisasterManagementData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public DisasterManagement()
        {
            Data = new List<DisasterManagementData>();
            Color = "#FF5733";
        }
    }
}