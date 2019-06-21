using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //S. No,Station code,Works Supervisory Unit Name,Colony,Quarter Type,
    //Total No. of Units,No. of Units Occupied,No. of Units Vacant
    public class QuartersData
    {
        public string unitName;
        public string colony;
        public string quarterType;
        public int totalUnits;
        public int occupiedUnits;
        public int vacantUnits;
        public double pctQuatersInDivison;

        public QuartersData(string unitName, string colony, string quarterType,
            string totalUnits, string occupiedUnits, string vacantUnits, string pctQuatersInDivison)
        {
            this.unitName = unitName;
            this.colony = colony;
            this.quarterType = quarterType;
            int.TryParse(totalUnits, out this.totalUnits);
            int.TryParse(occupiedUnits, out this.occupiedUnits);
            int.TryParse(vacantUnits, out this.vacantUnits);
            double.TryParse(pctQuatersInDivison, out this.pctQuatersInDivison);
            this.pctQuatersInDivison = Math.Round(this.pctQuatersInDivison, 4);
        }
    }

    public class Quarters
    {
        public List<QuartersData> Data;
        public string Color;

        public Quarters(List<QuartersData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public Quarters()
        {
            Data = new List<QuartersData>();
            Color = "#FF5733";
        }
    }
}