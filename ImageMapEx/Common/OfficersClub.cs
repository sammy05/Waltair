using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class OfficersClubData
    {
        //public string clubName;
        //public string structureType;
        //public string indoorSportsFacility;
        //public string outdoorSportsFacility;
        //public string functionHalls;

        //public OfficersClubData(string clubName, string structureType, string indoorSportsFacility, 
        //    string outdoorSportsFacility, string functionHalls)
        //{
        //    this.clubName = clubName;
        //    this.structureType = structureType;
        //    this.indoorSportsFacility = indoorSportsFacility;
        //    this.outdoorSportsFacility = outdoorSportsFacility;
        //    this.functionHalls = functionHalls;
        //}

        public int clubCount;

        public OfficersClubData(string clubCount)
        {
            int.TryParse(clubCount, out this.clubCount);
        }
    }

    public class OfficersClub
    {
        public List<OfficersClubData> Data;
        public string Color;

        public OfficersClub(List<OfficersClubData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public OfficersClub()
        {
            Data = new List<OfficersClubData>();
            Color = "#FF5733";
        }
    }
}