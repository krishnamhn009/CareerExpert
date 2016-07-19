using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAOLib;
using POCOLib;
using UtilLib;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Web.Services;
using System.Web.Script.Services;

namespace BALLib
{
    public class UserBAL
    {
        //private AppSessions _session;

        private UserDAO _userDAO;
        private UserDAO UserDO
        {
            get
            {
                if (_userDAO == null)
                    _userDAO = new UserDAO();
                return _userDAO;
            }
        }
        public UserBAL()
        {
            _userDAO = new UserDAO();            
        }

        public bool AddUserQury(User user, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = UserDO.InsertUserQuery(user, userMessage, adminMessage, mailSubject);
            return result;
        }

        public bool UserQury(User user)
        {
            bool result = UserDO.InsertUser(user);
            return result;
        }

        public bool UserRegistration(User user, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = UserDO.InsertUserRegistration(user, userMessage, adminMessage, mailSubject);
            return result;
        }

        public bool UpdateUser(User user)
        {
            bool result = UserDO.UpdateUser(user);
            return result;
        }

        public bool getAllCities()
        {
            return UserDO.getAllCities();
        }

        public List<User> getAllUsers()
        {
            return UserDO.getAllUsers();
        }

        public MySqlDataAdapter getAllQuestions()
        {
            return UserDO.getAllQuestion();
        }
        public bool ValidateUser(User user)
        {
            bool result = UserDO.ValidateUser(user);
            return result;
        }

        public bool ResetPass(User user, string userMessage, string adminMessage, string mailSubject)
        {
            bool result = UserDO.ResetPass(user, userMessage, adminMessage, mailSubject);
            return result;
        }
        public bool ChangePass(User user)
        {
            bool result = UserDO.ChangePass(user);
            return result;
        }
        public bool ValidateOfficeMail(string OfcMail)
        {
            string OTP = Generic.GetUniqueKey(4);
            if (UserDO.ValidateOfficeMail(OfcMail, OTP))
            {
                ApplicationSession.Current.UserOTP = OTP;
                return true;
            }
            else
                return false;
        }


        public static bool RegisterUser(User socialUser, string userMessage, string adminMessage, string mailSubject)
        {
            UserDAO u = new UserDAO();
            return u.InsertUserRegistration(socialUser, userMessage, adminMessage, mailSubject);
        }

        public static bool LoginLinkedInUser(string email, string name, string location, string company, string exp)
        {
            UserDAO u = new UserDAO();
            return u.LoginLinkedIn(email, name, location, company, exp);
        }

        public bool GetUserDatail(string email)
        {           
            return UserDO.GetUserDatail(email);
        }

        public static bool GetUserDetail(string email)
        {
            UserDAO u = new UserDAO();
            return u.GetUserDatail(email);
        }

        public bool ApplyUserPlan(string user, string planId, string responseColName, string responseColValue)
        {
            UserDAO u = new UserDAO();
            return u.ApplyUserPlan(user, planId, responseColName, responseColValue);
            
        }

        public bool InsertFeedback(string email,string department,string feedback)
        {
            bool result = UserDO.InsertFeedback(email,department,feedback);
            return result;
        }

        //public bool GetAllPricing()
        //{          
        //    return UserDO.GetAllPricing();
        //}

        public bool getAllClgSearch()
        {
            return UserDO.getAllClgSearch();
        }

        public bool getClgSearch(string courseName, string state)
        {
            return UserDO.getClgSearch(courseName, state);
        }


    }
}
