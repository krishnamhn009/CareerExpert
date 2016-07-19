using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using BALLib;
using POCOLib;
using UtilLib;
using System.Data;
using System.Drawing;
using System.Reflection;

namespace WebApplication1
{
    public partial class OnlineJobs : System.Web.UI.Page
    {
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 5;
        List<Jobs> referJobs = new List<Jobs>();
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        private JobsBAL _jobsBO = null;
        public JobsBAL JobBO
        { get { if (_jobsBO == null) _jobsBO = new JobsBAL(); return _jobsBO; } }

     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                PopulatePricing();
                //populateJobs();
                referJobs=PopulateReferJobs();
                BindDataIntoRepeater(referJobs);
                //GetCustomersPageWise(1);
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
                                string userMessage = SendEmail.BuildAppliedUserJobMail(ApplicationSession.Current.user.Name);
                                string adminMessage = SendEmail.BuildAppliedJobAdminMail(ApplicationSession.Current.user.Email, ApplicationSession.Current.user.Name, jobId);
                                if (ApplyJob(ApplicationSession.Current.user.Email, jobId, userMessage, adminMessage, Constants.MailSubject))
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

        bool ApplyJob(string email,string joibId, string userMessage, string adminMessage, string mailSubject)
        {

            return JobBO.ApplyJob(email, joibId, userMessage, adminMessage, mailSubject);
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
            BindDataIntoRepeater(premiumJob);
            rptResult.DataSource = premiumJob;
            //rptResult.DataBind();
//            -----------binding walkin jobs-------------------
            List<Jobs> localJobs = new List<Jobs>();
            localJobs = job.FindAll(w => w.JobType.ToUpper().Equals("W")).ToList();
            Repeater2.DataSource = localJobs;
            Repeater2.DataBind();
            //----------------------------------------------------
        }

        protected void btnSearchJob_Click(object sender, EventArgs e)
        {
            string city = ddlLocation.SelectedItem.ToString();
            string keyword = txtJobKeyword.Text;
            if (ddlLocation.SelectedItem.ToString().Equals("Select City"))
                //Repeater1.DataSource = ApplicationSession.Current.Jobs;
                populateJobs();
            else
            {
                List<Jobs> filterJobPremiumType = new List<Jobs>();
                List<Jobs> filterJobWalkType = new List<Jobs>();
                filterJobPremiumType = ApplicationSession.Current.Jobs.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
                filterJobWalkType = ApplicationSession.Current.Jobs.FindAll(w => w.JobType.ToUpper().Equals("W")).ToList();
                List<Jobs> filterByCity = new List<Jobs>();
                List<Jobs> searchList = new List<Jobs>();
                //Premium Type Job----------------------------
                filterByCity = filterJobPremiumType.FindAll(w => w.Location.ToUpper().Contains(city.ToUpper())).ToList();
                searchList = SerchedJobs(filterByCity, keyword);
                BindDataIntoRepeater(searchList);
                //rptResult.DataSource = searchList;
                //rptResult.DataBind();
                //End-------------

                //Walk Type Job----------------------------
                filterByCity = filterJobWalkType.FindAll(w => w.Location.ToUpper().Contains(city.ToUpper())).ToList();
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
        
        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(10));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            rptResult.DataSource = pages;
            rptResult.DataBind();
        }

        private void GetCustomersPageWise(int pageIndex)
        {
            List<Jobs> job = new List<Jobs>();
            if (ApplicationSession.Current.Jobs.Count > 0)
                job.AddRange(ApplicationSession.Current.Jobs);
            else           
                job = JobBO.getAllJobs();
            List<Jobs> premiumJob = new List<Jobs>();
            premiumJob = job.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
            rptResult.DataSource = premiumJob;
            rptResult.DataBind();
            //int recordCount = Convert.ToInt32(premiumJob.Count);
            //PopulatePager(recordCount, pageIndex);
                
            
        }     
        
        private List<Jobs> PopulateReferJobs()
        {
            List<Jobs> job = new List<Jobs>();
            if (ApplicationSession.Current.Jobs.Count > 0)
                job.AddRange(ApplicationSession.Current.Jobs);
            else
                job = JobBO.getAllJobs();
            List<Jobs> premiumJob = new List<Jobs>();
            premiumJob = job.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
            return premiumJob;
        }  

        private void BindDataIntoRepeater(List<Jobs> premiumJob)
        {
            //List<Jobs> job = new List<Jobs>();
            //if (ApplicationSession.Current.Jobs.Count > 0)
            //    job.AddRange(ApplicationSession.Current.Jobs);
            //else
            //    job = JobBO.getAllJobs();
            //List<Jobs> premiumJob = new List<Jobs>();
            //premiumJob = job.FindAll(w => w.JobType.ToUpper().Equals("Y")).ToList();
            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable dt = converter.ToDataTable(premiumJob);
            _pgsource.DataSource = dt.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind data into repeater
            rptResult.DataSource = _pgsource;
            rptResult.DataBind();

            // Call the function to do paging
            HandlePaging();
        }

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it 
            // to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            referJobs = PopulateReferJobs();
            BindDataIntoRepeater(referJobs);
        }
        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            referJobs = PopulateReferJobs();
            BindDataIntoRepeater(referJobs);
        }
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            referJobs = PopulateReferJobs();
            BindDataIntoRepeater(referJobs);
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            referJobs = PopulateReferJobs();
            BindDataIntoRepeater(referJobs);
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            referJobs = PopulateReferJobs();
            BindDataIntoRepeater(referJobs);
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.FromName("White");
        }
    }

    public class ListtoDataTableConverter
    {
        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }
    }
}