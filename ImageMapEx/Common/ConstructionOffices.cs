using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace ImageMapEx
{
    public class ConstructionOfficesData
    {
        [JsonProperty(PropertyName = "Gazetted Strength")]
        public int GazettedStrength;
        [JsonProperty(PropertyName = "Non Gazetted Strength")]
        public int NonGazettedStrength;

        public ConstructionOfficesData(string gazettedStrength, string nonGazettedStrength)
        {
            int.TryParse(gazettedStrength, out GazettedStrength);
            int.TryParse(nonGazettedStrength, out NonGazettedStrength);
        }
    }

    public class ConstructionOffices
    {
        public List<ConstructionOfficesData> Data;
        public string Color;

        public ConstructionOffices(List<ConstructionOfficesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public ConstructionOffices()
        {
            Data = new List<ConstructionOfficesData>();
            Color = "#FF5733";
        }
    }
}