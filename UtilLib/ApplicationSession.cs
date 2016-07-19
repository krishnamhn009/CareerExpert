using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using POCOLib;

namespace UtilLib
{
     public class ApplicationSession
    {
        // **** add your session properties here, e.g like this:
         private List<Address> _cities;
         private List<Jobs> _jobs;
         private List<Jobs> _pendingJobs;
         private List<Jobs> _postedJobs;
         private List<Jobs> _appliedJobs;
         private List<User> _users;
         private List<PricingPlan> _userPlan;
         private User _user;
         private Dictionary<int, string> _qualifications;
         private Dictionary<int, string> _institutes;
         private Dictionary<int, string> _careers;
         private Dictionary<int, string> _marks;
         private Dictionary<int, string> _company;
         private Dictionary<int, string> _experience;
         private List<PricingPlan> _pricing;
         private Dictionary<int, string> _courses;
         private Dictionary<int, string> _states;
         private List<CollegeList> _clgList;      

        public string userId { get; set; }
        public string Email { get; set; }
        public string OfcEmail { get; set; }
        public string UserName { get; set; }
        public string UserType { get; set; }
        public string UserOTP { get; set; }
        public User user
        {
            get
            {
                if (_user != null)
                    return _user;
                else
                    return new User();
            }
            set
            {
                _user = value;
            }
        }
        public List<Address> Cities
        {
            get
            {
                if (_cities != null)
                    return _cities;
                else
                    return new List<Address>();
            }
            set
            {
                _cities = value;
            }
        }

        public List<Jobs> Jobs
        {
            get
            {
                if (_jobs != null)
                    return _jobs;
                else
                    return new List<Jobs>();
            }
            set
            {
                _jobs = value;
            }
        }

        public List<Jobs> PendingJobs
        {
            get
            {
                if (_pendingJobs != null)
                    return _pendingJobs;
                else
                    return new List<Jobs>();
            }
            set
            {
                _pendingJobs = value;
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

        public List<PricingPlan> UserPlan
        {
            get
            {
                if (_userPlan != null)
                    return _userPlan;
                else
                    return new List<PricingPlan>();
            }
            set
            {
                _userPlan = value;
            }
        }

        public List<User> Users
        {
            get
            {
                if (_users != null)
                    return _users;
                else
                    return new List<User>();
            }
            set
            {
                _users = value;
            }
        }

        public Dictionary <int,string> Qualifications
        {
            get
            {
                if (_qualifications != null)
                    return _qualifications;
                else
                    return new Dictionary <int,string>();
            }
            set
            {
                _qualifications = value;
            }
        }

        public Dictionary<int, string> Institutes
        {
            get
            {
                if (_institutes != null)
                    return _institutes;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _institutes = value;
            }
        }

        public Dictionary<int, string> Careers
        {
            get
            {
                if (_careers != null)
                    return _careers;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _careers = value;
            }
        }

        public Dictionary<int, string> Marks
        {
            get
            {
                if (_marks != null)
                    return _marks;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _marks = value;
            }
        }

        public Dictionary<int, string> Companies
        {
            get
            {
                if (_company != null)
                    return _company;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _company = value;
            }
        }

        public Dictionary<int, string> Experience
        {
            get
            {
                if (_experience != null)
                    return _experience;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _experience = value;
            }
        }

        public List<PricingPlan> Pricing
        {
            get
            {
                if (_pricing != null)
                    return _pricing;
                else
                    return new List<PricingPlan>();
            }
            set
            {
                _pricing = value;
            }
        }

        public Dictionary<int, string> Courses
        {
            get
            {
                if (_courses != null)
                    return _courses;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _courses = value;
            }
        }

        public Dictionary<int, string> States
        {
            get
            {
                if (_states != null)
                    return _states;
                else
                    return new Dictionary<int, string>();
            }
            set
            {
                _states = value;
            }
        }

        public List<CollegeList> CollegeList
        {
            get
            {
                if (_clgList != null)
                    return _clgList;
                else
                    return new List<CollegeList>();
            }
            set
            {
                _clgList = value;
            }
        }
      
        // private constructor
        private ApplicationSession()
        {           
        }

        // Gets the current session.
        public static ApplicationSession Current
        {
            get
            {
                ApplicationSession session = (ApplicationSession)HttpContext.Current.Session["__MySession__"];
                if (session == null)
                {
                    session = new ApplicationSession();
                    HttpContext.Current.Session["__MySession__"] = session;
                }
                return session;
            }
        }

        


    }
}
