using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAOLib;
using POCOLib;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace BALLib
{
    public class JobsBAL
    {
        private JobsDAO _jobsDAO;
        public JobsDAO JobDO
        {
            get
            {
                if (_jobsDAO == null)
                    _jobsDAO = new JobsDAO();
                return _jobsDAO;
            }
            
        }
        public JobsBAL()
        {
            _jobsDAO = new JobsDAO();

        }

        public List<Jobs> getAllJobs()
        {
            return JobDO.getAllJobs();
        }

        public DataTable getAllJobs1()
        {
            return JobDO.getAllJobs1();
        }

        public bool retreiveJobs()
        {
            return JobDO.retreiveJobs();
        }

        public bool ApplyJob(string user, string job, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = JobDO.ApplyJob(user, job, userMessage, adminMessage, mailSubject);
            return result;
        }
        public bool UpdateJob(Jobs job)
        {
            bool result = JobDO.UpdateJob(job);
            return result;
        }
        public bool AddJob(Jobs job, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = JobDO.AddJob(job, userMessage, adminMessage, mailSubject);
            return result;
        }
        public bool PostJob(Jobs job, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = JobDO.PostJob(job, userMessage, adminMessage, mailSubject);
            return result;
        }

        public bool DeleteJob(string jobId)
        {
            bool result = JobDO.DeleteJob(jobId);
            return result;
        }

        public bool GetAllPricing()
        {
            return JobDO.GetAllPricing();
        }

    }
}
