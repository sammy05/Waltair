using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class SignalDETUData
    {
        //SNo,Stations,SECTION,OFC,hut,Exchange,DETU,KHH,TECH,JE,SSE
        //1,DVD,DVD-PUN,1,0,2175.5925,1,1,0,0
        public string section;
        public int OFC;
        public int hut;
        public double exchange;
        public int DETU;
        public int KHH;
        public int TECH;
        public int JE;
        public int SSE;

        public SignalDETUData(string section, string oFC, string hut, string exchange, 
            string dETU, string kHH, string tECH, string jE, string sSE)
        {
            this.section = section;
            int.TryParse(oFC, out OFC);
            int.TryParse(hut, out this.hut);
            double.TryParse(exchange, out this.exchange);
            int.TryParse(dETU, out DETU);
            int.TryParse(kHH, out KHH);
            int.TryParse(tECH, out TECH);
            int.TryParse(jE, out JE);
            int.TryParse(sSE, out SSE);
        }
    }

    public class SignalDETU
    {
        public List<SignalDETUData> Data;
        public string Color;

        public SignalDETU(List<SignalDETUData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public SignalDETU()
        {
            Data = new List<SignalDETUData>();
            Color = "#AA5733";
        }
    }

    public class SignalDESUData
    {
//        S.No.,Station,SECTION,EI,PI,RRI,LEVER OPTD., IBS, ABS, DESU, KHH, TECH, JE, SSE
//1, VSKP, DVD-PUN,0,0,1,0,0,0,4807.54,25,11,1,2
        public string section;
        public int EI;
        public int PI;
        public int RRI;
        public int LEVER;
        public int IBS;
        public int ABS;
        public double DESU;
        public int KHH;
        public int TECH;
        public int JE;
        public int SSE;

        public SignalDESUData(string section, string eI, string pI,
            string rRI, string lEVER, string iBS, string aBS, string dESU,
            string kHH, string tECH, string jE, string sSE)
        {
            this.section = section;
            int.TryParse(eI, out EI);
            int.TryParse(pI, out PI);
            int.TryParse(rRI, out RRI);
            int.TryParse(lEVER, out LEVER);
            int.TryParse(iBS, out IBS);
            int.TryParse(aBS, out ABS);
            double.TryParse(dESU, out DESU);
            int.TryParse(kHH, out KHH);
            int.TryParse(tECH, out TECH);
            int.TryParse(jE, out JE);
            int.TryParse(sSE, out SSE);
        }
    }

    public class SignalDESU
    {
        public List<SignalDESUData> Data;
        public string Color;

        public SignalDESU(List<SignalDESUData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public SignalDESU()
        {
            Data = new List<SignalDESUData>();
            Color = "#CC5733";
        }
    }
}