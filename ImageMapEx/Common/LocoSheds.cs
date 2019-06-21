using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //Sno,Station,Shed,Type of Locos,Loco Holding & Maintenance
    public class LocoShedsData
    {
        //public string shed;
        //public string typeLoco;
        //public int locoHolding;

        //public LocoShedsData(string shed, string typeLoco, string locoHolding)
        //{
        //    this.shed = shed;
        //    this.typeLoco = typeLoco;
        //    int.TryParse(locoHolding, out this.locoHolding);
        //}
        public int dieselLocoShed;
        public int electricLocoShed;

        public LocoShedsData(string dieselLocoShed, string electricLocoShed)
        {
            int.TryParse(dieselLocoShed, out this.dieselLocoShed);
            int.TryParse(electricLocoShed, out this.electricLocoShed);
        }
    }

    public class LocoSheds
    {
        public List<LocoShedsData> Data;
        public string Color;

        public LocoSheds(List<LocoShedsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public LocoSheds()
        {
            Data = new List<LocoShedsData>();
            Color = "#FF5733";
        }
    }
}