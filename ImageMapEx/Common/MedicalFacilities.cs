using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class MedicalFacilitiesData
    {
        //public string healthUnit;
        public int sanction;
        public int onRoll;

        public MedicalFacilitiesData(/*string healthUnit,*/ string sanction, string onRoll)
        {
            //this.healthUnit = healthUnit;
            int.TryParse(sanction, out this.sanction);
            int.TryParse(onRoll, out this.onRoll);
        }
    }

    public class MedicalFacilities
    {
        public List<MedicalFacilitiesData> Data;
        public string Color;

        public MedicalFacilities(List<MedicalFacilitiesData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public MedicalFacilities()
        {
            Data = new List<MedicalFacilitiesData>();
            Color = "#FF5733";
        }
    }
}