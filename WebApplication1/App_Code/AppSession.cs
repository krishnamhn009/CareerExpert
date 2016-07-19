using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.App_Code
{
    public class AppSession
    {
         // **** add your session properties here, e.g like this:
        public string userId { get; set; }
        public string UserName { get; set; }
        // private constructor
        private AppSession()
        {
            this.UserName = string.Empty;
            this.userId = string.Empty;
        }

        // Gets the current session.
        public static AppSession Current
        {
            get
            {
                AppSession session =
                (AppSession)HttpContext.Current.Session["_MySession__"];
                if (session == null)
                {
                    session = new AppSession();
                    HttpContext.Current.Session["__MySession__"] = session;
                }
                return session;
            }
        }
    }
}