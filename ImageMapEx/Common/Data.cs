using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx
{
    public class Data
    {
        public string Name;
        public string Url;
        public List<FreightData> Details;

        public Data()
        {
            this.Name = "";
            this.Url = "";
            Details = new List<FreightData>();
        }
    }


}