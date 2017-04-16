using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SqlHelper;
using POCOLib;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data;
using UtilLib;
using MySqlHelper;
using System.Configuration;
using System.Globalization;

namespace DAOLib
{
    public class JobsDAO
    {
        private MySqlConnect conn;


       public  JobsDAO()
        {
            conn = new MySqlConnect();
        }

       public bool AddJob(Jobs job, string userMessage, string adminMessage, string mailSubject)
       {
           //Change Proc
           string query = Constants.ADDJOBS;
           MySqlParameter[] sqlParameters = new MySqlParameter[11];
           sqlParameters[0] = new MySqlParameter("@p_job_id", MySqlDbType.VarChar);
           sqlParameters[0].Value = Convert.ToString(job.JobId);
           sqlParameters[1] = new MySqlParameter("@p_Job_Desc", MySqlDbType.VarChar);
           sqlParameters[1].Value = Convert.ToString(job.JobDesc);
           sqlParameters[2] = new MySqlParameter("@p_Job_Title", MySqlDbType.VarChar);
           sqlParameters[2].Value = Convert.ToString(job.JobTitle);
           sqlParameters[3] = new MySqlParameter("@p_Job_Exp", MySqlDbType.VarChar);
           sqlParameters[3].Value = Convert.ToString(job.JobExperience);
           sqlParameters[4] = new MySqlParameter("@p_Job_Loc", MySqlDbType.VarChar);
           sqlParameters[4].Value = Convert.ToString(job.Location);
           sqlParameters[5] = new MySqlParameter("@p_Job_Company", MySqlDbType.VarChar);
           sqlParameters[5].Value = Convert.ToString(job.Company);
           sqlParameters[6] = new MySqlParameter("@p_Email", MySqlDbType.VarChar);
           sqlParameters[6].Value = Convert.ToString(job.Email);
           sqlParameters[7] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
           sqlParameters[7].Value = Convert.ToString(userMessage);
           sqlParameters[8] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
           sqlParameters[8].Value = Convert.ToString(adminMessage);
           sqlParameters[9] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
           sqlParameters[9].Value = Convert.ToString(mailSubject);
            sqlParameters[10] = new MySqlParameter("@p_days", MySqlDbType.Int32);
            sqlParameters[10].Value = Convert.ToString(job.JobExpireDays);
            return conn.executeInsertQuery(query, sqlParameters);

       }

        public bool PostJob(Jobs job, string userMessage, string adminMessage, string mailSubject)
        {
            //Change Proc
            string query = Constants.POSTJOBS;
            MySqlParameter[] sqlParameters = new MySqlParameter[13];
            sqlParameters[0] = new MySqlParameter("@p_job_id", MySqlDbType.VarChar);
            sqlParameters[0].Value = Convert.ToString(job.JobId);
            sqlParameters[1] = new MySqlParameter("@p_Job_Desc", MySqlDbType.VarChar);
            sqlParameters[1].Value = Convert.ToString(job.JobDesc);
            sqlParameters[2] = new MySqlParameter("@p_Job_Title", MySqlDbType.VarChar);
            sqlParameters[2].Value = Convert.ToString(job.JobTitle);
            sqlParameters[3] = new MySqlParameter("@p_Job_Skills", MySqlDbType.VarChar);
            sqlParameters[3].Value = Convert.ToString(job.JobSkills);
            sqlParameters[4] = new MySqlParameter("@p_Job_Salary", MySqlDbType.VarChar);
            sqlParameters[4].Value = Convert.ToString(job.ExpectedCTC);
            sqlParameters[5] = new MySqlParameter("@p_Job_Exp", MySqlDbType.VarChar);
            sqlParameters[5].Value = Convert.ToString(job.JobExperience);
            sqlParameters[6] = new MySqlParameter("@p_Job_Loc", MySqlDbType.VarChar);
            sqlParameters[6].Value = Convert.ToString(job.Location);
            sqlParameters[7] = new MySqlParameter("@p_Job_Company", MySqlDbType.VarChar);
            sqlParameters[7].Value = Convert.ToString(job.Company);
            sqlParameters[8] = new MySqlParameter("@p_Email", MySqlDbType.VarChar);
            sqlParameters[8].Value = Convert.ToString(job.Email);
            sqlParameters[9] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
            sqlParameters[9].Value = Convert.ToString(userMessage);
            sqlParameters[10] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
            sqlParameters[10].Value = Convert.ToString(adminMessage);
            sqlParameters[11] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
            sqlParameters[11].Value = Convert.ToString(mailSubject);
            sqlParameters[12] = new MySqlParameter("@p_days", MySqlDbType.Int32);
            sqlParameters[12].Value = Convert.ToString(job.JobExpireDays);
            return conn.executeInsertQuery(query, sqlParameters);

        }

        public bool DeleteJob(string jobId)
       {
           string query = Constants.DELJOB;
           MySqlParameter[] sqlParameters = new MySqlParameter[1];
           sqlParameters[0] = new MySqlParameter("@p_job_id", MySqlDbType.VarChar);
           sqlParameters[0].Value = Convert.ToString(jobId);
           return conn.executeDeleteQuery(query, sqlParameters);

       }

       public bool ApplyJob(string email, string job, string userMessage, string adminMessage, string mailSubject)
       {
           string query = Constants.USERAPPLYJOB;
           MySqlParameter[] sqlParameters = new MySqlParameter[5];
           sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
           sqlParameters[0].Value = Convert.ToString(email);
           sqlParameters[1] = new MySqlParameter("@p_job_id", MySqlDbType.VarChar);
           sqlParameters[1].Value = Convert.ToString(job);
           sqlParameters[2] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
           sqlParameters[2].Value = Convert.ToString(userMessage);
           sqlParameters[3] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
           sqlParameters[3].Value = Convert.ToString(adminMessage);
           sqlParameters[4] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
           sqlParameters[4].Value = Convert.ToString(mailSubject);
           return conn.executeUpdateQuery(query, sqlParameters);
       }
       public bool UpdateJob(Jobs job)
       {
           bool result=false;
           string query = Constants.UPDATEJOB;
           MySqlParameter[] sqlParameters = new MySqlParameter[7];
           sqlParameters[0] = new MySqlParameter("@p_job_id", MySqlDbType.VarChar);
           sqlParameters[0].Value = Convert.ToString(job.JobId);
           sqlParameters[1] = new MySqlParameter("@p_Job_Desc", MySqlDbType.VarChar);
           sqlParameters[1].Value = Convert.ToString(job.JobDesc);
           sqlParameters[2] = new MySqlParameter("@p_Job_Title", MySqlDbType.VarChar);
           sqlParameters[2].Value = Convert.ToString(job.JobTitle);
           sqlParameters[3] = new MySqlParameter("@p_Job_Exp", MySqlDbType.VarChar);
           sqlParameters[3].Value = Convert.ToString(job.JobExperience);
           sqlParameters[4] = new MySqlParameter("@p_Job_Loc", MySqlDbType.VarChar);
           sqlParameters[4].Value = Convert.ToString(job.Location);
           sqlParameters[5] = new MySqlParameter("@p_Job_Company", MySqlDbType.VarChar);
           sqlParameters[5].Value = Convert.ToString(job.Company);
           sqlParameters[6] = new MySqlParameter("@p_active_jobs", MySqlDbType.VarChar);
           sqlParameters[6].Value = Convert.ToString(job.ActiveJobs);
           result= conn.executeInsertQuery(query, sqlParameters);
           if (result)
               if (ApplicationSession.Current.Jobs.Count > 0)
                   ApplicationSession.Current.Jobs.Clear();

           return result;  

       }

       public bool retreiveJobs()
       {

           MySqlParameter[] sqlParameters = new MySqlParameter[1];
           sqlParameters[0] = new MySqlParameter();
           //List<MySqlParameter> parameters = new List<MySqlParameter>();
          
           try
           {
               var resultSet = conn.executeSelectMultipleQuery(Constants.GETJOBS, sqlParameters);
               List<Jobs> postedJobs = new List<Jobs>();
               foreach (DataRow item in resultSet.Tables[0].Rows)
               {
                   Jobs job = new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_company"].ToString(), item["job_location"].ToString());
                   job.Email = item["email"].ToString();
                   job.ActiveJobs = item["active_jobs"].ToString();
                   job.PostedDate = item["posted_date"].ToString();                  
                   postedJobs.Add(job);   
                   
               }
               ApplicationSession.Current.PostedJobs = postedJobs;
               List<Jobs> pendingJobs = new List<Jobs>();
               foreach (DataRow item in resultSet.Tables[1].Rows)
               {
                   Jobs job = new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_company"].ToString(), item["job_location"].ToString());
                   job.Email = item["email"].ToString();
                   job.ActiveJobs = item["active_jobs"].ToString();
                   job.PostedDate = item["posted_date"].ToString();                  
                   pendingJobs.Add(job);                   
                                      
               }
               ApplicationSession.Current.PendingJobs = pendingJobs;
               List<Jobs> appliedJobs = new List<Jobs>();
               foreach (DataRow item in resultSet.Tables[2].Rows)
               {
                   Jobs job = new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_company"].ToString(), item["job_location"].ToString());
                   job.Email = item["email"].ToString();
                   job.ActiveJobs = item["active_jobs"].ToString();
                   job.PostedEmail = item["posted_email"].ToString();
                   job.AppliedEmail = item["applied_email"].ToString();
                   job.PostedDate = item["posted_date"].ToString();
                   job.AppliedDate = item["applied_date"].ToString();                   
                   appliedJobs.Add(job);
                   
               }
               ApplicationSession.Current.AppliedJobs = appliedJobs;
               return true;
           }
           catch (Exception ex)
           {
               throw ex;
           }
       }

       public List<Jobs> getAllJobs()
       {

           MySqlParameter[] sqlParameters = new MySqlParameter[1];
           sqlParameters[0] = new MySqlParameter();         
           List<Jobs> jobs = new List<Jobs>();
           try
           {
               var resultSet = conn.executeSelectQuery(Constants.GETALLJOBS, sqlParameters);
               foreach (DataRow item in resultSet.Rows)
               {
                   Jobs job = new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_company"].ToString(), item["job_location"].ToString());
                   DateTime date = DateTime.ParseExact(item["posted_date"].ToString(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture);
                   job.PostedDate = date.ToString("d MMM");
                   job.JobType = item["active_jobs"].ToString();
                   jobs.Add(job);

               }
               ApplicationSession.Current.Jobs=jobs;
               return jobs;
           }
           catch (Exception ex)
           {
               throw ex;
           }
       }

        public DataTable getAllJobs1()
        {

            MySqlParameter[] sqlParameters = new MySqlParameter[1];
            sqlParameters[0] = new MySqlParameter();
            List<Jobs> jobs = new List<Jobs>();
            try
            {
                var resultSet = conn.executeSelectQuery(Constants.GETALLJOBS, sqlParameters);
                foreach (DataRow item in resultSet.Rows)
                {
                    Jobs job = new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_company"].ToString(), item["job_location"].ToString());
                    DateTime date = DateTime.ParseExact(item["posted_date"].ToString(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture);
                    job.PostedDate = date.Day + "/" + date.Month + "/" + date.Year;
                    job.JobType = item["active_jobs"].ToString();
                    jobs.Add(job);

                }
                ApplicationSession.Current.Jobs = jobs;
                return resultSet;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool GetAllPricing()
       {

           MySqlParameter[] sqlParameters = new MySqlParameter[1];
           sqlParameters[0] = new MySqlParameter();
           List<PricingPlan> pricing = new List<PricingPlan>();

           try
           {

               var resultSet = conn.executeSelectQuery(Constants.GETALLPRICING, sqlParameters);
               foreach (DataRow item in resultSet.Rows)
               {
                   //PricingPlan p = new PricingPlan(item[0].ToString(), item[1].ToString(), item[2].ToString(), item[3].ToString(), item[4].ToString(), item[5].ToString());
                   pricing.Add(new PricingPlan(item["plan_id"].ToString(), item["plan_name"].ToString(), item["plan_price"].ToString(), item["plan_desc"].ToString(), item["plan_duration"].ToString(), item["plan_jobs"].ToString()));
                   //pricing.Add(new PricingPlan(item[0].ToString(), item[1].ToString(), item[2].ToString(), item[3].ToString(), item[4].ToString(), item[5].ToString()));
                   //pricing.Add(p);
               }
               ApplicationSession.Current.Pricing = pricing;
               return true;
           }
           catch (Exception ex)
           {
               throw ex;
           }
       }
    }
}
