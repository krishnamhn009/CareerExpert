using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;
using POCOLib;
using UtilLib;
using System.IO;
using System.Configuration;

namespace WebApplication1
{
    public partial class Signup1 : System.Web.UI.Page
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
                if (!Request.Form.HasKeys())
                    ApplicationSession.Current.UserType = Constants.EMPLOYEE;
                else if (!string.IsNullOrEmpty(Request.Form["userType"]))
                        if (Request.Form["userType"].ToString().ToUpper() == "STUDENT")
                            ApplicationSession.Current.UserType = Constants.STUDENT;
                        else
                            ApplicationSession.Current.UserType = Constants.EMPLOYEE;
                    
                populateCities();
                InitialiseControls();
                
            }

            //if (ApplicationSession.Current.UserType == null)     
            //    if (Request.Form["userType"].ToString() != null)                
            //        ApplicationSession.Current.UserType = Request.Form["userType"].ToString().ToUpper();
           
        }
        void InitialiseControls()
        {
            if (ApplicationSession.Current.UserType.Equals(Constants.STUDENT))
            {
                lblCompany.Visible = false;
                ddlCompany.Visible = false;
                JobSeeker.Visible = false;
                Resume.Visible = false;
            }
            

        }
        void populateCities()
        {
            List<Address> cities = new List<Address>();
            Dictionary<int, string> qualifications = new Dictionary<int, string>();
            Dictionary<int, string> institutes = new Dictionary<int, string>();
            Dictionary<int, string> careers = new Dictionary<int, string>();
            Dictionary<int, string> marks = new Dictionary<int, string>();
            Dictionary<int, string> companies = new Dictionary<int, string>();
            Dictionary<int, string> experience = new Dictionary<int, string>();
            if (ApplicationSession.Current.Cities.Count == 0 && ApplicationSession.Current.Qualifications.Count == 0 && ApplicationSession.Current.Institutes.Count == 0 && ApplicationSession.Current.Careers.Count == 0)
            {               
                UserBO.getAllCities();
            }
            cities.AddRange(ApplicationSession.Current.Cities);
            qualifications = ApplicationSession.Current.Qualifications.ToDictionary(entry => entry.Key, entry => entry.Value);
            institutes = ApplicationSession.Current.Institutes.ToDictionary(entry => entry.Key, entry => entry.Value);
            careers = ApplicationSession.Current.Careers.ToDictionary(entry => entry.Key, entry => entry.Value);
            marks = ApplicationSession.Current.Marks.ToDictionary(entry => entry.Key, entry => entry.Value);
            companies = ApplicationSession.Current.Companies.ToDictionary(entry => entry.Key, entry => entry.Value);
            experience = ApplicationSession.Current.Experience.ToDictionary(entry => entry.Key, entry => entry.Value);

            ddlCity.DataSource = cities;
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Locality";
            ddlCity.DataBind();

            ddlQual.DataSource = qualifications;
            ddlQual.DataTextField = "Value";
            ddlQual.DataValueField = "Key";
            ddlQual.DataBind();

            ddlMarks.DataSource = marks;
            ddlMarks.DataTextField = "Value";
            ddlMarks.DataValueField = "Key";
            ddlMarks.DataBind();

            ddlUniversity.DataSource = institutes;
            ddlUniversity.DataTextField = "Value";
            ddlUniversity.DataValueField = "Key";
            ddlUniversity.DataBind();

            ddlCompany.DataSource = companies;
            ddlCompany.DataTextField = "Value";
            ddlCompany.DataValueField = "Key";
            ddlCompany.DataBind();

            ddlExp.DataSource = experience;
            ddlExp.DataTextField = "Value";
            ddlExp.DataValueField = "Key";
            ddlExp.DataBind();
        }

        //protected void UploadButton_Click(object sender, EventArgs e)
        //{
        //    //if (FileUploadControl.HasFile)
        //    //{
        //        try
        //        {
        //            string filename = Path.GetFileName(FileUploadControl.FileName);
        //            FileUploadControl.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileSavePath"].ToString()) + filename);
        //            StatusLabel.Text = "Upload status: File uploaded!";
        //        }
        //        catch (Exception ex)
        //        {
        //            StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
        //        }
        //    //}
        //}

        protected string SaveResume(string email, HttpPostedFile file)
        {
            if (file != null && file.ContentLength > 0)
            {
                string filename = Path.GetFileName(file.FileName);               
                var folder = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileSavePath"].ToString()) + "Resume";                 
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);
                string savePath = folder + '/' + email.Substring(0, email.IndexOf("@")).ToString() +"_"+DateTime.Now.Month + "_" + DateTime.Now.Day + "_" + DateTime.Now.Year + "_" + filename;
                file.SaveAs(savePath);
                return savePath;
            }
            else
                return string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.ToString();         
            string email = txtEmail.Text.ToString();
            string phNo = txtMobNo.Text.ToString();            
            string pswd = txtPswd.Text.ToString();
            string level = ddlQual.SelectedItem.Text.ToString();
            string institute = ddlUniversity.SelectedItem.Text.ToString();
            string marks = ddlMarks.SelectedItem.Text.ToString();
            string city = ddlCity.SelectedItem.Text.ToString();
            string company = ddlCompany.SelectedItem.Text.ToString();
            string experience = ddlExp.SelectedItem.Text.ToString();
            string comments = txtAreaAbout.Text.ToString();
            string fileSaved=string.Empty;
            User user = new User(name, email, email, phNo, level, institute, marks, city, company, experience, comments, ApplicationSession.Current.UserType);
            user.Password = pswd;
            HttpPostedFile file = Request.Files["ctl00$ContentPlaceHolder1$fileType"];
            fileSaved=SaveResume(user.Email, file);
            if (!string.IsNullOrEmpty(fileSaved))
            {
                user.ResumeSubmitted = "Y";                                
               // user.ResumePath = user.Email.Substring(0, user.Email.IndexOf("@")).ToString() + '/' + file.FileName;
                user.ResumePath = fileSaved.Substring(fileSaved.IndexOf("Resume"));
                //folder + '/' +email.Substring(0, email.IndexOf("@")).ToString()+DateTime.Now+ filename
            }
            else
            user.ResumeSubmitted = "N";
            user.Add.Location = "";
            string userMessage = SendEmail.BuildUserMail(user);
            string adminMessage = SendEmail.BuildAdminMail(user);
            if (UserBO.UserRegistration(user, userMessage, adminMessage, Constants.MailSubject))
            {
                ApplicationSession.Current.user = new User(user);
                ApplicationSession.Current.user.Name = name;
                ApplicationSession.Current.user.Email = email;
                //Mailing Windows Service
                //SendEmail.SendUserMail(user);
                //ResetFields();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>$('#regConfirm').modal('show');</script>", false);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script>alert('Registration Successful! You can now Login');</script>", false);
                Response.Redirect("~/login?login="+Constants.REGISTER);
                //ClientScript.RegisterStartupScript(GetType(), "id", "callMyJSFunction()", true);
                //Response.Redirect("Default.aspx");
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "id", "<script>alert('server busy!!!')</script>", true);
        }

        void ResetFields()
        {
            txtName.Text = string.Empty;
            txtMobNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPswd.Text = string.Empty;
            txtAreaAbout.Text = string.Empty;            
            ddlCity.SelectedIndex = 0;
            ddlQual.SelectedIndex = 0;
            ddlUniversity.SelectedIndex = 0;
            ddlMarks.SelectedIndex = 0;
            ddlCompany.SelectedIndex = 0;
            ddlExp.SelectedIndex = 0;
        }
    }
}