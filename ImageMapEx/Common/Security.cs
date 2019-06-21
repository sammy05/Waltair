using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class SecurityData
    {
        //Sno,Station,Office,RPF Post,RPF Outpost,Jurisdiction / Section,
        //No. of sanctioned RPF staff,No.On Roll  RPF Staff,No. of sanctioned Min. staff,
        //No. On Roll  Min. Staff,No. of Sanctioned Tech (Driver),No. On Roll  Tech (Driver),
        //No. of Sanctioned Cook,No. On Roll Cook,No. of Sanctioned Level 1,No.  On Roll Level 1

        //public string office;
        //public string RPFPost;
        //public string RPFOutpost;
        //public string Jurisdiction;

        //public int noSancRPF;
        //public int noRollRPF;
        //public int noSancMinStaff;
        //public int noRollMinStaff;
        //public int noSancTechStaff;
        //public int noRollTechStaff;
        //public int noSancCook;
        //public int noRollCook;
        //public int noSancL1Staff;
        //public int noRollL1Staff;

        //public SecurityData(string office, string rPFPost, string rPFOutpost, 
        //    string jurisdiction, string noSancRPF, string noRollRPF, string noSancMinStaff,
        //    string noRollMinStaff, string noSancTechStaff, string noRollTechStaff,
        //    string noSancCook, string noRollCook, string noSancL1Staff, string noRollL1Staff)
        //{
        //    this.office = office;
        //    RPFPost = rPFPost;
        //    RPFOutpost = rPFOutpost;
        //    Jurisdiction = jurisdiction;
        //    int.TryParse(noSancRPF, out this.noSancRPF);
        //    int.TryParse(noRollRPF, out this.noRollRPF);
        //    int.TryParse(noSancMinStaff, out this.noSancMinStaff);
        //    int.TryParse(noRollMinStaff, out this.noRollMinStaff);
        //    int.TryParse(noSancTechStaff, out this.noSancTechStaff);
        //    int.TryParse(noRollTechStaff, out this.noRollTechStaff);
        //    int.TryParse(noSancCook, out this.noSancCook);
        //    int.TryParse(noRollCook, out this.noRollCook);
        //    int.TryParse(noSancL1Staff, out this.noSancL1Staff);
        //    int.TryParse(noRollL1Staff, out this.noRollL1Staff);
        //}

        public int noSancRPF;
        public int noRollRPF;
        

        public SecurityData(string noSancRPF, string noRollRPF)
        {
            int.TryParse(noSancRPF, out this.noSancRPF);
            int.TryParse(noRollRPF, out this.noRollRPF);
        }
    }

    public class Security
    {
        public List<SecurityData> Data;
        public string Color;

        public Security(List<SecurityData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public Security()
        {
            Data = new List<SecurityData>();
            Color = "#FF5733";
        }
    }
}