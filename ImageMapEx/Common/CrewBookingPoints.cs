using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //Sno,Station,Crew Base / Crew Booking Point,Type of Crew,Avg. Crew Booked per day
    public class CrewBookingPointsData
    {
        public string crewBookingPoint;
        public string type;
        public string avgCrewBooked;

        public CrewBookingPointsData(string crewBookingPoint, string type, string avgCrewBooked)
        {
            this.crewBookingPoint = crewBookingPoint;
            this.type = type;
            this.avgCrewBooked = avgCrewBooked;
        }
    }

    public class CrewBookingPoints
    {
        public List<CrewBookingPointsData> Data;
        public string Color;

        public CrewBookingPoints(List<CrewBookingPointsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public CrewBookingPoints()
        {
            Data = new List<CrewBookingPointsData>();
            Color = "#FF5733";
        }
    }
}