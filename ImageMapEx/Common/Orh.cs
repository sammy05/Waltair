using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class OrhData
    {
        //public string orhName;
        public int acRoomsCount;
        public int nonACRoomsCount;
        public int bedCount;

        public OrhData(/*string orhName,*/ string acRoomsCount, string nonACRoomsCount, string bedCount)
        {
            //this.orhName = orhName;
            int.TryParse(acRoomsCount, out this.acRoomsCount);
            int.TryParse(nonACRoomsCount, out this.nonACRoomsCount);
            int.TryParse(bedCount, out this.bedCount);
        }
    }

    public class Orh
    {
        public List<OrhData> Data;
        public string Color;

        public Orh(List<OrhData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public Orh()
        {
            Data = new List<OrhData>();
            Color = "#FF5733";
        }
    }
}