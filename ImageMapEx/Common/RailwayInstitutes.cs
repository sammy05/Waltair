using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class RailwayInstitutesData
    {
        //public string instituteName;
        //public string structureType;
        //public string indoorSportsFacility;

        //public RailwayInstitutesData(string instituteName, string structureType, string indoorSportsFacility)
        //{
        //    this.instituteName = instituteName;
        //    this.structureType = structureType;
        //    this.indoorSportsFacility = indoorSportsFacility;
        //}
        public int instiCount;

        public RailwayInstitutesData(string instiCount)
        {
            int.TryParse(instiCount, out this.instiCount);
        }
    }
    public class RailwayInstitutes
    {
        public List<RailwayInstitutesData> Data;
        public string Color;

        public RailwayInstitutes(List<RailwayInstitutesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public RailwayInstitutes()
        {
            Data = new List<RailwayInstitutesData>();
            Color = "#FF5733";
        }
    }
}