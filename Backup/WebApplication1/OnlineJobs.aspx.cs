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
    public partial class OnlineJobs : System.Web.UI.Page
    {
        private JobsBAL _jobsBO = null;
        public JobsBAL JobBO
        { get { if (_jobsBO == null) _jobsBO = new JobsBAL(); return _jobsBO; } }

     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatePricing();
                populateJobs();
                if ( Request.QueryString.Keys.Count>0)
                {
                    if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email))
                    {
                        if (!string.IsNullOrEmpty(ApplicationSession.Current.user.UserPricingPlan.PlanId))
                        {
                            Int32 referralsLeft = ApplicationSession.Current.user.UserPricingPlan.ReferralsLeft;
                            Int32 expireDate = DateTime.Compare(Convert.ToDateTime(ApplicationSession.Current.user.UserPricingPlan.PlanExpireDate), DateTime.Now);
                            if (referralsLeft == 0 || expireDate < 0)
                            {
                                userPlanStatus.Visible = true;
                                lblUserPlan.Text = "Your Plan has Expired, Please Buy a new Plan to continue applying Job!!!!";
                            }
                            else
                            {
                                string jobId = Request.QueryString.GetValues(0)[0].ToString();
                                if (ApplyJob(ApplicationSession.Current.user.Email, jobId))
                                {
                                    jobStatus.Visible = true;
                                    userPlanStatus.Visible = false;
                                    ApplicationSession.Current.user.UserPricingPlan.ReferralsLeft = ApplicationSession.Current.user.UserPricingPlan.ReferralsLeft - 1;
                                }
                                else
                                {
                                    jobStatus.Visible = false;
                                    userPlanStatus.Visible = false;
                                }
                            }
                        }
                        else
                        {
                            userPlanStatus.Visible = true;
                            lblUserPlan.Text = "Please Buy a Plan to Apply for Jobs!!!!";
                        }
                    }
                    else
                    {
                        ApplicationSession.Current.UserType = Constants.EMPLOYEE;
                        Response.Redirect("~/register-with-us");
                    }

                }

                //Response.Redirect("~/login");
               
            }
        }

        void PopulatePricing()
        {
            if (ApplicationSession.Current.Pricing.Count == 0)
            JobBO.GetAllPricing();
            dlData.DataSource = ApplicationSession.Current.Pricing;
            dlData.DataBind();
        }

        bool ApplyJob(string email,string joibId)
        {

            return JobBO.ApplyJob(email, joibId);
        }

        void populateJobs()
        {
            List<Jobs> job = new List<Jobs>();
            if (ApplicationSession.Current.Jobs.Count > 0)
                job.AddRange(ApplicationSession.Current.Jobs);
            else
            {                
                job = JobBO.getAllJobs();
            }
            List<Jobs> premiumJob = new List<Jobs>();
            premiumJob = job.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
            Repeater1.DataSource = premiumJob;
            Repeater1.DataBind();
//            -----------binding walkin jobs-------------------
            List<Jobs> localJobs = new List<Jobs>();
            localJobs = job.FindAll(w => w.JobType.ToUpper().Equals("W")).ToList();
            Repeater2.DataSource = localJobs;
            Repeater2.DataBind();
            //----------------------------------------------------
        }

        protected void btnSearchJob_Click(object sender, EventArgs e)
        {
            string city=ddlLocation.SelectedItem.ToString();
            string keyword=txtJobKeyword.Text;
            if (ddlLocation.SelectedItem.ToString().Equals("Select City"))
                //Repeater1.DataSource = ApplicationSession.Current.Jobs;
                populateJobs();
            else
            {
                List<Jobs> filterJobPremiumType = new List<Jobs>();
                List<Jobs> filterJobWalkType = new List<Jobs>();
                filterJobPremiumType= ApplicationSession.Current.Jobs.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
                filterJobWalkType = ApplicationSession.Current.Jobs.FindAll(w => w.JobType.ToUpper().Equals("W")).ToList();
                List<Jobs> filterByCity = new List<Jobs>();               
                List<Jobs> searchList = new List<Jobs>();
                //Premium Type Job----------------------------
                filterByCity = filterJobPremiumType.FindAll(w => w.Location.ToUpper().Equals(city.ToUpper())).ToList();                
                searchList = SerchedJobs(filterByCity, keyword);           
                Repeater1.DataSource = searchList;
                Repeater1.DataBind();
                //End-------------

                //Walk Type Job----------------------------
                filterByCity = filterJobWalkType.FindAll(w => w.Location.ToUpper().Equals(city.ToUpper())).ToList();
                searchList = SerchedJobs(filterByCity, keyword);
                Repeater2.DataSource = searchList;
                Repeater2.DataBind();
                //End-------------
            }
           
        }

        public List<Jobs> SerchedJobs(List<Jobs> filterByCity, string keyword)
        {
            List<Jobs> searchList = new List<Jobs>();
            searchList =
           (from job in filterByCity
            where job.JobDesc.StartsWith(keyword,
               StringComparison.OrdinalIgnoreCase) ||
               job.JobExperience.StartsWith(keyword,
               StringComparison.OrdinalIgnoreCase) ||
               job.JobTitle.StartsWith(keyword,
               StringComparison.OrdinalIgnoreCase) ||
               job.Company.StartsWith(keyword,
               StringComparison.OrdinalIgnoreCase)
            orderby job.Location
            select job).ToList();
            return searchList;
        }


    }
}