﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;
using POCOLib;
using UtilLib;
using System.Text.RegularExpressions;
using CCA.Util;

namespace WebApplication1
{
    public partial class PricingPlan : System.Web.UI.Page
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
            
            Response.Redirect("~/pricing-plan2");
            //if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email) && Request.QueryString.Keys.Count > 0)
            //{
            //    if (!string.IsNullOrEmpty(ApplicationSession.Current.user.Email))
            //    {
            //        string planId = Request.QueryString.GetValues(0)[0].ToString();
            //        if (ApplyUserPlan(ApplicationSession.Current.user.Email, planId))
            //        {
                        
            //        }
            //    }
            //    else
            //        Response.Redirect("~/register-with-us");
            //}
        }

        //bool ApplyUserPlan(string email, string planId)
        //{

        //    return UserBO.ApplyUserPlan(email, planId);
        //}
    }
}