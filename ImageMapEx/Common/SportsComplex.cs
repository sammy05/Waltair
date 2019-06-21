using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class SportsComplexData
    {
        //public string facility;
        //public string sport;
        //public string details;
        //public string inDoorOutDoor;

        //public SportsComplexData(string facility, string sport, string details, string inDoorOutDoor)
        //{
        //    this.facility = facility;
        //    this.sport = sport;
        //    this.details = details;
        //    this.inDoorOutDoor = inDoorOutDoor;
        //}

        public int indoorCount;
        public int outdoorCount;

        public SportsComplexData(string indoorCount, string outdoorCount)
        {
            int.TryParse(indoorCount, out this.indoorCount);
            int.TryParse(outdoorCount, out this.outdoorCount);
        }
    }

    public class SportsComplex
    {
        public List<SportsComplexData> Data;
        public string Color;

        public SportsComplex(List<SportsComplexData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public SportsComplex()
        {
            Data = new List<SportsComplexData>();
            Color = "#FF5733";
        }
    }
}