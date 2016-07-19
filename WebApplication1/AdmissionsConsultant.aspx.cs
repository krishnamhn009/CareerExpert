using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;
using POCOLib;
using UtilLib;
using System.Text.RegularExpressions;

namespace WebApplication1
{
    public partial class Admission : System.Web.UI.Page
    {

        private UserBAL _userBO = null;
        public UserBAL UserBO
        {
            get
            {
                if (_userBO == null)
                    _userBO = new UserBAL();
                return _userBO;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Master.FindControl("testimonial").Visible = false;
            if (!IsPostBack)
            {
                
                populateCities();
                PopulateClgSearch();
                populateCourseState();
            }
        }

        void populateCourseState()
        {
            Dictionary<int, string> courses = new Dictionary<int, string>();
            Dictionary<int, string> states = new Dictionary<int, string>();
            courses = ApplicationSession.Current.Courses.ToDictionary(entry => entry.Key, entry => entry.Value);
            states = ApplicationSession.Current.States.ToDictionary(entry => entry.Key, entry => entry.Value);

            ddlCourse.DataSource = courses;
            ddlCourse.DataTextField = "Value";
            ddlCourse.DataValueField = "Key";
            ddlCourse.DataBind();

            ddlCity.DataSource = states;
            ddlCity.DataTextField = "Value";
            ddlCity.DataValueField = "Key";
            ddlCity.DataBind();

        }
        void PopulateClgSearch()
        {
          if (ApplicationSession.Current.CollegeList.Count==0)
            UserBO.getAllClgSearch();            
            gvListClg.DataSource = ApplicationSession.Current.CollegeList;
            gvListClg.DataBind();

        }

        void populateCities()
        {
            List<Address> cities = new List<Address>();
            Dictionary<int, string> qualifications = new Dictionary<int, string>();
            Dictionary<int, string> institutes = new Dictionary<int, string>();
            Dictionary<int, string> careers = new Dictionary<int, string>();
            if (ApplicationSession.Current.Cities.Count == 0 || ApplicationSession.Current.Qualifications.Count == 0 || ApplicationSession.Current.Institutes.Count == 0 || ApplicationSession.Current.Careers.Count == 0 || ApplicationSession.Current.Companies.Count == 0 || ApplicationSession.Current.Marks.Count == 0 || ApplicationSession.Current.Experience.Count == 0)
            {

                UserBO.getAllCities();
            }
            cities.AddRange(ApplicationSession.Current.Cities);
            qualifications = ApplicationSession.Current.Qualifications.ToDictionary(entry => entry.Key, entry => entry.Value);
            institutes = ApplicationSession.Current.Institutes.ToDictionary(entry => entry.Key, entry => entry.Value);
            careers = ApplicationSession.Current.Careers.ToDictionary(entry => entry.Key, entry => entry.Value);

            ddlCity1.DataSource = cities;
            ddlCity1.DataTextField = "City";
            ddlCity1.DataValueField = "Locality";
            ddlCity1.DataBind();

            ddlQual.DataSource = qualifications;
            ddlQual.DataTextField = "Value";
            ddlQual.DataValueField = "Key";
            ddlQual.DataBind();

            ddlCareerField.DataSource = careers;
            ddlCareerField.DataTextField = "Value";
            ddlCareerField.DataValueField = "Key";
            ddlCareerField.DataBind();

        }

        protected void btnSearchClg_Click(object sender, EventArgs e)
        {
            string courseName = ddlCourse.SelectedItem.ToString().ToUpper();
            string state = ddlCity.SelectedItem.ToString();
            if (courseName.Equals("--SELECT COURSE--", StringComparison.CurrentCultureIgnoreCase) && state.Equals("--SELECT STATE--", StringComparison.CurrentCultureIgnoreCase))
                PopulateClgSearch();
            else
            {
                List<CollegeList> searchList = new List<CollegeList>();
                if (courseName.Equals("--SELECT COURSE--", StringComparison.CurrentCultureIgnoreCase)) 
                    searchList=  ApplicationSession.Current.CollegeList.FindAll(w => w.State.Equals(state, StringComparison.CurrentCultureIgnoreCase)).ToList();
                else if (state.Equals("--SELECT STATE--", StringComparison.CurrentCultureIgnoreCase))
                    searchList=  ApplicationSession.Current.CollegeList.FindAll(w => w.CourseName.Equals(courseName, StringComparison.CurrentCultureIgnoreCase)).ToList();
                else
                searchList=  ApplicationSession.Current.CollegeList.FindAll(w => w.CourseName.Equals(courseName, StringComparison.CurrentCultureIgnoreCase) && w.State.Equals(state, StringComparison.CurrentCultureIgnoreCase)).ToList();              
                gvListClg.DataSource = searchList;
                gvListClg.DataBind();
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gvListClg.PageIndex = e.NewPageIndex;
            btnSearchClg_Click(sender, e);            
        }
       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.ToString();
            string phNo = txtMobNo.Text.ToString();
            string email = txtEmail.Text.ToString();
            string query = txtQuery.Text.ToString();
            string city = ddlCity.SelectedItem.Text.ToString();
            string level = ddlQual.SelectedItem.Text.ToString();
            string careerField = ddlCareerField.SelectedItem.Text.ToString();
            User user = new User(name, phNo, email, query, city, level, careerField, Constants.QUERYUSERTYPE);
            string userMessage = SendEmail.BuildUserMail(user);
            string adminMessage = SendEmail.BuildAdminMail(user);
            if (UserBO.AddUserQury(user, userMessage, adminMessage, Constants.MailSubject))
            {
                //Mailing Windows Service
                //SendEmail.SendUserMail(user);
                submitInfo.Visible = true;
                ResetFields();
                submitInfo.InnerText = "Thank you!!We will reach at you shortly.";
            }
        }

        void ResetFields()
        {
            txtName.Text = string.Empty;
            txtMobNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtQuery.Text = string.Empty;
            ddlCity.SelectedIndex = 0;
            ddlQual.SelectedIndex = 0;
            ddlCareerField.SelectedIndex = 0;
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            string name = txtName.Text.ToString();
            string phNo = txtMobNo.Text.ToString();
            string email = txtEmail.Text.ToString();
            string query = txtQuery.Text.ToString();
            string city = ddlCity.SelectedItem.Text.ToString();
            string level = ddlQual.SelectedItem.Text.ToString();
            string careerField = ddlCareerField.SelectedItem.Text.ToString();
            User user = new User(name, phNo, email, query, city, level, careerField, Constants.QUERYUSERTYPE);
            string userMessage = SendEmail.BuildUserMail(user);
            string adminMessage = SendEmail.BuildAdminMail(user);
            if (UserBO.AddUserQury(user, userMessage, adminMessage, Constants.MailSubject))
            {
                //Mailing Windows Service
                //SendEmail.SendUserMail(user);
                submitInfo.Visible = true;
                ResetSubmitFields();
                submitInfo.InnerText = "Thank you!!We will reach at you shortly.";
            }
        }

        void ResetSubmitFields()
        {
            txtName.Text = string.Empty;
            txtMobNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtQuery.Text = string.Empty;
            ddlCity.SelectedIndex = 0;
            ddlQual.SelectedIndex = 0;
            ddlCareerField.SelectedIndex = 0;
        }

    }

}
