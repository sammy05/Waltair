using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //Sno,Station codes,Bridge Supervisory units,
    //Line,No. of Important Bridges,No. of Major Bridges,No. of Minor Bridges
    public class BridgesData
    {
        public string supervisoryUnits;
        public string line;
        public int impBridgesCount;
        public int majorBridgesCount;
        public int minorBridgesCount;

        public BridgesData(string supervisoryUnits, string line, string impBridgesCount,
            string majorBridgesCount, string minorBridgesCount)
        {
            this.supervisoryUnits = supervisoryUnits;
            this.line = line;
            int.TryParse(impBridgesCount, out this.impBridgesCount);
            int.TryParse(majorBridgesCount, out this.majorBridgesCount);
            int.TryParse(minorBridgesCount, out this.minorBridgesCount);
        }
    }

    public class Bridges
    {
        public List<BridgesData> Data;
        public string Color;

        public Bridges(List<BridgesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public Bridges()
        {
            Data = new List<BridgesData>();
            Color = "#FF5733";
        }
    }
}