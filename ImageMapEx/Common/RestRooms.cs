using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class RestRoomsData
    {
        //public string forWhom;
        public string type;
        public int capacity;

        //public RestRoomsData(string forWhom, string type, string capacity)
        public RestRoomsData( string type, string capacity)
        {
            //this.forWhom = forWhom;
            this.type = type;
            int.TryParse(capacity, out this.capacity);
        }
    }
    public class RestRooms
    {
        public List<RestRoomsData> Data;
        public string Color;

        public RestRooms(List<RestRoomsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public RestRooms()
        {
            Data = new List<RestRoomsData>();
            Color = "#FF5733";
        }
    }
}