using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class MajorOfficesData
    {
        public string offices;

        public MajorOfficesData(string offices)
        {
            this.offices = offices;
        }
    }

    public class MajorOffices
    {
        public List<MajorOfficesData> Data;
        public string Color;

        public MajorOffices(List<MajorOfficesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public MajorOffices()
        {
            Data = new List<MajorOfficesData>();
            Color = "#FF5733";
        }
    }
}