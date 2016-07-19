using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using BALLib;
using POCOLib;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        [ScriptMethod]
        public static bool RegisterUser(string email)
        {
            User user = new User();
            user.Email = email;
            return UserBAL.RegisterUser(user, "", "", "");
            
        }
    }
}