using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class CommunityHallData
    {
        //public string communityHallName;
        //public string structureType;
        //public string kitchenFacility;
        //public string otherRoooms;

        //public CommunityHallData(string communityHallName, string structureType, 
        //    string kitchenFacility, string otherRoooms)
        //{
        //    this.communityHallName = communityHallName;
        //    this.structureType = structureType;
        //    this.kitchenFacility = kitchenFacility;
        //    this.otherRoooms = otherRoooms;
        //}
        public int countHalls;

        public CommunityHallData(string countHalls)
        {
            int.TryParse(countHalls, out this.countHalls);
        }
    }
    public class CommunityHall
    {
        public List<CommunityHallData> Data;
        public string Color;

        public CommunityHall(List<CommunityHallData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public CommunityHall()
        {
            Data = new List<CommunityHallData>();
            Color = "#FF5733";
        }
    }
}