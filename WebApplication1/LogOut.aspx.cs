using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UtilLib;

namespace WebApplication1
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           ApplicationSession.Current.user.Email = null;
           ApplicationSession.Current.user = null;                        
            Session.Abandon();
            HttpContext.Current.Session["__MySession__"] = null;
           
            //ApplicationSession.Current.Companies  = null;
            //ApplicationSession.Current.Cities = null;
            //ApplicationSession.Current.Careers = null;
            //ApplicationSession.Current.Email = null;
            //ApplicationSession.Current.Experience = null;
            //ApplicationSession.Current.Institutes = null;
            //ApplicationSession.Current.Jobs = null;
            //ApplicationSession.Current.Marks = null;
            //ApplicationSession.Current.OfcEmail = null;
           // Response.Redirect("Default.aspx");
            Response.Redirect("~/home");
        }
    }
}