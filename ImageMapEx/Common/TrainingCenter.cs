using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImageMapEx.Common
{
    public class TrainingCenterData
    {
        public int instructorCount;
        public int trainingRoomCount;
        public int traineeCapacity;
        public int hostelCapacity;

        public TrainingCenterData(string instructorCount, string trainingRoomCount, 
            string traineeCapacity, string hostelCapacity)
        {
            int.TryParse(instructorCount, out this.instructorCount);
            int.TryParse(trainingRoomCount, out this.trainingRoomCount);
            int.TryParse(traineeCapacity, out this.traineeCapacity);
            int.TryParse(hostelCapacity, out this.hostelCapacity);
        }
    }

    public class TrainingCenter
    {
        public List<TrainingCenterData> Data;
        public string Color;

        public TrainingCenter(List<TrainingCenterData> data, string color)
        {
            Data = data;
            Color = color;
        }

        public TrainingCenter()
        {
            Data = new List<TrainingCenterData>();
            Color = "#FF5733";
        }
    }
}