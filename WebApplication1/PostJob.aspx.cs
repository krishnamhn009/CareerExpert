using BALLib;
using POCOLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UtilLib;

namespace WebApplication1
{
    public partial class PostJob : System.Web.UI.Page
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
        private static List<string> _cityList = null;
        public static List<string> CityList
        {
            get
            {
                if (_cityList == null)
                    _cityList = new List<string>();
                return _cityList;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void txtNewUserJobLoc_TextChanged(object sender, EventArgs e)
        //{
        //    //calling method and Passing Values  
        //    GetProductMasterDet(txtNewUserJobLoc.Text);
        //}

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetLocation(string prefixText)
        {
            //List<string> lt = new List<string>();
            //lt.Add("Krishna");
            //lt.Add("Dip");
            if (ApplicationSession.Current.Cities.Count == 0)
                new UserBAL().getAllCities();
            if (CityList.Count == 0)
            {
                List<string> cityList = ApplicationSession.Current.Cities.Select(city => city.City).ToList();
                CityList.AddRange(cityList);
            }
            return CityList.FindAll(w => w.ToUpper().Contains(prefixText.ToUpper())).ToList();

        }

        protected void btnJobPost_Click(object sender, EventArgs e)
        {
            string jobTitle = txtJobTitle.Value;
           string  company= txtCompany.Value;
            string  location= txtJobLoc.Text;
            string skills = txtKeySkills.Value;
            string experience = txtJobExp.Value;
            string salary = txtSalary.Value;
            string jobDesc = txtJobDesc.Value;
           DateTime dt= DateTime.Now.AddDays(7);
            string jobExpire=dt.ToString("d/MM/YYYY");
            Jobs job = new Jobs("Y",jobTitle, jobDesc,experience,company,location);
            job.Email = ApplicationSession.Current.user.Email;
            job.JobSkills = skills;
            job.JobExpireDays = 5;
            job.ExpectedCTC = salary;
            if (JobBO.PostJob(job, string.Empty, "N", string.Empty))
                ApplicationSession.Current.Jobs.Clear();
        }
    }
}