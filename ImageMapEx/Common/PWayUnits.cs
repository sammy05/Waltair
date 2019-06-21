using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //Sum of Route Kms,% Route Kms,Sum of Total Track Kms,
    //% Running Track Kms2,Sum of Running Track Kms,% Total Track Kms2
    public class PWayUnitsData
    {
        public double sumRoutes;
        public string pctRoutesKm;
        public double sumTracks;
        public string pctRunningTracks;
        public double sumRunningTracks;
        public string pctTotalTracks;

        public PWayUnitsData(string sumRoutes, string pctRoutesKm, string sumTracks, 
            string pctRunningTracks, string sumRunningTracks, string pctTotalTracks)
        {
            double.TryParse(sumRoutes, out this.sumRoutes);
            this.pctRoutesKm = pctRoutesKm;
            double.TryParse(sumTracks, out this.sumTracks);
            this.pctRunningTracks = pctRunningTracks;
            double.TryParse(sumRunningTracks, out this.sumRunningTracks);
            this.pctTotalTracks = pctTotalTracks;
        }
    }

    public class PWayUnits
    {
        public List<PWayUnitsData> Data;
        public string Color;

        public PWayUnits(List<PWayUnitsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public PWayUnits()
        {
            Data = new List<PWayUnitsData>();
            Color = "#FF5733";
        }
    }
}