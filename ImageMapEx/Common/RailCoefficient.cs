using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class RailCoefficientData
    {
        //public string Siding;
        public double production;
        public double movedByRail;
        public double pctMovedByRail;

        public RailCoefficientData(/*string siding,*/ double production, double movedByRail, double pctMovedByRail)
        {
            //Siding = siding;
            this.production = production;
            this.movedByRail = movedByRail;
            this.pctMovedByRail = pctMovedByRail;
        }

        public RailCoefficientData(/*string siding,*/ string production, string movedByRail, string pctMovedByRail)
        {
            //Siding = siding;
            this.production = Convert.ToDouble(production);
            this.movedByRail = Convert.ToDouble(movedByRail);
            this.pctMovedByRail = Convert.ToDouble(pctMovedByRail);
        }
    }

    //public class RailCoefficient
    //{
    //    public List<RailCoefficientData> Data;
    //    public string Color;

    //    public RailCoefficient(List<RailCoefficientData> data, string color)
    //    {
    //        Data = data;
    //        Color = color;
    //    }

    //    public RailCoefficient()
    //    {
    //        Data = new List<RailCoefficientData>();
    //        Color = "#FF5733";
    //    }
    //}

    public class RailCoefficient
    {
        public List<string[]> Data;
        public string Color;

        public RailCoefficient(List<string[]> data, string color)
        {
            Data = data;
            Color = color;
        }

        public RailCoefficient()
        {
            Data = new List<string[]>();
            Color = "#FF5733";
        }
    }

}