using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using POCOLib;
using BALLib;

namespace WebApplication1
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCallback_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Name = TextBoxName.Text.ToString();
            user.Email = TextBoxMail.Text.ToString();
            user.Mobile = TextMNo.Text.ToString();
            user.Qualification = TextBoxQual.Text.ToString();
            user.Query = TextQuery.Text.ToString();
            //user.Add.State = DropDownListState.SelectedValue.ToString();
            user.UserType = "SU";
            UserBAL _userBAL = new UserBAL();
            bool result= _userBAL.UserQury(user);



        }
    }
}
