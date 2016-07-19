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
            if (!IsPostBack)
            {
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

    }
}