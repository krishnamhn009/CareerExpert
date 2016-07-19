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


namespace DAOLib
{
    public class UserDAO
    {
        private MySqlConnect conn;


       public  UserDAO()
        {
            conn = new MySqlConnect();
        }

       public bool InsertUserQuery(User user, string userMessage, string adminMessage, string mailSubject)
       {
           //Change Proc
           string query = Constants.ADDUSERQUERY;
            MySqlParameter[] sqlParameters = new MySqlParameter[11];
            sqlParameters[0] = new MySqlParameter("@p_user_type", MySqlDbType.VarChar);
            sqlParameters[0].Value = Convert.ToString(user.UserType);
            sqlParameters[1] = new MySqlParameter("@p_name", MySqlDbType.VarChar);
            sqlParameters[1].Value = Convert.ToString(user.Name);
            sqlParameters[2] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
            sqlParameters[2].Value = Convert.ToString(user.Email);
            sqlParameters[3] = new MySqlParameter("@p_mobile", MySqlDbType.VarChar);
            sqlParameters[3].Value = Convert.ToString(user.Mobile);
            sqlParameters[4] = new MySqlParameter("@p_city", MySqlDbType.VarChar);
            sqlParameters[4].Value = Convert.ToString(user.Add.City);           
            sqlParameters[5] = new MySqlParameter("@p_qualification", MySqlDbType.VarChar);
            sqlParameters[5].Value = Convert.ToString(user.Qualification);
            sqlParameters[6] = new MySqlParameter("@p_query", MySqlDbType.VarChar);
            sqlParameters[6].Value = Convert.ToString(user.Query);
            sqlParameters[7] = new MySqlParameter("@p_career_field", MySqlDbType.VarChar);
            sqlParameters[7].Value = Convert.ToString(user.CareerField);
            sqlParameters[8] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
            sqlParameters[8].Value = Convert.ToString(userMessage);
            sqlParameters[9] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
            sqlParameters[9].Value = Convert.ToString(adminMessage);
            sqlParameters[10] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
            sqlParameters[10].Value = Convert.ToString(mailSubject);
            return conn.executeInsertQuery(query, sqlParameters);
          
       }

      public bool InsertUser(User user)
      {
          string query = Constants.ADDUSER;
          MySqlParameter[] sqlParameters = new MySqlParameter[8];
          sqlParameters[0] = new MySqlParameter("@p_user_type", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(user.UserType);
          sqlParameters[1] = new MySqlParameter("@p_name", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(user.Name);
          sqlParameters[2] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(user.Email);
          sqlParameters[3] = new MySqlParameter("@p_mobile", MySqlDbType.VarChar);
          sqlParameters[3].Value = Convert.ToString(user.Mobile);
          sqlParameters[4] = new MySqlParameter("@p_city", MySqlDbType.VarChar);
          sqlParameters[4].Value = Convert.ToString(user.Add.City);
          //sqlParameters[5] = new MySqlParameter("@p_state", MySqlDbType.VarChar);
          //sqlParameters[5].Value = Convert.ToString(user.Add.State);
          sqlParameters[5] = new MySqlParameter("@p_qualification", MySqlDbType.VarChar);
          sqlParameters[5].Value = Convert.ToString(user.Qualification);
          sqlParameters[6] = new MySqlParameter("@p_query", MySqlDbType.VarChar);
          sqlParameters[6].Value = Convert.ToString(user.Query);
          sqlParameters[7] = new MySqlParameter("@p_career_field", MySqlDbType.VarChar);
          sqlParameters[7].Value = Convert.ToString(user.CareerField);
          return conn.executeInsertQuery(query, sqlParameters);

      }

      public bool InsertUserRegistration(User user, string userMessage, string adminMessage, string mailSubject)
      {
          //Change Proc
          string query = Constants.ADDUSERREGISTRATION;
          MySqlParameter[] sqlParameters = new MySqlParameter[19];
          sqlParameters[0] = new MySqlParameter("@p_name", MySqlDbType.VarChar);
          if (user.Name != null)
              sqlParameters[0].Value = Convert.ToString(user.Name);
          else
              sqlParameters[0].Value = string.Empty;
          sqlParameters[1] = new MySqlParameter("@p_user_id", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(user.UserId);
          sqlParameters[2] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(user.Email);
          sqlParameters[3] = new MySqlParameter("@p_mobile", MySqlDbType.VarChar);
          if (user.Mobile!=null)
          sqlParameters[3].Value = Convert.ToString(user.Mobile);
          else
              sqlParameters[3].Value = "XXXXX";
          sqlParameters[4] = new MySqlParameter("@p_pwd", MySqlDbType.VarChar);
          if (user.Password != null)
          sqlParameters[4].Value = Convert.ToString(user.Password);
          else
              sqlParameters[4].Value = string.Empty;

          sqlParameters[5] = new MySqlParameter("@p_level", MySqlDbType.VarChar);
          if (user.Qualification != null)
              sqlParameters[5].Value = Convert.ToString(user.Qualification);
          else
              sqlParameters[5].Value = string.Empty;
          sqlParameters[6] = new MySqlParameter("@p_institute", MySqlDbType.VarChar);
          if (user.Institute!=null)
          sqlParameters[6].Value = Convert.ToString(user.Institute);
          else
              sqlParameters[6].Value = string.Empty ;        
          sqlParameters[7] = new MySqlParameter("@p_marks", MySqlDbType.VarChar);
          if (user.Marks != null)
          sqlParameters[7].Value = Convert.ToString(user.Marks);
          else
              sqlParameters[7].Value = string.Empty; 
          sqlParameters[8] = new MySqlParameter("@p_city", MySqlDbType.VarChar);
          if (user.Add.City!=null)
          sqlParameters[8].Value = Convert.ToString(user.Add.City);
          else
              sqlParameters[8].Value = string.Empty;
          sqlParameters[9] = new MySqlParameter("@p_company", MySqlDbType.VarChar);
          if (user.Company!=null)
          sqlParameters[9].Value = Convert.ToString(user.Company);
          else
              sqlParameters[9].Value = string.Empty;
          sqlParameters[10] = new MySqlParameter("@p_experience", MySqlDbType.VarChar);
          if (user.Experience!=null)
          sqlParameters[10].Value = Convert.ToString(user.Experience);
          else
              sqlParameters[10].Value =string.Empty;
          sqlParameters[11] = new MySqlParameter("@p_location", MySqlDbType.VarChar);
          if (user.Add.Location != null)
              sqlParameters[11].Value = Convert.ToString(user.Add.Location);
          else
              sqlParameters[11].Value = string.Empty;
          sqlParameters[12] = new MySqlParameter("@p_comments", MySqlDbType.VarChar);
          if (user.Query!=null)
          sqlParameters[12].Value = Convert.ToString(user.Query);
          else
              sqlParameters[12].Value = string.Empty;
          sqlParameters[13] = new MySqlParameter("@p_user_type", MySqlDbType.VarChar);
          sqlParameters[13].Value = Convert.ToString(user.UserType);
          sqlParameters[14] = new MySqlParameter("@p_resume", MySqlDbType.VarChar);
          sqlParameters[14].Value = Convert.ToString(user.ResumeSubmitted);
          sqlParameters[15] = new MySqlParameter("@p_resume_path", MySqlDbType.VarChar);
          sqlParameters[15].Value = Convert.ToString(user.ResumePath);
          sqlParameters[16] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
          sqlParameters[16].Value = Convert.ToString(userMessage);
          sqlParameters[17] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
          sqlParameters[17].Value = Convert.ToString(adminMessage);
          sqlParameters[18] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
          sqlParameters[18].Value = Convert.ToString(mailSubject);
          return conn.executeInsertQuery(query, sqlParameters);
         

      }

      public bool LoginLinkedIn(string email, string name, string location, string company, string exp)
      {
          string query = Constants.CHECKLINKEDINUSER;
          MySqlParameter[] sqlParameters = new MySqlParameter[6];
          sqlParameters[0] = new MySqlParameter("@p_name", MySqlDbType.VarChar);
          if (name != null)
              sqlParameters[0].Value = Convert.ToString(name);
          else
              sqlParameters[0].Value = string.Empty;
          sqlParameters[1] = new MySqlParameter("@p_user_id", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(email);
          sqlParameters[2] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(email);
          sqlParameters[3] = new MySqlParameter("@p_location", MySqlDbType.VarChar);
          if (location != null)
              sqlParameters[3].Value = Convert.ToString(location);
          else
              sqlParameters[3].Value = string.Empty;
          sqlParameters[4] = new MySqlParameter("@p_company", MySqlDbType.VarChar);
          if (company != null)
              sqlParameters[4].Value = Convert.ToString(company);
          else
              sqlParameters[4].Value = string.Empty;
          sqlParameters[5] = new MySqlParameter("@p_experience", MySqlDbType.VarChar);
          if (exp != null)
              sqlParameters[5].Value = Convert.ToString(exp);
          else
              sqlParameters[5].Value = string.Empty;          
          return conn.executeInsertQuery(query, sqlParameters);
      }


      public bool getAllCities()
      {
         
          MySqlParameter[] sqlParameters = new MySqlParameter[1];
          sqlParameters[0] = new MySqlParameter();
          //List<MySqlParameter> parameters = new List<MySqlParameter>();
          List<Address> cities = new List<Address>();
          Dictionary<int, string> institute = new Dictionary<int, string>();
          Dictionary<int, string> qualification = new Dictionary<int, string>();
          Dictionary<int, string> career = new Dictionary<int, string>();
          Dictionary<int, string> marks = new Dictionary<int, string>();
          Dictionary<int, string> company = new Dictionary<int, string>();
          Dictionary<int, string> experience = new Dictionary<int, string>();
          try
          {


              var resultSet = conn.executeSelectMultipleQuery(Constants.GETALLCITIES, sqlParameters);
              foreach (DataRow item in resultSet.Tables[0].Rows)
              {
                  cities.Add(new Address(item["city_id"].ToString(), item["city_name"].ToString(), item["city_state"].ToString()));
                  ApplicationSession.Current.Cities = cities;
              }
              foreach (DataRow item in resultSet.Tables[1].Rows)
              {                 
                  qualification.Add(Convert.ToInt32(item["qual_id"]), item["qualification"].ToString());
                  ApplicationSession.Current.Qualifications  = qualification;
              }
              foreach (DataRow item in resultSet.Tables[2].Rows)
              {                  
                  institute.Add(Convert.ToInt32(item["institute_id"]), item["institute"].ToString());
                  ApplicationSession.Current.Institutes  = institute;
              }
              foreach (DataRow item in resultSet.Tables[3].Rows)
              {
                  career.Add(Convert.ToInt32(item["function_id"]), item["function_name"].ToString());
                  ApplicationSession.Current.Careers = career;
              }
              foreach (DataRow item in resultSet.Tables[4].Rows)
              {
                  marks.Add(Convert.ToInt32(item["marks_id"]), item["marks_desc"].ToString());
                  ApplicationSession.Current.Marks = marks;
              }
              foreach (DataRow item in resultSet.Tables[5].Rows)
              {
                  company.Add(Convert.ToInt32(item["company_id"]), item["company_name"].ToString());
                  ApplicationSession.Current.Companies = company;
              }
              foreach (DataRow item in resultSet.Tables[6].Rows)
              {
                  experience.Add(Convert.ToInt32(item["experience_id"]), item["experience_level"].ToString());
                  ApplicationSession.Current.Experience = experience;
              }

              return true;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }

      public List<User> getAllUsers()
      {

          MySqlParameter[] sqlParameters = new MySqlParameter[1];
          sqlParameters[0] = new MySqlParameter();
          //List<MySqlParameter> parameters = new List<MySqlParameter>();
          List<User> users = new List<User>();
          try
          {


              var resultSet = conn.executeSelectQuery(Constants.GETALLUSERS, sqlParameters);
              foreach (DataRow item in resultSet.Rows)
              {

                  users.Add(new User(item["name"].ToString(), item["email"].ToString(), item["user_type"].ToString(), item["mobile"].ToString(), item["qualification"].ToString(),
                      item["institute"].ToString(), item["company"].ToString(), item["Experience"].ToString(), item["city"].ToString(), item["submission_date"].ToString()));
              }
              ApplicationSession.Current.Users = users;
              return users;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }

      public MySqlDataAdapter getAllQuestion()
      {          
          //MySqlParameter[] sqlParameters = new MySqlParameter[1];
          //sqlParameters[0] = new MySqlParameter();
          //List<MySqlParameter> parameters = new List<MySqlParameter>();
          //MySqlDataAdapter questions = new MySqlDataAdapter();
          try
          {
              MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
             MySqlCommand cmd = new MySqlCommand("SELECT question_desc,answer1_desc,answer2_desc ,answer3_desc ,answer4_desc ,correct_ans_id FROM question_ans_tb;", conn);
              //MySqlCommand cmd = new MySqlCommand("SELECT * FROM question_ans_tb;", conn);
              conn.Open();
              DataTable dataTable = new DataTable();
              MySqlDataAdapter da = new MySqlDataAdapter(cmd);

              //var resultSet = conn.executeSelectQuery(Constants.GETALLQUESTIONS, sqlParameters);
              
              return da;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }

      public bool ValidateUser(User user)
      {
          string query = Constants.VALIDATEUSER;
          MySqlParameter[] sqlParameters = new MySqlParameter[2];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(user.Email);
          sqlParameters[1] = new MySqlParameter("@p_pswd", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(user.Password);
          DataTable dt= conn.executeSelectQuery(query, sqlParameters);
          if (dt.Rows.Count > 0)
          {
              
              string userName=dt.Rows[0]["name"].ToString();
              string email = dt.Rows[0]["email"].ToString();
              string pass = dt.Rows[0]["pass"].ToString();
              string userType = dt.Rows[0]["userType"].ToString();
              
             
              if (email.Equals(user.Email) && pass.Equals(user.Password))
              {
                  ApplicationSession.Current.user = new User();
                  ApplicationSession.Current.user.Name = userName;
                  ApplicationSession.Current.user.Email = email;
                  ApplicationSession.Current.user.UserType = userType;
                  //if (!dt.Rows[0].IsNull("ofcmail"))
                  //      ApplicationSession.Current.OfcEmail= dt.Rows[0]["ofcmail"].ToString();
                  return true;
              }
              else
                  return false;

          }
          else
              return false;
      }

      public bool ResetPass(User user, string userMessage, string adminMessage, string mailSubject)
      {
          //Change Proc
          string query = Constants.RESETPASS;
          MySqlParameter[] sqlParameters = new MySqlParameter[4];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(user.Email);
          sqlParameters[1] = new MySqlParameter("@p_user_message", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(userMessage);
          sqlParameters[2] = new MySqlParameter("@p_admin_message", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(adminMessage);
          sqlParameters[3] = new MySqlParameter("@p_mail_subject", MySqlDbType.VarChar);
          sqlParameters[3].Value = Convert.ToString(mailSubject);
          DataTable dt = conn.executeSelectQuery(query, sqlParameters);
          if (dt.Rows.Count > 0)
          {             
              string pass = dt.Rows[0]["password"].ToString();
              string name = dt.Rows[0]["name"].ToString();


              if (!string.IsNullOrEmpty(pass))
              {
                  User tempUser = new User();
                  tempUser.Password = pass;
                  tempUser.Name = name;
                  ApplicationSession.Current.user = tempUser;
                  return true;
              }
              else
                  return false;

          }
          else
              return false;
      }

      public bool ChangePass(User user)
      {
          string query = Constants.CHANGEPASS;
          MySqlParameter[] sqlParameters = new MySqlParameter[2];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(user.Email);
          sqlParameters[1] = new MySqlParameter("@p_pass", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(user.Password);
         return conn.executeUpdateQuery(query, sqlParameters);          
      }  

      public bool UpdateUser(User user)
      {
          string query = Constants.UPDATEUSER;         
          MySqlParameter[] sqlParameters = new MySqlParameter[9];
          sqlParameters[0] = new MySqlParameter("@p_name", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(user.Name);
          sqlParameters[1] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(user.Email);
          sqlParameters[2] = new MySqlParameter("@p_userType", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(user.UserType);
          sqlParameters[3] = new MySqlParameter("@p_phone", MySqlDbType.VarChar);
          sqlParameters[3].Value = Convert.ToString(user.Mobile);
          sqlParameters[4] = new MySqlParameter("@p_qualification", MySqlDbType.VarChar);
          sqlParameters[4].Value = Convert.ToString(user.Qualification);
          sqlParameters[5] = new MySqlParameter("@p_institute", MySqlDbType.VarChar);
          sqlParameters[5].Value = Convert.ToString(user.Institute);

           sqlParameters[6] = new MySqlParameter("@p_company", MySqlDbType.VarChar);
          sqlParameters[6].Value = Convert.ToString(user.Company);
           sqlParameters[7] = new MySqlParameter("@p_exp", MySqlDbType.VarChar);
          sqlParameters[7].Value = Convert.ToString(user.Experience);
          sqlParameters[8] = new MySqlParameter("@p_city", MySqlDbType.VarChar);
          sqlParameters[8].Value = Convert.ToString(user.Add.City);
          return conn.executeUpdateQuery(query, sqlParameters);
      }

      public bool ValidateOfficeMail(string OfcMail,string OTP)
      {
          string query = Constants.VALIDATEEMPUSER;
          MySqlParameter[] sqlParameters = new MySqlParameter[3];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(ApplicationSession.Current.Email);
          sqlParameters[1] = new MySqlParameter("@p_ofc_email", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(OfcMail);
          sqlParameters[2] = new MySqlParameter("@p_OTP", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(OTP); 
          return conn.executeInsertQuery(query, sqlParameters);
          
      }

      //public bool GetUserDatail(string email)
      //{
      //    string query = Constants.GetProfileDetail;
      //    MySqlParameter[] sqlParameters = new MySqlParameter[1];
      //    sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
      //    sqlParameters[0].Value = Convert.ToString(email);
      //    var resultSet = conn.executeSelectQuery(query, sqlParameters);
      //    if (resultSet.Rows.Count > 0)
      //    {
      //        string userName = resultSet.Rows[0]["name"].ToString();
      //        string mail = resultSet.Rows[0]["email"].ToString();
      //        string pass = resultSet.Rows[0]["pass"].ToString();
      //        string mobileno = resultSet.Rows[0]["mobile_no"].ToString();
      //        string qualification = resultSet.Rows[0]["qualification"].ToString();              
      //        string institute = resultSet.Rows[0]["institute"].ToString();
      //        string marks = resultSet.Rows[0]["marks"].ToString();
      //        string city = resultSet.Rows[0]["city"].ToString();
      //        string company = resultSet.Rows[0]["company"].ToString();
      //        string experience = resultSet.Rows[0]["experience"].ToString();
      //        string comments = resultSet.Rows[0]["comments"].ToString();
      //        string user_type = resultSet.Rows[0]["user_type"].ToString();
      //        User user = new User(userName, mail, mail, mobileno, pass, qualification, institute, marks, city, company, experience, comments, user_type);
      //        ApplicationSession.Current.user = new User(user);
      //        return true;
      //    }
      //    else
      //        return false;
      //}

      public bool GetUserDatail(string email)
      {
          string query = Constants.GetProfileDetail;
          MySqlParameter[] sqlParameters = new MySqlParameter[1];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(email);
          List<Jobs> appliedJobs = new List<Jobs>();
          List<Jobs> postedJobs = new List<Jobs>();
          var resultSet = conn.executeSelectMultipleQuery(query, sqlParameters);
          if (resultSet.Tables.Count > 0)
          {
              if (resultSet.Tables[0].Rows.Count > 0)
              {
                  var userDetails = resultSet.Tables[0];
                  string userName = userDetails.Rows[0]["name"].ToString();
                  string mail = userDetails.Rows[0]["email"].ToString();                  
                  string mobileno = userDetails.Rows[0]["mobile_no"].ToString();
                  string qualification = userDetails.Rows[0]["qualification"].ToString();
                  string institute = userDetails.Rows[0]["institute"].ToString();
                  string marks = userDetails.Rows[0]["marks"].ToString();
                  string city = userDetails.Rows[0]["city"].ToString();
                  string company = userDetails.Rows[0]["company"].ToString();
                  string experience = userDetails.Rows[0]["experience"].ToString();
                  string comments = userDetails.Rows[0]["comments"].ToString();
                  string user_type = userDetails.Rows[0]["user_type"].ToString();
                  string progressbar = userDetails.Rows[0]["progress_bar"].ToString();
                  string resumepath = userDetails.Rows[0]["resume_path"].ToString();
                  string location = userDetails.Rows[0]["location"].ToString();
                  string resumeSubmitted = userDetails.Rows[0]["resume_submitted"].ToString();
                  User user = new User(userName, mail, mail, mobileno, qualification, institute, marks, city, company, experience, comments, user_type);
                  ApplicationSession.Current.user = user;
                    ApplicationSession.Current.UserType = user_type;
                  ApplicationSession.Current.user.ProgressBar = progressbar;
                  ApplicationSession.Current.user.ResumePath = resumepath;
                  ApplicationSession.Current.user.Add.Location = location;
                  ApplicationSession.Current.user.ResumeSubmitted = resumeSubmitted;               
              }
              if (resultSet.Tables[1].Rows.Count > 0)
              {
                  foreach (DataRow item in resultSet.Tables[1].Rows)
                  {
                      appliedJobs.Add(new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_location"].ToString(), item["job_company"].ToString()));
                  }
                  ApplicationSession.Current.user.AppliedJobs = appliedJobs;                 
              }
              if (resultSet.Tables[2].Rows.Count > 0)
              {
                  foreach (DataRow item in resultSet.Tables[2].Rows)
                  {
                      postedJobs.Add(new Jobs(item["job_id"].ToString(), item["job_title"].ToString(), item["job_desc"].ToString(), item["job_experience"].ToString(), item["job_location"].ToString(), item["job_company"].ToString()));
                  }
                  ApplicationSession.Current.user.PostedJobs = postedJobs;
              }
              if (resultSet.Tables[3].Rows.Count > 0)
              {
                  var userPlanDetails = resultSet.Tables[3];
                  string planId = userPlanDetails.Rows[0]["plan_Id"].ToString();
                  string planName = userPlanDetails.Rows[0]["plan_name"].ToString();
                  string planExpireDate = userPlanDetails.Rows[0]["plan_expire_date"].ToString();
                  Int32 referralsLeft = Convert.ToInt32(userPlanDetails.Rows[0]["referrals_left"]);
                  string jobsAppliedCount = userPlanDetails.Rows[0]["jobs_applied_count"].ToString();
                  ApplicationSession.Current.user.UserPricingPlan.PlanId = planId;
                  ApplicationSession.Current.user.UserPricingPlan.PlanName = planName;
                  ApplicationSession.Current.user.UserPricingPlan.PlanExpireDate = planExpireDate;
                  ApplicationSession.Current.user.UserPricingPlan.ReferralsLeft = referralsLeft;
                  ApplicationSession.Current.user.UserPricingPlan.JobsAppliedCount = jobsAppliedCount;
              }
              return true;
          }
          else
              return false;
      }

      public bool ApplyUserPlan(string email, string planId, string responseColName, string responseColValue)
      {
          string query = Constants.USERAPPLYPLAN;
          MySqlParameter[] sqlParameters = new MySqlParameter[4];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(email);
          sqlParameters[1] = new MySqlParameter("@p_plan_id", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(planId);
            sqlParameters[2] = new MySqlParameter("@p_response_colName", MySqlDbType.VarChar);
            sqlParameters[2].Value = Convert.ToString(responseColName);
            sqlParameters[3] = new MySqlParameter("@p_response_colValue", MySqlDbType.VarChar);
            sqlParameters[3].Value = Convert.ToString(responseColValue);
            return conn.executeUpdateQuery(query, sqlParameters);
      }

      public bool InsertFeedback(string email, string department, string feedback)
      {
          string query = Constants.USERFEEDBACK;
          MySqlParameter[] sqlParameters = new MySqlParameter[3];
          sqlParameters[0] = new MySqlParameter("@p_email", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(email);
          sqlParameters[1] = new MySqlParameter("@p_department", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(department);
          sqlParameters[2] = new MySqlParameter("@p_feedback", MySqlDbType.VarChar);
          sqlParameters[2].Value = Convert.ToString(feedback);
          return conn.executeUpdateQuery(query, sqlParameters);
      }

     
      //public bool GetAllPricing()
      //{

      //    MySqlParameter[] sqlParameters = new MySqlParameter[1];
      //    sqlParameters[0] = new MySqlParameter();          
      //    List<PricingPlan> pricing = new List<PricingPlan>();
          
      //    try
      //    {
              
      //        var resultSet = conn.executeSelectQuery(Constants.GETALLPRICING, sqlParameters);
      //        foreach (DataRow item in resultSet.Rows)
      //        {
      //            //PricingPlan p = new PricingPlan(item[0].ToString(), item[1].ToString(), item[2].ToString(), item[3].ToString(), item[4].ToString(), item[5].ToString());
      //            pricing.Add(new PricingPlan(item["plan_id"].ToString(), item["plan_name"].ToString(), item["plan_price"].ToString(), item["plan_desc"].ToString(), item["plan_duration"].ToString(), item["plan_jobs"].ToString()));
      //            //pricing.Add(new PricingPlan(item[0].ToString(), item[1].ToString(), item[2].ToString(), item[3].ToString(), item[4].ToString(), item[5].ToString()));
      //            //pricing.Add(p);
      //        }
      //        ApplicationSession.Current.Pricing = pricing;
      //        return true;
      //    }
      //    catch (Exception ex)
      //    {
      //        throw ex;
      //    }
      //}

      public bool getAllClgSearch()
      {

          MySqlParameter[] sqlParameters = new MySqlParameter[1];
          sqlParameters[0] = new MySqlParameter();
          //List<MySqlParameter> parameters = new List<MySqlParameter>();

          Dictionary<int, string> courses = new Dictionary<int, string>();
          Dictionary<int, string> states = new Dictionary<int, string>();
          try
          {
              var resultSet = conn.executeSelectMultipleQuery(Constants.GETALLCLGSEARCH, sqlParameters);
              foreach (DataRow item in resultSet.Tables[0].Rows)
              {
                  courses.Add(Convert.ToInt32(item["id"]), item["course_name"].ToString());
                  ApplicationSession.Current.Courses = courses;
              }
              foreach (DataRow item in resultSet.Tables[1].Rows)
              {
                  states.Add(Convert.ToInt32(item["id"]), item["state"].ToString());
                  ApplicationSession.Current.States = states;
              }
              List<CollegeList> clgList = new List<CollegeList>();
              foreach (DataRow item in resultSet.Tables[2].Rows)
              {
                  CollegeList clgs = new CollegeList(item["clg_name"].ToString(), item["state"].ToString(), item["course_name"].ToString());
                  clgs.ClgName = item["clg_name"].ToString();
                  clgs.State = item["state"].ToString();
                  clgs.CourseName = item["course_name"].ToString();
                  clgList.Add(clgs);

              }
              ApplicationSession.Current.CollegeList = clgList;

              return true;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }

      public bool getClgSearch(string courseName, string state)
      {

          MySqlParameter[] sqlParameters = new MySqlParameter[2];
          sqlParameters[0] = new MySqlParameter("@p_course_name", MySqlDbType.VarChar);
          sqlParameters[0].Value = Convert.ToString(courseName);
          sqlParameters[1] = new MySqlParameter("@p_state", MySqlDbType.VarChar);
          sqlParameters[1].Value = Convert.ToString(state);
          try
          {
              var resultSet = conn.executeSelectMultipleQuery(Constants.GETCLGSEARCH, sqlParameters);       
              List<CollegeList> clgList = new List<CollegeList>();
              foreach (DataRow item in resultSet.Tables[0].Rows)
              {
                  CollegeList clgs = new CollegeList(item["clg_name"].ToString(), item["state"].ToString(), item["course_name"].ToString());
                  clgs.ClgName = item["clg_name"].ToString();
                  clgs.State = item["state"].ToString();
                  clgs.CourseName = item["course_name"].ToString();
                  clgList.Add(clgs);

              }
              ApplicationSession.Current.CollegeList = clgList;

              return true;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
    }
}
