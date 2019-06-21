using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class FreightTrainExaminationData
    {
        //public string yard;
        //public int pme;
        //public int premium;
        //public int intensive;

        //public FreightTrainExaminationData(string yard, string pme, string premium, string intensive)
        //{
        //    this.yard = yard;
        //    int.TryParse(pme, out this.pme);
        //    int.TryParse(premium, out this.premium);
        //    int.TryParse(intensive, out this.intensive);
        //}

        public long noPassenger;
        public string pct;

        public FreightTrainExaminationData(string noPassenger, string pct)
        {
            long.TryParse(noPassenger, out this.noPassenger);
            this.pct = pct;
        }
    }

    public class FreightTrainExamination
    {
        public List<FreightTrainExaminationData> Data;
        public string Color;

        public FreightTrainExamination(List<FreightTrainExaminationData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public FreightTrainExamination()
        {
            Data = new List<FreightTrainExaminationData>();
            Color = "#FF5733";
        }
    }
}