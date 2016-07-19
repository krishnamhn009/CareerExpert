using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BALLib;

namespace WebApplication1
{
    public partial class Feedback : System.Web.UI.Page
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

        }

        protected void Submit_Complaint(object sender, EventArgs e)
        {
            string emailId = txtFeedEmail.Text.ToString();
            string department = complaintto.Value.ToString();
            string feedback = complaint.Value;

            if (UserBO.InsertFeedback(emailId, department, feedback))
            {                
                FeedbackStatus.Visible = true;               
            }

            txtFeedEmail.Text = string.Empty;
            complaintto.SelectedIndex = 0;
            complaint.Value = string.Empty;
        }
    }
}