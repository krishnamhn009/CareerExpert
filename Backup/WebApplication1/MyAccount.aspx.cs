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
    public partial class MyAccount : System.Web.UI.Page
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
                   
                    
                    if (ApplicationSession.Current.user.UserType.Equals(Constants.ADMIN))
                        adminPanel.Visible = true;
                    else
                        adminPanel.Visible = false;
                }
               
            }          
            if (!string.IsNullOrEmpty(txtNewUerJobTitle.Value))
            {
                AddUserJob();
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
            string jobTitle = txtNewUerJobTitle.Value ;
            string jobDesc = txtNewUserJobDesc.Value;
            string jobLoc = txtNewUserJobLoc.Value;
            string jobExp = txtNewUserJobExp.Value;
            string company = txtNewUserJobCompany.Value;
            Jobs job = new Jobs("N" , jobTitle.Trim(), jobDesc.Trim(), jobExp.Trim(), company.Trim(), jobLoc);
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

        protected void btnValidateMail_ValidateMail(object sender, EventArgs e)
        {
            //string mail = txtOfficeEmail.Text;            
            //userBO = new UserBAL();
            //if (userBO.ValidateOfficeMail(mail))
            //{
            //    btnValOTP.Visible = true;
            //    OTPText.Visible = true;
            //    //OTPNotice.Visible = true;
            //    SendEmail.SendOTP(ApplicationSession.Current.UserOTP, mail);
            //    btnValidateMail.Visible = false;
            //    OfcMailText.Visible = false;
            //}
        }
      
        protected void btnValOTP_ValidateOTP(object sender, EventArgs e)
        {
            //string OTP=ApplicationSession.Current.UserOTP;
            //if (OTP.Equals(txtOTP.Text))
            //{
            //    btnValOTP.Visible = false;
            //    OTPText.Visible = false;
            //    PostJob.Visible = true;
            //    Employer.Visible = true;
            //    OTPNotice.Visible = true;
            //}
            //else
            //{
            //    btnValOTP.Visible = true;
            //    OTPText.Visible = true;
            //    OTPError.Visible = true;
            //}
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
            lName.InnerText= ApplicationSession.Current.user.Name;
            lEmail.InnerText = ApplicationSession.Current.user.Email;
            lMobile.InnerText = ApplicationSession.Current.user.Mobile;
            lQualification.InnerText = ApplicationSession.Current.user.Qualification;
            lInstitute.InnerText = ApplicationSession.Current.user.Institute;
            lMarks.InnerText = ApplicationSession.Current.user.Marks;
            lCity.InnerText = ApplicationSession.Current.user.Add.City;
            //lLocation.InnerText = ApplicationSession.Current.user.Add.Location;
            lCompany.InnerText = ApplicationSession.Current.user.Company;
            lExp.InnerText = ApplicationSession.Current.user.Experience;
            lAbout.InnerText = ApplicationSession.Current.user.Query;
            lblProgress.InnerText = ApplicationSession.Current.user.ProgressBar.ToString();
            if (Convert.ToInt32(ApplicationSession.Current.user.ProgressBar.ToString().Substring(0, ApplicationSession.Current.user.ProgressBar.ToString().Length - 1)) <= 50)
                progressBar.Attributes.Add("Class", "progress-bar progress-bar-danger");
            else if (Convert.ToInt32(ApplicationSession.Current.user.ProgressBar.ToString().Substring(0, ApplicationSession.Current.user.ProgressBar.ToString().Length - 1)) == 100)
                progressBar.Attributes.Add("Class", "progress-bar progress-bar-success");
            //User Plan
            if (ApplicationSession.Current.user.UserPricingPlan != null)
            {
                if (!string.IsNullOrEmpty(ApplicationSession.Current.user.UserPricingPlan.PlanName))
                {
                    noUserPlanTaken.Visible = false;
                    userPlanTaken.Visible = true;
                    lPlanName.InnerText = ApplicationSession.Current.user.UserPricingPlan.PlanName.ToString();
                    lPlanExpireDate.InnerText = ApplicationSession.Current.user.UserPricingPlan.PlanExpireDate.ToString();
                    lReferralsLeft.InnerText = ApplicationSession.Current.user.UserPricingPlan.ReferralsLeft.ToString();
                    lJobsAppliedCount.InnerText = ApplicationSession.Current.user.UserPricingPlan.JobsAppliedCount.ToString();
                }
                else
                {
                    userPlanTaken.Visible = false;
                    noUserPlanTaken.Visible = true;
                }
            }
            else
            {
                userPlanTaken.Visible = false;
                noUserPlanTaken.Visible = true;
            }
            //User Plan
            if (ApplicationSession.Current.user.ResumeSubmitted.ToString()=="Y")
            {
            lUploadResume.InnerText = ApplicationSession.Current.user.ResumePath.ToString().Substring(ApplicationSession.Current.user.ResumePath.ToString().LastIndexOf("_") + 1);               
            }         
            string fileName = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileSavePath"].ToString()) +"Resume"+
                     ApplicationSession.Current.user.ResumePath.ToString();
            if (File.Exists(fileName))
            {
                //resumeUpLoaded.InnerText = ApplicationSession.Current.user.ResumePath.ToString().Substring(ApplicationSession.Current.user.ResumePath.ToString().IndexOf("/") + 1);
                //resumeUpLoaded.Attributes.Add("href", fileName);
                //fileType.Name = "ctl00$ContentPlaceHolder1$fileType";
                resumeUpLoaded.Text = ApplicationSession.Current.user.ResumePath.ToString().Substring(ApplicationSession.Current.user.ResumePath.ToString().IndexOf("/") + 1);               
            }
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
        //assigning value to editable field

        //     txtName.Text=ApplicationSession.Current.user.Name;
        //        txtEmail.Text=ApplicationSession.Current.user.Email;
        //        txtMobNo.Text=ApplicationSession.Current.user.Mobile;
        //        ddlQual.Text = ApplicationSession.Current.user.Qualification;
        //        ddlUniversity.Text = ApplicationSession.Current.user.Institute;
        //        ddlMarks.Text = ApplicationSession.Current.user.Marks;
        //        ddlCity.Text = ApplicationSession.Current.user.Add.City;
        //        ddlCompany.Text=ApplicationSession.Current.user.Company;
        //        ddlExp.Text=ApplicationSession.Current.user.Experience;
        //        txtAreaAbout.Text = ApplicationSession.Current.user.Query;

        //void MakeControlsReadable()
        //{ 
        //     txtName.Enabled=false;
        //     txtEmail.Enabled=false;
        //     txtMobNo.Enabled=false;
        //     ddlQual.Enabled=false;
        //     ddlUniversity.Enabled=false;
        //     ddlMarks.Enabled=false;
        //     ddlCity.Enabled=false;
        //     ddlCompany.Enabled=false;
        //     ddlExp.Enabled=false;
        //     txtAreaAbout.Enabled = false;
        //}

        protected void btnEdit_Click(object sender, EventArgs e)
        {
           
            txtName.Text = ApplicationSession.Current.user.Name;
            txtEmail.Text=ApplicationSession.Current.user.Email;
            txtMobNo.Text=ApplicationSession.Current.user.Mobile;
            if (ApplicationSession.Current.user.ResumeSubmitted.ToString().Equals("Y"))
            {
            resumeUpLoaded.Text = ApplicationSession.Current.user.ResumePath.ToString().Substring(ApplicationSession.Current.user.ResumePath.ToString().IndexOf("/") + 1);
            resumeUpLoaded.Text= ApplicationSession.Current.user.ResumePath.ToString().Substring(ApplicationSession.Current.user.ResumePath.LastIndexOf("_"));
            }
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
            string inst=ApplicationSession.Current.user.Institute;
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


            ddlCompany.DataSource = tempCom;
            ddlCompany.DataTextField = "Value";
            ddlCompany.DataValueField = "Key";
            ddlCompany.DataBind();


            ddlExp.DataSource = tempExp;
            ddlExp.DataTextField = "Value";
            ddlExp.DataValueField = "Key";
            ddlExp.DataBind();
                      
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
            string company = ddlCompany.SelectedItem.Text.ToString();
            string experience = ddlExp.SelectedItem.Text.ToString();
            string comments = txtAreaAbout.Text.ToString();
            string resumePath=ApplicationSession.Current.user.ResumePath;
            string fileSaved = string.Empty;
            User user = new User(name, email, email, phNo,  level, institute, marks, city, company, experience, comments, ApplicationSession.Current.UserType);
            HttpPostedFile file = Request.Files["ctl00$ContentPlaceHolder1$fileType"];
             fileSaved=SaveResume(user.Email, file);
            if (!string.IsNullOrEmpty(fileSaved))
            {           
                user.ResumeSubmitted = "Y";
                user.ResumePath = fileSaved;
            }
            else if (ApplicationSession.Current.user.ResumePath != "")
            {
                user.ResumeSubmitted = "Y";
                user.ResumePath = ApplicationSession.Current.user.ResumePath;
            }
            else
                user.ResumeSubmitted = "N";
            
            //user.Add.Location = location;
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
        protected string SaveResume(string email, HttpPostedFile file)
        {           
            string filename = Path.GetFileName(file.FileName);
            if (file != null && file.ContentLength > 0)
            {           
            var folder = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileSavePath"].ToString()) + "Resume";
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);
            string savePath = folder + '/' + email.Substring(0, email.IndexOf("@")).ToString() + "_" + DateTime.Now.Month + "_" + DateTime.Now.Day + "_" + DateTime.Now.Year + "_" + filename;
            file.SaveAs(savePath);
            return savePath;
            }
            else
                return string.Empty;
        }

       
        protected void resumeUpLoaded_Click(object sender, EventArgs e)
        {
            string fileName = ApplicationSession.Current.user.ResumePath.ToString();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename="+fileName);
            Response.TransmitFile(Server.MapPath(fileName));
            Response.End();
        }

        //protected void UploadButton_Click(object sender, EventArgs e)
        //{
        //    //if (FileUploadControl.HasFile)
        //    //{
        //    try
        //    {
        //        string filename = Path.GetFileName(FileUploadControl.FileName);
        //        FileUploadControl.SaveAs(Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileSavePath"].ToString()) + filename);
        //        StatusLabel.Text = "Upload status: File uploaded!";
        //    }
        //    catch (Exception ex)
        //    {
        //        StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
        //    }
        //    //}
        //}
    }
}