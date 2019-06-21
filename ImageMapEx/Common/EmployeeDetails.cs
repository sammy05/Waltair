using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    //Sno,Station,STATIONCODE,STATIONDESC,COUNT(AEMPNO), % of total employees in the division.
    public class EmployeeDetailsData
    {
        //public string stationCode;
        //public string stationDesc;
        //public int employeeCount;
        //public double pctEmployee;

        //public EmployeeDetailsData(string stationCode, string stationDesc, string employeeCount, string pctEmployee)
        //{
        //    this.stationCode = stationCode;
        //    this.stationDesc = stationDesc;
        //    int.TryParse(employeeCount, out this.employeeCount);
        //    double.TryParse(pctEmployee, out this.pctEmployee);
        //}

        public int employeeCount;
        public string pctEmployee;

        public EmployeeDetailsData(string employeeCount, string pctEmployee)
        {
            int.TryParse(employeeCount, out this.employeeCount);
            this.pctEmployee = pctEmployee;
        }
    }

    public class EmployeeDetails
    {
        public List<EmployeeDetailsData> Data;
        public string Color;

        public EmployeeDetails(List<EmployeeDetailsData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public EmployeeDetails()
        {
            Data = new List<EmployeeDetailsData>();
            Color = "#FF5733";
        }
    }
}