using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class RunningRoomsData
    {
        //SNO,Station,Crew,Class of  Running Room,Total Rooms,Bed Capacity,
        //Avg. Occupation/day,Avg. Meals/day,Avg. Crew Rest Hours
        //1,WMY(VSKP),for BZA Crew & Guard,B-Class,16,30,25,65,14:00
        //public string StationCode;
        //public string Crew;
        //public string RoomClass;
        //public int TotalRooms;
        //public int BedCapacity;
        //public int AvgOccupationPerDay;
        //public int AvgMealsPerDay;
        //public string AvgCrewRestHours;

        //public RunningRoomsData(string stationCode, string crew, string roomClass, string totalRooms, string bedCapacity,
        //    string avgOccupationPerDay, string avgMealsPerDay, string avgCrewRestHours)
        //{
        //    StationCode = stationCode;
        //    Crew = crew;
        //    RoomClass = roomClass;
        //    int.TryParse(totalRooms, out TotalRooms);
        //    int.TryParse(bedCapacity, out BedCapacity);
        //    int.TryParse(avgOccupationPerDay, out AvgOccupationPerDay);
        //    int.TryParse(avgMealsPerDay, out AvgMealsPerDay);
        //    AvgCrewRestHours = avgCrewRestHours;
        //}

        public int classA;
        public int classB;
        public int classC;

        public RunningRoomsData(string classA, string classB, string classC)
        {
            int.TryParse(classA, out this.classA);
            int.TryParse(classB, out this.classB);
            int.TryParse(classC, out this.classC);
        }
    }

    public class RunningRooms
    {
        public List<RunningRoomsData> Data;
        public string Color;

        public RunningRooms(List<RunningRoomsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public RunningRooms()
        {
            Data = new List<RunningRoomsData>();
            Color = "#FF5733";
        }
    }
}