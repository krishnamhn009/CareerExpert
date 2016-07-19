using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;
using UtilLib;
using POCOLib;
using System.Web.UI.HtmlControls;
using System.IO;

namespace WebApplication1
{
    public partial class StudentAccount : System.Web.UI.Page
    {
        private UserBAL _userBO = null;
        private JobsBAL _jobBO = null;
        public UserBAL UserBO
        {
            get
            {
                if (_userBO == null)
                    _userBO = new UserBAL();
                return _userBO;
            }
        }
        public JobsBAL JobBO
        {
            get
            {
                if (_jobBO == null)
                    _jobBO = new JobsBAL();
                return _jobBO;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                if (string.IsNullOrEmpty(ApplicationSession.Current.user.Email))
                {
                    Response.Redirect("~/login");
                }
                else
                {
                    GetUserDetail();
                    //string jobTitle = txtNewUerJobTitle.Value;
                    //if (!string.IsNullOrEmpty(jobTitle))
                    //{
                    //    AddUserJob();
                    //}

                    //if (ApplicationSession.Current.user.UserType.Equals(Constants.ADMIN))
                    //    adminPanel.Visible = true;
                    //else
                    //    adminPanel.Visible = false;
                }
            }
            // GetUserDetail();         
            //else
            //{
            //    lbProfile.Attributes.Add("class", "active");                
            //}
            //third party login

            //  lblName.InnerText = "Krishna";
            //if (ApplicationSession.Current.OfcEmail != null && !(ApplicationSession.Current.OfcEmail.Equals(string.Empty)))
            //{
            //    OfficeMailId.Visible = false;
            //    PostJob.Visible = true;
            //    Employer.Visible = true;
            //}
            //else
            //{
            //    OfcMailText.Visible = true;
            //    PostJob.Visible = false;
            //    Employer.Visible = false;
            //    btnValidateMail.Visible = true;
            //}


        }

        public void AddUserJob()
        {
            string jobTitle = txtNewUerJobTitle.Value;
            string jobDesc = txtNewUserJobDesc.Value;
            string jobLoc = txtNewUserJobLoc.Value;
            string jobExp = txtNewUserJobExp.Value;
            string company = txtNewUserJobCompany.Value;
            Jobs job = new Jobs("N", jobTitle.Trim(), jobDesc.Trim(), jobExp.Trim(), company.Trim(), jobLoc);
            job.Email = ApplicationSession.Current.user.Email;
            string adminMessage = SendEmail.BuildPostedJobAdminMail(ApplicationSession.Current.user, job);
            if (JobBO.AddJob(job, string.Empty, adminMessage, Constants.MailSubject))
            {
                AddUserJobSuccess.Visible = true;
                //Mailing Windows Service
                //SendEmail.ReceiveJobEmail(ApplicationSession.Current.user, job);
            }
            ApplicationSession.Current.Jobs.Clear();
            //FillGrid();

            //Email Needs to be sent
            //ResetControls();
        }        

        void ResetControls()
        {
            txtNewJobId.Text = string.Empty;
            txtNewJobTitle.Text = string.Empty;
            txtNewJobDesc.Text = string.Empty;
            txtNewJobLoc.Text = string.Empty;
            txtNewJobExp.Text = string.Empty;
            txtNewJobCompany.Text = string.Empty;
        }

        void GetUserDetail()
        {
            string email = ApplicationSession.Current.user.Email;
            UserBO.GetUserDatail(email);
            lName.InnerText = ApplicationSession.Current.user.Name;
            lEmail.InnerText = ApplicationSession.Current.user.Email;
            lMobile.InnerText = ApplicationSession.Current.user.Mobile;
            lQualification.InnerText = ApplicationSession.Current.user.Qualification;
            lInstitute.InnerText = ApplicationSession.Current.user.Institute;
            lMarks.InnerText = ApplicationSession.Current.user.Marks;
            lCity.InnerText = ApplicationSession.Current.user.Add.City;
            //lLocation.InnerText = ApplicationSession.Current.user.Add.Location;
            
            lAbout.InnerText = ApplicationSession.Current.user.Query;
            lblProgress.InnerText = ApplicationSession.Current.user.ProgressBar.ToString();
           
            
            progressBar.Style.Add("width", lblProgress.InnerText);
            jobAppliedCount.Text = ApplicationSession.Current.user.AppliedJobs.Count.ToString();
            // jobAppliedCount.Style.Add("class", "label label-primary");
            if (ApplicationSession.Current.user.AppliedJobs.Count > 0)
            {

                jobAppliedWarning.Visible = false;
                Repeater1.Visible = true;
                Repeater1.DataSource = ApplicationSession.Current.user.AppliedJobs;
                Repeater1.DataBind();
            }
            else
            {
                jobAppliedWarning.Visible = true;
                Repeater1.Visible = false;
            }
            if (ApplicationSession.Current.user.PostedJobs.Count > 0)
            {
                Repeater2.Visible = true;

                Repeater2.DataSource = ApplicationSession.Current.user.PostedJobs;
                Repeater2.DataBind();
            }
            else
            {
                Repeater2.Visible = false;
            }
            showProfile.Visible = true;
            editProfie.Visible = false;
            btnEdit.Visible = true;
            btnSubmit.Visible = false;

            //MakeControlsReadable();
        }
        

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            txtName.Text = ApplicationSession.Current.user.Name;
            txtEmail.Text = ApplicationSession.Current.user.Email;
            txtMobNo.Text = ApplicationSession.Current.user.Mobile;            
            Dictionary<int, string> tmpQual = new Dictionary<int, string>(ApplicationSession.Current.Qualifications);
            string qual = ApplicationSession.Current.user.Qualification;
            if (qual != "")
            {
                tmpQual.Remove(1);
                tmpQual.Add(1, qual);
            }
            ddlQual.DataSource = tmpQual;
            ddlQual.DataTextField = "Value";
            ddlQual.DataValueField = "Key";
            ddlQual.DataBind();
            ddlQual.SelectedIndex = 1;
            string inst = ApplicationSession.Current.user.Institute;
            Dictionary<int, string> tempInst = new Dictionary<int, string>(ApplicationSession.Current.Institutes);
            if (inst != "")
            {
                tempInst.Remove(1);
                tempInst.Add(1, inst);
            }
            ddlUniversity.DataSource = tempInst;
            ddlUniversity.DataTextField = "Value";
            ddlUniversity.DataValueField = "Key";
            ddlUniversity.DataBind();
            ddlUniversity.SelectedIndex = 1;

            string city = ApplicationSession.Current.user.Add.City;
            string marks = ApplicationSession.Current.user.Marks;
            string cmpny = ApplicationSession.Current.user.Institute;
            string exp = ApplicationSession.Current.user.Experience;

            //Dictionary<int, string> tempCities = new Dictionary<int, string>(ApplicationSession.Current.Cities);
            Dictionary<int, string> tempMarks = new Dictionary<int, string>(ApplicationSession.Current.Marks);
            Dictionary<int, string> tempCom = new Dictionary<int, string>(ApplicationSession.Current.Companies);
            Dictionary<int, string> tempExp = new Dictionary<int, string>(ApplicationSession.Current.Experience);
            if (marks != "")
            {
                tempMarks.Remove(1);
                tempMarks.Add(1, marks);
            }

            if (cmpny != "")
            {
                tempCom.Remove(1);
                tempCom.Add(1, cmpny);
            }
            if (exp != "")
            {
                tempExp.Remove(1);
                tempExp.Add(1, exp);
            }

            ddlMarks.DataSource = tempMarks;
            ddlMarks.DataTextField = "Value";
            ddlMarks.DataValueField = "Key";
            ddlMarks.DataBind();


            List<Address> tempCiti = new List<Address>(ApplicationSession.Current.Cities);
            tempCiti.Insert(0, new Address(city, city, ""));
            ddlCity.DataSource = tempCiti;
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "Locality";
            ddlCity.DataBind();


            

            txtAreaAbout.Text = ApplicationSession.Current.user.Query;
            showProfile.Visible = false;
            editProfie.Visible = true;
            btnEdit.Visible = false;
            btnSubmit.Visible = true;
            btnCancel.Visible = true;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.ToString();
            string email = txtEmail.Text.ToString();
            string phNo = txtMobNo.Text.ToString();
            //string pswd = txtPswd.Text.ToString();
            //string location = txtAddress.Text.ToString();
            string level = ddlQual.SelectedItem.Text.ToString();
            string institute = ddlUniversity.SelectedItem.Text.ToString();
            string marks = ddlMarks.SelectedItem.Text.ToString();
            string city = ddlCity.SelectedItem.Text.ToString();
           
            string comments = txtAreaAbout.Text.ToString();
            
            User user = new User(name, email, email, phNo, level, institute, marks, city, string.Empty, string.Empty, comments, ApplicationSession.Current.UserType);
           

           // user.Add.Location = location;
            if (UserBO.UserRegistration(user, "", "", ""))
            {
                showProfile.Visible = true;
                editProfie.Visible = false;
                btnEdit.Visible = true;
                btnSubmit.Visible = false;
                btnCancel.Visible = false;
                GetUserDetail();
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "id", "<script>alert('server busy!!!')</script>", true);

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            showProfile.Visible = true;
            editProfie.Visible = false;
            btnEdit.Visible = true;
            btnSubmit.Visible = false;
            btnCancel.Visible = false;
        }
        
    }
}