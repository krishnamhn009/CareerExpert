using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;

namespace POCOLib
{
    /// <summary>
    ///
    /// </summary>
    public class User
    {
             

        private List<Jobs> _appliedJobs;
        private List<Jobs> _postedJobs;
        //private HttpPostedFile _userResume;
        public User()
        {
            this.Add = new Address();
            this.UserPricingPlan = new PricingPlan();
            
        }
        public User(User user)
        {
            this.Name = user.Name;
            this.Email = user.Email;
            this.Mobile = user.Mobile;
            this.Password = user.Password;
            this.Qualification = user.Qualification;
            this.Add = new Address();
            this.UserPricingPlan = new PricingPlan();
            this.Add.City = user.Add.City;
            this.Company = user.Company;
            this.Experience = user.Experience;
            this.Institute = user.Institute;
            this.Marks = user.Marks;
            this.Query = user.Query;
            this.UserType = user.UserType;
            this.ProgressBar = user.ProgressBar;
        }
        public User(string name,string email,string userType,string phone,string qualification,string institute,string company,string exp,string city,string regDate)
        {
            this.Name = name;
            this.Email = email;
            this.UserType = userType;
            this.Mobile = phone;
            this.Qualification = qualification;
            this.Institute = institute;
            this.Company = company;
            this.Experience = exp;
            this.Add = new Address();
            this.UserPricingPlan = new PricingPlan();
            this.Add.City = city;
            this.RegisterDate = regDate;
        }

        public User(string uid,string pwd)
        {
            this.Email = uid;
            this.Password = pwd;
        }
        public User(string name, string phNo, string email, string query, string city, string level, string careerField,string userType)
        {
            this.Name = name;
            this.Email = email;
            this.Mobile = phNo;
            this.Query = query;
            this.Qualification = level;
            this.Add = new Address();
            this.UserPricingPlan = new PricingPlan();
            this.Add.City = city;
            this.CareerField = careerField;
            this.UserType = userType;            
        }
               
        public User(string name, string userId, string email, string phNo, string level, string institute, string marks, string city,string company,string experience,string comments,string usertype)
        {
            this.Name = name;
            this.UserId = userId;
            this.Email = email;
            this.Mobile = phNo;                       
            this.Qualification = level;
            this.Institute = institute;
            this.Marks = marks;
            this.Add = new Address();
            this.UserPricingPlan = new PricingPlan();
            this.Add.City = city;
            this.Company = company;
            this.Experience = experience;
            this.Query = comments;
            this.UserType = usertype;
            
        }

        /// <summary>
        /// Auto Implemented Properties
        /// </summary>
        /// 
        public HttpPostedFile UserResume
        {
            set; get;
        }
        public string ProgressBar
        { set; get; }
        public string ResumeSubmitted
        { set; get; }
        public string ResumePath
        { set; get; }
        public Address City
        { set; get; }
        public string RegisterDate
        { set; get; }
        public string OfficeMail
        { set; get; }
        public string Name
        {
            get;

            set;
        }
        public string UserId
        {
            get;

            set;
        }
        public string Email
        {
            get;

            set;
        }
        public string Qualification
        {
            get;
            set;
        }
        public string Institute
        {
            get;
            set;
        }
        public string Marks
        {
            get;
            set;
        }
        public string Company
        {
            get;

            set; 
        }
        public string Experience
        {
            get;

            set;
        }
        public string Mobile
        {
            get;

            set;
        }
        public Address Add
        {
            get;
            set;
        }
        public PricingPlan UserPricingPlan
        {
            get;
            set;
        }
        public string Query
        {
            get;

            set;
        }
        public string UserType
        {
            get;

            set;
        }
        public string CareerField
        {
            get;

            set; 
        }
        public string Password
        {
            get;

            set;
        }

        public List<Jobs> AppliedJobs
        {
            get
            {
                if (_appliedJobs != null)
                    return _appliedJobs;
                else
                    return new List<Jobs>();
            }
            set
            {
                _appliedJobs = value;
            }
        }

        public List<Jobs> PostedJobs
        {
            get
            {
                if (_postedJobs != null)
                    return _postedJobs;
                else
                    return new List<Jobs>();
            }
            set
            {
                _postedJobs = value;
            }
        }
    /// <summary>
    /// Overriden Method for represent State of Object
    /// </summary>
    /// <returns></returns>
        public override string ToString()
        {
            return string.Format("Name:{0}\n Mobile:{1}\n Email:{2} \n Qualification :{3}\n Query :{4}\n City:{5}\n UserType:{6}\n Pass:",this.Name,this.Mobile,this.Email,this.Qualification,this.Query,this.Query,this.Add.City,this.UserType,this.Password);
        }

    }
}
