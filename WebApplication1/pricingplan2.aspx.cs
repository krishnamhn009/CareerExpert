using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CCA.Util;
using System.Configuration;
using BALLib;
using POCOLib;
using UtilLib;
using System.Text;

namespace WebApplication1
{
    public partial class pricingplan2 : System.Web.UI.Page
    {
        CCACrypto ccaCrypto = new CCACrypto();
        string workingKey = System.Configuration.ConfigurationManager.AppSettings["WorkingKey"].ToString();//put in the 32bit alpha numeric key in the quotes provided here 	
        string ccaRequest = "";
        public string strEncRequest = "";
        public string strAccessCode = System.Configuration.ConfigurationManager.AppSettings["AccessCode"].ToString();// put the access key in the quotes provided here.
        public string merchantId = System.Configuration.ConfigurationManager.AppSettings["MerchantId"].ToString();// put the access key in the quotes provided here.
        public string currency = System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString();// put the access key in the quotes provided here.
        public string language = System.Configuration.ConfigurationManager.AppSettings["Language"].ToString();// put the access key in the quotes provided here.
        public string redirectUrl = System.Configuration.ConfigurationManager.AppSettings["RedirectUrl"].ToString();// put the access key in the quotes provided here.
        public string cancelUrl = System.Configuration.ConfigurationManager.AppSettings["CancelUrl"].ToString();// put the access key in the quotes provided here.

        

         protected void Page_Load(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email) && Request.QueryString.Keys.Count > 0)
            {
                if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email))
                {
                    string planPrice = string.Empty;
                    string planId = Request.QueryString.GetValues(0)[0].ToString();
                    ApplicationSession.Current.user.UserPricingPlan.PlanId = planId;
                    
                    if (planId == "1")                    
                        planPrice = "499";
                    else if (planId == "2")
                        planPrice = "799";
                    else if (planId == "3")
                        planPrice = "1299";
                    //string tid = DateTime.Now.ToString();
                    string orderId = GenerateRandomNumber(15);

                    Dictionary<string, PricingData> pricingInfo = new Dictionary<string, PricingData>();

                    //PricingData pr1 = new PricingData("tid", tid);
                    PricingData pr2 = new PricingData("merchant_id", merchantId);
                    PricingData pr3 = new PricingData("order_id", orderId);
                    PricingData pr4 = new PricingData("currency", currency);
                    PricingData pr5 = new PricingData("amount", planPrice);
                    PricingData pr6 = new PricingData("redirect_url", redirectUrl);
                    PricingData pr7 = new PricingData("cancel_url", cancelUrl);
                    PricingData pr8 = new PricingData("language", language);
                    PricingData pr9 = new PricingData("customer_identifier", ApplicationSession.Current.user.Email);
                    //pricingInfo.Add(pr1.pricingId, pr1);
                    pricingInfo.Add(pr2.pricingId, pr2);
                    pricingInfo.Add(pr3.pricingId, pr3);
                    pricingInfo.Add(pr4.pricingId, pr4);
                    pricingInfo.Add(pr5.pricingId, pr5);
                    pricingInfo.Add(pr6.pricingId, pr6);
                    pricingInfo.Add(pr7.pricingId, pr7);
                    pricingInfo.Add(pr8.pricingId, pr8);
                    pricingInfo.Add(pr9.pricingId, pr9);
                    if (!IsPostBack)
                    {
                        foreach (KeyValuePair<string, PricingData> entry in pricingInfo)
                        {
                            ccaRequest = ccaRequest + entry.Key + "=" + entry.Value.pricingValue + "&";
                        }
                        strEncRequest = ccaCrypto.Encrypt(ccaRequest, workingKey);
                    }
                }
                else
                    Response.Redirect("~/register-with-us");
            }
             else
                    Response.Redirect("~/register-with-us");
            
       
    }

       
        static Random random = new Random();

        static string GenerateRandomNumber(int count)
        {
            StringBuilder builder = new StringBuilder();

            for (int i = 0; i < count; i++)
            {
                int number = random.Next(10);
                builder.Append(number);
            }

            return builder.ToString();
        }

    }

   

    public class PricingData
    {
        public string pricingId;
        public readonly string pricingValue;
        public PricingData(string pricingId, string pricingValue)
        {
            this.pricingId = pricingId;
            this.pricingValue = pricingValue;
        }

    }
}