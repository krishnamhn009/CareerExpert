using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;
using POCOLib;
using UtilLib;
namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
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
                populateCities();
            }
           
           
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
         
            ddlCity.DataSource = cities;
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Locality";
            ddlCity.DataBind();
           
            ddlQual.DataSource = qualifications;
            ddlQual.DataTextField = "Value";
            ddlQual.DataValueField = "Key";
            ddlQual.DataBind();

            ddlCareerField.DataSource = careers;
            ddlCareerField.DataTextField = "Value";
            ddlCareerField.DataValueField = "Key";
            ddlCareerField.DataBind();

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
       
    }


}