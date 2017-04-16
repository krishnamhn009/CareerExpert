using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using BALLib;
using UtilLib;
using POCOLib;
namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        
        private JobsBAL _jobBO = null;
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
            if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email))
            {
                if (!this.IsPostBack)
                {
                    if (ApplicationSession.Current.user.UserType.Equals(Constants.ADMIN))
                    {
                        FillJobGrid();                        
                        FillUserGrid();
                    }
                    else
                        Response.Redirect("~/home");
                }
            }
            else
                Response.Redirect("~/login");

        }

        public void FillJobGrid()
        {

            if (!(ApplicationSession.Current.PostedJobs.Count > 0) || !(ApplicationSession.Current.PendingJobs.Count > 0) || !(ApplicationSession.Current.AppliedJobs.Count > 0))   
            {
            
                //List<Jobs> jobsList = new List<Jobs>();                
                JobBO.retreiveJobs();
                //ApplicationSession.Current.Jobs=jobsList;
            }
                gvJobs.DataSource = ApplicationSession.Current.PostedJobs;
                gvJobs.DataBind();               
                gvPendingJobs.DataSource = ApplicationSession.Current.PendingJobs;
                gvPendingJobs.DataBind();
                gvAppliedJobs.DataSource = ApplicationSession.Current.AppliedJobs;
                gvAppliedJobs.DataBind();
        }
        
        protected void gvJobs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvJobs.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblJobId");
            TextBox txtJobTitle = (TextBox)row.FindControl("txtJobTitle");
            TextBox txtJobDesc = (TextBox)row.FindControl("txtJobDesc");
            TextBox txtJobExp = (TextBox)row.FindControl("txtJobExp");
            TextBox txtCompany = (TextBox)row.FindControl("txtCompany");
            TextBox txtJobLoc = (TextBox)row.FindControl("txtJobLoc");
            TextBox txtJobActive = (TextBox)row.FindControl("txtJobActive");
            gvJobs.EditIndex = -1;
            Jobs job = new Jobs(lbldeleteid.Text.Trim(), txtJobTitle.Text.Trim(), txtJobDesc.Text.Trim(), txtJobExp.Text.Trim(),txtCompany.Text.Trim(),txtJobLoc.Text.Trim());
            job.ActiveJobs = txtJobActive.Text;
            if (JobBO.UpdateJob(job))
            {
                ApplicationSession.Current.Jobs.Clear();
                ApplicationSession.Current.PendingJobs.Clear();
                ApplicationSession.Current.PostedJobs.Clear();
            }
            FillJobGrid();
        }


        protected void gvJobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobs.PageIndex = e.NewPageIndex;
            FillJobGrid(); 
        }
        protected void gvJobs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvJobs.EditIndex = -1;
            FillJobGrid();
        }
        protected void gvJobs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvJobs.EditIndex = e.NewEditIndex;
            FillJobGrid();
        }
        protected void gvJobs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvJobs.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblJobId");
            string id = Convert.ToString(lbldeleteid.Text.ToString());
            if (JobBO.DeleteJob(id))
             ApplicationSession.Current.Jobs.Clear();
            FillJobGrid();
        }

        protected void gvPendingJobs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvPendingJobs.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblJobId");
            TextBox txtJobTitle = (TextBox)row.FindControl("txtJobTitle");
            TextBox txtJobDesc = (TextBox)row.FindControl("txtJobDesc");
            TextBox txtJobExp = (TextBox)row.FindControl("txtJobExp");
            TextBox txtCompany = (TextBox)row.FindControl("txtCompany");
            TextBox txtJobLoc = (TextBox)row.FindControl("txtJobLoc");
            TextBox txtJobActive = (TextBox)row.FindControl("txtJobActive");
            gvPendingJobs.EditIndex = -1;
            Jobs job = new Jobs(lbldeleteid.Text.Trim(), txtJobTitle.Text.Trim(), txtJobDesc.Text.Trim(), txtJobExp.Text.Trim(), txtCompany.Text.Trim(), txtJobLoc.Text.Trim());
            job.ActiveJobs = txtJobActive.Text;
            if (JobBO.UpdateJob(job))
            {
                ApplicationSession.Current.Jobs.Clear();
                ApplicationSession.Current.PendingJobs.Clear();
                ApplicationSession.Current.PostedJobs.Clear();
            }
               
            FillJobGrid();
        }


        protected void gvPendingJobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPendingJobs.PageIndex = e.NewPageIndex;
            FillJobGrid();
        }
        protected void gvPendingJobs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPendingJobs.EditIndex = -1;
            FillJobGrid();
        }
        protected void gvPendingJobs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPendingJobs.EditIndex = e.NewEditIndex;
            FillJobGrid();
        }
        protected void gvPendingJobs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvPendingJobs.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblJobId");
            string id = Convert.ToString(lbldeleteid.Text.ToString());
            if (JobBO.DeleteJob(id))
            {
                ApplicationSession.Current.Jobs.Clear();
                ApplicationSession.Current.PendingJobs.Clear();
                ApplicationSession.Current.PostedJobs.Clear();
            }
            FillJobGrid();
        }

        protected void itemSelected(object sender, EventArgs e)
        {

            if (ddlAdd.SelectedValue.Equals(Constants.ADOPJOB))
            {
                AddJob.Visible = true;
                AddUser.Visible = false;
            }
            else if (ddlAdd.SelectedValue.Equals(Constants.ADOPUSER))
            {
                AddUser.Visible = true;
                AddJob.Visible = false; 
            }
            else
            {
                AddJob.Visible = false;
                AddUser.Visible = false;
            }
        }
        protected void btnAddJob_AddingJob(object sender, EventArgs e)
        {
            string jobId = txtNewJobId.Text;
            string jobTitle = txtNewJobTitle.Text;
            string jobDesc = txtNewJobDesc.Text;
            string jobLoc = txtNewJobLoc.Text;
            string jobExp = txtNewJobExp.Text;
            string company=txtNewJobCompany.Text;
            Int32 jobExpiryDays = Convert.ToInt32(txtNewJobExpiryDays.Text);
            Jobs job = new Jobs("Y", jobTitle.Trim(), jobDesc.Trim(), jobExp.Trim(),company.Trim(),jobLoc);
            job.Email = ApplicationSession.Current.user.Email;
            job.JobExpireDays = jobExpiryDays;
            if (JobBO.AddJob(job, string.Empty, "N", string.Empty))
                ApplicationSession.Current.Jobs.Clear();
            FillJobGrid();
            ResetControls();
        }

        protected void btnAddUser_AddingUser(object sender, EventArgs e)
        {
            User user = new User();         
             user.Name = txtUserName.Text;
            user.Email = txtEmail.Text;
            user.Mobile = txtPhone.Text;
            user.UserType=ddlUserType.SelectedValue.ToString();
            user.Add.City = string.Empty;
           // user.Add.State = string.Empty;
            user.Query = string.Empty;
            user.CareerField = string.Empty;
            if (UserBO.UserQury(user))
                ApplicationSession.Current.Users.Clear();
            //FillGrid();
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

//----------------------------------user Grid-----------------------------------------
        public void FillUserGrid()
        {

            if (!(ApplicationSession.Current.Users.Count > 0))
            {
                
                List<User> usersList = new List<User>();
                usersList = UserBO.getAllUsers();
                ApplicationSession.Current.Users = usersList;
            }
            gvUser.DataSource = ApplicationSession.Current.Users;
            gvUser.DataBind();
        }
        protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvUser.Rows[e.RowIndex];
            Label lblName = (Label)row.FindControl("lblName");
            TextBox txtEmail = (TextBox)row.FindControl("txtGvEmail");
             TextBox txtUserType = (TextBox)row.FindControl("txtGvUserType");
             TextBox txtPhone = (TextBox)row.FindControl("txtGvMobile");
            TextBox txtQual = (TextBox)row.FindControl("txtGvQualification");   
            TextBox txtGvInstitute = (TextBox)row.FindControl("txtGvInstitute");
            TextBox txtGvCompany = (TextBox)row.FindControl("txtGvCompany");
            TextBox txtGvExperience = (TextBox)row.FindControl("txtGvExperience");
            TextBox txtGvCity = (TextBox)row.FindControl("txtGvCity");
            gvJobs.EditIndex = -1;
            User user = new User(lblName.Text,txtEmail.Text,txtUserType.Text,txtPhone.Text,txtQual.Text,txtGvInstitute.Text,txtGvCompany.Text,txtGvExperience.Text,txtGvCity.Text,string.Empty);        
            if (UserBO.UpdateUser(user))
                ApplicationSession.Current.Users.Clear();
            FillUserGrid();
        }


        protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUser.PageIndex = e.NewPageIndex;
            FillUserGrid();
        }
        protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUser.EditIndex = -1;
            FillUserGrid();
        }
        protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUser.EditIndex = e.NewEditIndex;
            FillUserGrid();
        }
        protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvUser.Rows[e.RowIndex];
            TextBox lbldeleteid = (TextBox)row.FindControl("txtGvEmail");
            string id = Convert.ToString(lbldeleteid.Text.ToString());          
            if (JobBO.DeleteJob(id))
                ApplicationSession.Current.Jobs.Clear();
            FillUserGrid();
        }



    }
}