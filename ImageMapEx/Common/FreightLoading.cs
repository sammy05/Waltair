using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class FreightLoadingData
    {
        //public string loadingPoint;
        //public string code;
        //public int rake;
        public double MT;
        //public double rsCr;
        public string pctOfDivision;

        //public FreightLoadingData(string loadingPoint, string code, string rake, string MT, string rsCr, string pctOfDivision)
        public FreightLoadingData(string MT, string pctOfDivision)
        {
            //this.loadingPoint = loadingPoint;
            //this.code = code;
            //this.rake = Convert.ToInt32(rake);
            //int.TryParse(rake, out this.rake);
            double.TryParse(MT, out this.MT);
            //double.TryParse(rsCr, out this.rsCr);
            //double.TryParse(pctOfDivision, out this.pctOfDivision);
            //this.pctOfDivision = Math.Round(this.pctOfDivision, 2);
            this.pctOfDivision = pctOfDivision;
        }
    }

    public class FreightLoading
    {
        public List<FreightLoadingData> Data;
        public string Color;

        public FreightLoading(List<FreightLoadingData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public FreightLoading()
        {
            Data = new List<FreightLoadingData>();
            Color = "#FF5733";
        }
    }
}