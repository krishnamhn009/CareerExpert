using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using CCA.Util;
using BALLib;
using POCOLib;
using UtilLib;

namespace WebApplication1
{
    public partial class PricingPlan3 : System.Web.UI.Page
    {
        string responseColName = string.Empty;
        string responseColValue = string.Empty;
        string orderStatus = string.Empty;

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
            string workingKey = System.Configuration.ConfigurationManager.AppSettings["WorkingKey"].ToString();//put in the 32bit alpha numeric key in the quotes provided here
            CCACrypto ccaCrypto = new CCACrypto();
            string encResponse = ccaCrypto.Decrypt(Request.Form["encResp"], workingKey);
            NameValueCollection Params = new NameValueCollection();
            string[] segments = encResponse.Split('&');
            foreach (string seg in segments)
            {
                string[] parts = seg.Split('=');
                if (parts.Length > 0)
                {
                    string Key = parts[0].Trim();
                    string Value = parts[1].Trim();
                    Params.Add(Key, Value);
                }
            }

            for (int i = 0; i < Params.Count; i++)
            {
                //Response.Write(Params.Keys[i] + " = " + Params[i] + "<br>");
                responseColName = responseColName + Params.Keys[i] + ",";
                responseColValue = responseColValue + Params[i] + ",";
                if (Params.Keys[i].ToLower() == "order_status")
                    orderStatus = Params[i].ToUpper().ToString();
            }

            responseColName = responseColName.Substring(0, responseColName.Length - 2);
            responseColValue = responseColValue.Substring(0, responseColValue.Length - 2);
            if (orderStatus== "SUCCESS")
            { 
                if (ApplyUserPlan(ApplicationSession.Current.user.Email, ApplicationSession.Current.user.UserPricingPlan.PlanId, responseColName, responseColValue))
                {
                    Response.Redirect("~/my-dashboard");
                }
            }
            Response.Redirect("~/my-dashboard");
        }
        bool ApplyUserPlan(string email, string planId, string responseColName, string responseColValue)
        {

            return UserBO.ApplyUserPlan(email, planId, responseColName, responseColValue);
        }
    }

    

}