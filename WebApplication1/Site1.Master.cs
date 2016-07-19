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
    public partial class Site1 : System.Web.UI.MasterPage
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
                //PopulatePricing();
                if (string.IsNullOrEmpty(ApplicationSession.Current.UserType))
                    ApplicationSession.Current.UserType = Constants.QUERYUSERTYPE;
                string mail = ApplicationSession.Current.user.Email;
                if (!(string.IsNullOrEmpty(mail)) && (!string.IsNullOrWhiteSpace(mail)))
                {
                    string userMail = ApplicationSession.Current.user.Email;
                    nameSection.Visible = true;
                    lblUserName.InnerText = ApplicationSession.Current.user.Name;
                    lblUserName.Visible = true;
                    signup.Visible = false;
                    login.Visible = false;
                    myAccount.Visible = true;
                }
                else
                {
                    nameSection.Visible = false;
                    lblUserName.Visible = false;
                    signup.Visible = true;
                    login.Visible = true;
                    myAccount.Visible = false;
                }
                

            }          
        }

           //void PopulatePricing()
           // {
           //    if (ApplicationSession.Current.Pricing.Count==0)
           //       UserBO.GetAllPricing();            
           //      dlData.DataSource =ApplicationSession.Current.Pricing;
           //      dlData.DataBind();
           // }
            
        }      
       
    }