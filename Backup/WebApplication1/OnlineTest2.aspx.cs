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
    public partial class OnlineTest2 : System.Web.UI.Page
    {
        private JobsBAL jobsBO = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                populateJobs();
        }

        void populateJobs()
        {
            List<Jobs> job = new List<Jobs>();
            if (ApplicationSession.Current.Jobs.Count > 0)
                job.AddRange(ApplicationSession.Current.Jobs);
            else
            {
                jobsBO = new JobsBAL();
                job = jobsBO.getAllJobs();
            }

            Repeater1.DataSource = job;

            Repeater1.DataBind();
        }
    }
}