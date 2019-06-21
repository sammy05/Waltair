using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Hosting;
using ImageMapEx.Common;
using System.Linq;
using System.Configuration;

namespace ImageMapEx
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Common.PageLoad.Init();
        }

        [System.Web.Services.WebMethod]
        public static string GetImageMap(string filter)
        {
            //System.Threading.Thread.Sleep(5000);
            StringBuilder sb = new StringBuilder();
            try
            {
                sb.Append("<map name='image-map' class='activeMap'>");
                string path = HostingEnvironment.MapPath(@"~/App_Data/MapCoordinates.txt");
                StreamReader file = new StreamReader(path);
                string line;
                while ((line = file.ReadLine()) != null)
                {
                    string[] fields = line.Split(',');
                    if (filter.Equals("ALL"))
                    {
                        sb.Append(Common.PageLoad.CreateDynamicImageMap(fields[0], fields[1], fields[2], true));
                    }
                    else if (filter.Equals("NONE"))
                    {

                    }
                    else
                    {
                        if (fields[0].ToUpper().Contains(filter.ToUpper()))
                            sb.Append(Common.PageLoad.CreateDynamicImageMap(fields[0], fields[1], fields[2], true));
                        else
                            sb.Append(Common.PageLoad.CreateDynamicImageMap(fields[0], fields[1], fields[2], false));
                    }
                }
                sb.Append("</map>");
                file.Close();
            }
            catch (Exception ex)
            {

            }
            return sb.ToString();
        }

        [System.Web.Services.WebMethod]
        public static string GetDivisionalTrainingCentres()
        {
            return "";
        }

        //[System.Web.Services.WebMethod]
        //public static string GetConstructionOffices()
        //{
        //Dictionary<string, ConstructionOffices> constructionOffices = new Dictionary<string, ConstructionOffices>();
        //string dataPath = @"C:\Users\ssrivastava\Downloads\datasheets\Excel files\Excel files\Map view\Station wise consturuction offices.csv";
        //StreamReader dataFile = new StreamReader(dataPath);
        //string dataLine;
        //int count = 0;
        //while ((dataLine = dataFile.ReadLine()) != null)
        //{
        //    if (++count > 1)
        //    {
        //        string[] fields = RegexSplit(dataLine);
        //        constructionOffices[fields[1]] = new ConstructionOffices(Convert.ToInt32(fields[2]), Convert.ToInt32(fields[3]));
        //    }
        //}

        //return BuildImageMap(new List<string>(constructionOffices.Keys)) + "~" + JsonConvert.SerializeObject(constructionOffices);
        //}

        [System.Web.Services.WebMethod]
        public static string GetConstructionOffices()
        {
            Dictionary<string, ConstructionOffices> constructionOfficeDict = new Dictionary<string, ConstructionOffices>();
            List<string> records = ReadFile("ConstructionOfficeFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!constructionOfficeDict.ContainsKey(stationCode))
                    {
                        constructionOfficeDict[stationCode] = new ConstructionOffices();
                    }
                    constructionOfficeDict[stationCode].Data.Add(new ConstructionOfficesData(fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(constructionOfficeDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(constructionOfficeDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetRailCoefficient()
        {
            Dictionary<string, RailCoefficient> railCoefficientDict = new Dictionary<string, RailCoefficient>();
            List<string> records = ReadFile("RailCoeffFileName");
            string[] Headers = new string[50];
            int count = 0;
            //while ((dataLine = dataFile.ReadLine()) != null)
            foreach(string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!railCoefficientDict.ContainsKey(stationCode))
                    {
                        railCoefficientDict[stationCode] = new RailCoefficient();
                    }
                    railCoefficientDict[stationCode].Data.Add(new RailCoefficientData(fields[1], fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(railCoefficientDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(railCoefficientDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetFreightLoading()
        {
            Dictionary<string, FreightLoading> freightLoadingDict = new Dictionary<string, FreightLoading>();
            List<string> records = ReadFile("FreightLoadingFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!freightLoadingDict.ContainsKey(stationCode))
                    {
                        freightLoadingDict[stationCode] = new FreightLoading();
                    }
                    //freightLoadingDict[stationCode].Data.Add(new FreightLoadingData(fields[2], fields[3], fields[4], fields[5], fields[6], fields[7]));
                    freightLoadingDict[stationCode].Data.Add(new FreightLoadingData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(freightLoadingDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(freightLoadingDict);
        }


        [System.Web.Services.WebMethod]
        public static string GetFreightTrainExamData()
        {
            Dictionary<string, FreightTrainExamination> freightExamDict = new Dictionary<string, FreightTrainExamination>();
            List<string> records = ReadFile("FreightTrainExmFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!freightExamDict.ContainsKey(stationCode))
                    {
                        freightExamDict[stationCode] = new FreightTrainExamination();
                    }
                    //freightExamDict[stationCode].Data.Add(new FreightTrainExaminationData(fields[2], fields[3], fields[4], fields[5]));
                    freightExamDict[stationCode].Data.Add(new FreightTrainExaminationData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(freightExamDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(freightExamDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetFreightTrainExamEarningData()
        {
            Dictionary<string, FreightTrainExamination> freightExamDict = new Dictionary<string, FreightTrainExamination>();
            List<string> records = ReadFile("FreightTrainExmEarningFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!freightExamDict.ContainsKey(stationCode))
                    {
                        freightExamDict[stationCode] = new FreightTrainExamination();
                    }
                    freightExamDict[stationCode].Data.Add(new FreightTrainExaminationData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(freightExamDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(freightExamDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetPassengerTraffic()
        {
            Dictionary<string, PassengerTraffic> passengerTrafficDict = new Dictionary<string, PassengerTraffic>();
            List<string> records = ReadFile("PassengerTrafficFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!passengerTrafficDict.ContainsKey(stationCode))
                    {
                        passengerTrafficDict[stationCode] = new PassengerTraffic();
                    }
                    passengerTrafficDict[stationCode].Data.Add(new PassengerTrafficData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(passengerTrafficDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(passengerTrafficDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetSignalDETU()
        {
            Dictionary<string, SignalDETU> signalDETUDict = new Dictionary<string, SignalDETU>();
            string dataPath = @"C:\Users\ssrivastava\Downloads\datasheets\Excel files\Excel files\Signal Telecom Assets\Station wise Telecom assets and DETU.csv";
            StreamReader dataFile = new StreamReader(dataPath);
            string dataLine;
            string[] Headers = new string[50];
            int count = 0;
            while ((dataLine = dataFile.ReadLine()) != null)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!signalDETUDict.ContainsKey(stationCode))
                    {
                        signalDETUDict[stationCode] = new SignalDETU();
                    }
                    signalDETUDict[stationCode].Data.Add(new SignalDETUData(fields[2], fields[3], fields[4],
                        fields[5], fields[6], fields[7], fields[8], fields[9], "1"));
                }
            }

            return BuildImageMap(new List<string>(signalDETUDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(signalDETUDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetSignalDESU()
        {
            Dictionary<string, SignalDESU> signalDESUDict = new Dictionary<string, SignalDESU>();
            string dataPath = @"C:\Users\ssrivastava\Downloads\datasheets\Excel files\Excel files\Signal Telecom Assets\Station wise signalling assets and DESU.csv";
            StreamReader dataFile = new StreamReader(dataPath);
            string dataLine;
            string[] Headers = new string[50];
            int count = 0;
            while ((dataLine = dataFile.ReadLine()) != null)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!signalDESUDict.ContainsKey(stationCode))
                    {
                        signalDESUDict[stationCode] = new SignalDESU();
                    }
                    signalDESUDict[stationCode].Data.Add(new SignalDESUData(fields[2], fields[3], fields[4],
                        fields[5], fields[6], fields[7], fields[8], fields[9], fields[10], fields[11], fields[12], fields[13]));
                }
            }

            return BuildImageMap(new List<string>(signalDESUDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(signalDESUDict);
        }

        

        [System.Web.Services.WebMethod]
        public static string GetSecurity()
        {
            Dictionary<string, Security> securityDict = new Dictionary<string, Security>();
            List<string> records = ReadFile("RPFPostFileName");
            string[] Headers = new string[14];
            int count = 0;
            //while ((dataLine = dataFile.ReadLine()) != null)
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();
                    //Headers[0] = "Office";
                    //Headers[1] = "RPF Post";
                    //Headers[2] = "RPF Outpost";
                    //Headers[3] = "Section";
                    //Headers[4] = "Sanct RPF";
                    //Headers[5] = "On Roll RPF";
                    //Headers[6] = "Sanct Min. Staff";
                    //Headers[7] = "On Roll Min. Staff";
                    //Headers[8] = "Sanct Tech";
                    //Headers[9] = "On Roll Tech";
                    //Headers[10] = "Sanct Cook";
                    //Headers[11] = "On Roll Cook";
                    //Headers[12] = "Sanct L1";
                    //Headers[13] = "On Roll L1";
                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!securityDict.ContainsKey(stationCode))
                    {
                        securityDict[stationCode] = new Security();
                    }
                    //securityDict[stationCode].Data.Add(new SecurityData(fields[2], fields[3], fields[4],
                    //    fields[5], fields[6], fields[7], fields[8], fields[9], fields[10], fields[11], fields[12], fields[13], fields[14], fields[15]));
                    securityDict[stationCode].Data.Add(new SecurityData(fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(securityDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(securityDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetRunningRooms()
        {
            Dictionary<string, RunningRooms> runningRoomsDict = new Dictionary<string, RunningRooms>();
            List<string> records = ReadFile("RunningRoomsFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }
                    if (!runningRoomsDict.ContainsKey(stationCode))
                    {
                        runningRoomsDict[stationCode] = new RunningRooms();
                    }
                    runningRoomsDict[stationCode].Data.Add(new RunningRoomsData(fields[1], fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(runningRoomsDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(runningRoomsDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetRestRooms()
        {
            Dictionary<string, RestRooms> restRoomsDict = new Dictionary<string, RestRooms>();
            List<string> records = ReadFile("TTERestRoomsFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }
                    if (!restRoomsDict.ContainsKey(stationCode))
                    {
                        restRoomsDict[stationCode] = new RestRooms();
                    }
                    restRoomsDict[stationCode].Data.Add(new RestRoomsData(fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(restRoomsDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(restRoomsDict);
        }


        [System.Web.Services.WebMethod]
        public static string GetChangeStations()
        {
            Dictionary<string, ChangeStations> changeStationDict = new Dictionary<string, ChangeStations>();
            List<string> records = ReadFile("TTEChangePointFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }
                    if (!changeStationDict.ContainsKey(stationCode))
                    {
                        changeStationDict[stationCode] = new ChangeStations();
                    }
                    changeStationDict[stationCode].Data.Add(new ChangeStationsData(fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(changeStationDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(changeStationDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetQuarters()
        {
            Dictionary<string, Quarters> quartersDict = new Dictionary<string, Quarters>();
            List<string> records = ReadFile("QuartersFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!quartersDict.ContainsKey(stationCode))
                    {
                        quartersDict[stationCode] = new Quarters();
                    }
                    quartersDict[stationCode].Data.Add(new QuartersData(fields[2], fields[3], fields[4],
                        fields[5], fields[6], fields[7], fields[8]));
                }
            }

            return BuildImageMap(new List<string>(quartersDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(quartersDict);
        }


        [System.Web.Services.WebMethod]
        public static string GetART()
        {
            return GetDisasterMangementData("ART");
        }

        [System.Web.Services.WebMethod]
        public static string GetARME()
        {
            return GetDisasterMangementData("ARME");
        }

        private static string GetDisasterMangementData(string filter)
        {
            Dictionary<string, DisasterManagement> ARTDict = new Dictionary<string, DisasterManagement>();
            List<string> records = ReadFile("DisasterManageFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";

                    if (fields[2].Contains(filter))
                    {
                        if (!ARTDict.ContainsKey(stationCode))
                        {
                            ARTDict[stationCode] = new DisasterManagement();
                        }
                        ARTDict[stationCode].Data.Add(new DisasterManagementData(fields[2], fields[3], fields[4]));
                    }
                }
            }

            return BuildImageMap(new List<string>(ARTDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(ARTDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetBridges()
        {
            Dictionary<string, Bridges> bridgesDict = new Dictionary<string, Bridges>();
            List<string> records = ReadFile("BRIFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!bridgesDict.ContainsKey(stationCode))
                    {
                        bridgesDict[stationCode] = new Bridges();
                    }
                    bridgesDict[stationCode].Data.Add(new BridgesData(fields[2], fields[3], fields[4],
                        fields[5], fields[6]));
                }
            }
            return BuildImageMap(new List<string>(bridgesDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(bridgesDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetCWFacilities()
        {
            Dictionary<string, Coach> coachDict = new Dictionary<string, Coach>();
            List<string> records = ReadFile("CWFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!coachDict.ContainsKey(stationCode))
                    {
                        coachDict[stationCode] = new Coach();
                    }
                    coachDict[stationCode].Data.Add(new CoachData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(coachDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(coachDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetWeighBridges()
        {
            Dictionary<string, WeighBridges> weighBridgesDict = new Dictionary<string, WeighBridges>();
            List<string> records = ReadFile("WeighBridgeFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!weighBridgesDict.ContainsKey(stationCode))
                    {
                        weighBridgesDict[stationCode] = new WeighBridges();
                    }
                    weighBridgesDict[stationCode].Data.Add(new WeighBridgesData(fields[2]));
                }
            }

            return BuildImageMap(new List<string>(weighBridgesDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(weighBridgesDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetCrewBookingPoints()
        {
            Dictionary<string, CrewBookingPoints> crewBookingDict
                = new Dictionary<string, CrewBookingPoints>();
            List<string> records = ReadFile("CrewBookingFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!crewBookingDict.ContainsKey(stationCode))
                    {
                        crewBookingDict[stationCode] = new CrewBookingPoints();
                    }
                    crewBookingDict[stationCode].Data.Add(new CrewBookingPointsData(fields[2], fields[3], fields[4]));
                }
            }

            return BuildImageMap(new List<string>(crewBookingDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(crewBookingDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetLocoSheds()
        {
            Dictionary<string, LocoSheds> locoShedDict
                = new Dictionary<string, LocoSheds>();
            List<string> records = ReadFile("LocoShedFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!locoShedDict.ContainsKey(stationCode))
                    {
                        locoShedDict[stationCode] = new LocoSheds();
                    }
                    locoShedDict[stationCode].Data.Add(new LocoShedsData(fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(locoShedDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(locoShedDict);
        }


        [System.Web.Services.WebMethod]
        public static string GetEmployeeDetails()
        {
            Dictionary<string, EmployeeDetails> employeeDict
                = new Dictionary<string, EmployeeDetails>();
            List<string> records = ReadFile("EmployeesFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!employeeDict.ContainsKey(stationCode))
                    {
                        employeeDict[stationCode] = new EmployeeDetails();
                    }
                    employeeDict[stationCode].Data.Add(new EmployeeDetailsData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(employeeDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(employeeDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetCommunityHalls()
        {
            Dictionary<string, CommunityHall> communityHallDict
                = new Dictionary<string, CommunityHall>();
            List<string> records = ReadFile("CommunityHallFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!communityHallDict.ContainsKey(stationCode))
                    {
                        communityHallDict[stationCode] = new CommunityHall();
                    }
                    //communityHallDict[stationCode].Data.Add(new CommunityHallData(fields[2], fields[3], fields[4], fields[5]));
                    communityHallDict[stationCode].Data.Add(new CommunityHallData(fields[1]));
                }
            }

            return BuildImageMap(new List<string>(communityHallDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(communityHallDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetOfficersClub()
        {
            Dictionary<string, OfficersClub> officersClubDict
                = new Dictionary<string, OfficersClub>();
            List<string> records = ReadFile("OfficersClubeFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!officersClubDict.ContainsKey(stationCode))
                    {
                        officersClubDict[stationCode] = new OfficersClub();
                    }
                    officersClubDict[stationCode].Data.Add(new OfficersClubData(fields[2]));
                    //officersClubDict[stationCode].Data.Add(new OfficersClubData(fields[2], fields[3], fields[4], fields[5], fields[6]));
                }
            }

            return BuildImageMap(new List<string>(officersClubDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(officersClubDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetORH()
        {
            Dictionary<string, Orh> orhDict
                = new Dictionary<string, Orh>();
            List<string> records = ReadFile("ORHFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!orhDict.ContainsKey(stationCode))
                    {
                        orhDict[stationCode] = new Orh();
                    }
                    orhDict[stationCode].Data.Add(new OrhData(fields[1], fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(orhDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(orhDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetSRH()
        {
            Dictionary<string, Orh> orhDict
                = new Dictionary<string, Orh>();
            List<string> records = ReadFile("SRHFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!orhDict.ContainsKey(stationCode))
                    {
                        orhDict[stationCode] = new Orh();
                    }
                    orhDict[stationCode].Data.Add(new OrhData(fields[1], fields[2], fields[3]));
                }
            }

            return BuildImageMap(new List<string>(orhDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(orhDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetRailwayInstitutes()
        {
            Dictionary<string, RailwayInstitutes> railwayInstiDict
                = new Dictionary<string, RailwayInstitutes>();
            List<string> records = ReadFile("RailwayInstituteFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!railwayInstiDict.ContainsKey(stationCode))
                    {
                        railwayInstiDict[stationCode] = new RailwayInstitutes();
                    }
                    //railwayInstiDict[stationCode].Data.Add(new RailwayInstitutesData(fields[2], fields[3], fields[4]));
                    railwayInstiDict[stationCode].Data.Add(new RailwayInstitutesData(fields[1]));
                }
            }

            return BuildImageMap(new List<string>(railwayInstiDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(railwayInstiDict);
        }


        [System.Web.Services.WebMethod]
        public static string GetSportsComplex()
        {
            Dictionary<string, SportsComplex> sportComplexDict
                = new Dictionary<string, SportsComplex>();
            List<string> records = ReadFile("SportsComplexFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!sportComplexDict.ContainsKey(stationCode))
                    {
                        sportComplexDict[stationCode] = new SportsComplex();
                    }
                    //sportComplexDict[stationCode].Data.Add(new SportsComplexData(fields[2], fields[3], fields[4], fields[5]));
                    sportComplexDict[stationCode].Data.Add(new SportsComplexData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(sportComplexDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(sportComplexDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetTrainingCenters()
        {
            Dictionary<string, TrainingCenter> trainingCenterDict
                = new Dictionary<string, TrainingCenter>();

            List<string> records = ReadFile("TrainingCenterFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(2).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[1];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!trainingCenterDict.ContainsKey(stationCode))
                    {
                        trainingCenterDict[stationCode] = new TrainingCenter();
                    }
                    trainingCenterDict[stationCode].Data.Add(new TrainingCenterData(fields[2], fields[3], fields[4], fields[5]));
                }
            }

            return BuildImageMap(new List<string>(trainingCenterDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(trainingCenterDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetMedicalFacilities()
        {
            Dictionary<string, MedicalFacilities> medicalFacilitiesDict
                = new Dictionary<string, MedicalFacilities>();
            List<string> records = ReadFile("MedicalFileName");
            string[] Headers = new string[14];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    //if (stationCode.Equals("") || stationCode.Length == 0 || stationCode == null)
                    //    stationCode = fields[2];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!medicalFacilitiesDict.ContainsKey(stationCode))
                    {
                        medicalFacilitiesDict[stationCode] = new MedicalFacilities();
                    }
                    medicalFacilitiesDict[stationCode].Data.Add(new MedicalFacilitiesData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(medicalFacilitiesDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(medicalFacilitiesDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetPWayUnits()
        {
            Dictionary<string, PWayUnits> pWayUnitsDict = new Dictionary<string, PWayUnits>();
            string dataDirectory = ConfigurationManager.AppSettings["DataDirectory"].ToString();
            string fileName = ConfigurationManager.AppSettings["PWayUnitsFileName"].ToString();
            string dataPath = dataDirectory + fileName;
            StreamReader dataFile = new StreamReader(dataPath);
            string dataLine;
            string[] Headers = new string[14];
            int count = 0;
            while ((dataLine = dataFile.ReadLine()) != null)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";
                    if (!pWayUnitsDict.ContainsKey(stationCode))
                    {
                        pWayUnitsDict[stationCode] = new PWayUnits();
                    }
                    pWayUnitsDict[stationCode].Data.Add(new PWayUnitsData(fields[1], fields[2], fields[3],
                        fields[4], fields[5], fields[6]));
                }
            }

            return BuildImageMap(new List<string>(pWayUnitsDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(pWayUnitsDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetMajorOffices()
        {
            Dictionary<string, MajorOffices> majorOfficesDict = new Dictionary<string, MajorOffices>();
            List<string> records = ReadFile("MajorOfficesFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();

                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (stationCode.Contains("(") && stationCode.Contains(")"))
                    {
                        stationCode = stationCode.Split('(')[1].Trim();
                        stationCode = stationCode.Split(')')[0].Trim();
                    }

                    if (stationCode.Equals("VISAKHAPATNAM"))
                        stationCode = "VSKP";

                    if (!majorOfficesDict.ContainsKey(stationCode))
                    {
                        majorOfficesDict[stationCode] = new MajorOffices();
                    }
                    majorOfficesDict[stationCode].Data.Add(new MajorOfficesData(fields[1]));
                }
            }

            return BuildImageMap(new List<string>(majorOfficesDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(majorOfficesDict);
        }

        [System.Web.Services.WebMethod]
        public static string GetLHTrainForming()
        {
            Dictionary<string, LHTrainForming> LHTrainDict = new Dictionary<string, LHTrainForming>();
            List<string> records = ReadFile("LHTrainFileName");
            string[] Headers = new string[50];
            int count = 0;
            foreach (string dataLine in records)
            {
                count++;
                string[] fields = RegexSplit(dataLine);
                if (count == 1)
                {
                    Headers = fields.Skip(1).ToArray();
                }
                else if (count > 1)
                {
                    string stationCode = fields[0];
                    stationCode = stationCode.Split('/')[0].Trim();
                    if (!LHTrainDict.ContainsKey(stationCode))
                    {
                        LHTrainDict[stationCode] = new LHTrainForming();
                    }
                    LHTrainDict[stationCode].Data.Add(new LHTrainFormingData(fields[1], fields[2]));
                }
            }

            return BuildImageMap(new List<string>(LHTrainDict.Keys)) + "~" + JsonConvert.SerializeObject(Headers)
                + "~" + JsonConvert.SerializeObject(LHTrainDict);
        }

        private static List<string> ReadFile(string fileNameIndicator)
        {
            List<string> records = new List<string>();
            string dataDirectory = ConfigurationManager.AppSettings["DataDirectory"].ToString();
            string fileName = ConfigurationManager.AppSettings[fileNameIndicator].ToString();
            string dataPath = dataDirectory + fileName;
            StreamReader dataFile = new StreamReader(dataPath);

            string dataLine;
            while ((dataLine = dataFile.ReadLine()) != null)
            {
                records.Add(dataLine);
            }
            dataFile.Close();

            return records;
        }

        private static string BuildImageMap(List<string> activeStationCodes)
        {
            activeStationCodes.Sort();
            StringBuilder ImageMap = new StringBuilder();
            try
            {
                ImageMap.Append("<map name='image-map' class='activeMap'>");
                List<string[]> listStations = GetImageCoords();
                foreach (string[] fields in listStations)
                {
                    if (activeStationCodes.Contains(fields[0]))
                        ImageMap.Append(PageLoad.CreateDynamicImageMap(fields[0], fields[1], fields[2], true));
                    else
                        ImageMap.Append(PageLoad.CreateDynamicImageMap(fields[0], fields[1], fields[2], false));
                }
            }
            catch (Exception ex)
            {

            }
            ImageMap.Append("</map>");
            return ImageMap.ToString();
        }

        private static List<string[]> GetImageCoords()
        {
            List<string[]> listStations = new List<string[]>();
            try
            {
                string path = HostingEnvironment.MapPath(@"~/App_Data/MapCoordinates.txt");
                StreamReader file = new StreamReader(path);
                string line;
                while ((line = file.ReadLine()) != null)
                {
                    listStations.Add(RegexSplit(line));
                }
                file.Close();
            }
            catch (Exception ex)
            {

            }
            return listStations;
        }

        private static string[] RegexSplit(string line)
        {
            Regex CSVParser = new Regex(",(?=(?:[^\"]*\"[^\"]*\")*(?![^\"]*\"))");
            string[] Fields = CSVParser.Split(line);

            // clean up the fields (remove " and leading spaces)
            for (int i = 0; i < Fields.Length; i++)
            {
                Fields[i] = Fields[i].TrimStart(' ', '"').TrimEnd('"');
            }
            return Fields;
        }
    }
}