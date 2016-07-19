using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POCOLib
{
    public class Jobs
    {
        private string _jobtitle;
        private string _jobDesc;
        private string _jobExperience;
        private string _email;
        private string _jobId;
        
        public Jobs(string jobId, string jobTitle, string jobDesc, string jobExperience, string company, string location)
        {
            this.JobId = jobId;
            this.JobTitle = jobTitle;
            this.JobDesc = jobDesc;
            this.JobExperience=jobExperience;            
            this.Company = company;
            this.Location = location;
        }
        public string JobId
        {
            get
            {
                if (_jobId != null)
                    return _jobId;
                else
                    return string.Empty;

            }
            set { _jobId = value; }
        }
        public Int32 JobExpireDays { get; set; }
        public string JobType { get; set; }
        public string Company
        { set; get; }
        public string ActiveJobs
        { set; get; }
        public string PostedDate
        { set; get; }
        public string AppliedDate
        { set; get; }
        public string PostedEmail
        { set; get; }
        public string AppliedEmail
        { set; get; }        
        public string Location
        { set; get; }
        public string JobTitle
        {
            get
            {
                if (_jobtitle != null)
                    return _jobtitle;
                else
                    return string.Empty;

            }
            set { _jobtitle = value; }
        }  
        public string JobDesc
        {
            get
            {
                if (_jobDesc != null)
                    return _jobDesc;
                else
                    return string.Empty;

            }
            set { _jobDesc = value; }
        }
        public string JobExperience
        {
            get
            {
                if (_jobExperience != null)
                    return _jobExperience;
                else
                    return string.Empty;

            }
            set { _jobExperience = value; }
        }
        public string Email
        {
            get
            {
                if (_email != null)
                    return _email;
                else
                    return string.Empty;

            }
            set { _email = value; }
        }

       
    }
}
