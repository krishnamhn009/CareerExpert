using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POCOLib
{
    public class CollegeList
    {
        public string ClgName { get; set; }
        public string State
        { set; get; }
        public string CourseName
        { set; get; }

        public CollegeList(string clgName, string state, string courseName)
        {
            this.ClgName = clgName;
            this.State = state;
            this.CourseName = courseName;
        }
    }
}
