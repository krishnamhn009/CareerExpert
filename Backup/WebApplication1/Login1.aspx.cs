using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using POCOLib;
using BALLib;
using UtilLib;
using System.Web.Services;
using System.Web.Script.Services;
namespace WebApplication1
{
    public partial class Login1 : System.Web.UI.Page
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
                if (ApplicationSession.Current.UserType != null && Request.Form.HasKeys())
                {
                    string uId = Request.Form.GetValues(0)[0].ToString();
                    string pId = Request.Form.GetValues(1)[0].ToString();
                    User user = new User(uId, pId);
                    if (ValidateUser(user))
                    {
                        ApplicationSession.Current.user.Email = uId;
                        //Response.Redirect("MyAccount.aspx");
                        if (ApplicationSession.Current.user.UserType == Constants.STUDENT)
                            Response.Redirect("~/student-dashboard");
                        else
                            Response.Redirect("~/my-dashboard");
                    }
                    else
                        loginStatus.Visible = true;
                    lblLogin.Visible = true;
                    lblReset.Visible = false;
                    ResetSuccess.Visible = false;
                    RegisterSuccess.Visible = false;
                    lblChange.Visible = false;
                    ChangePwdSuccess.Visible = false;
                    changePass.Visible = false;
                    //lblRegister.Visible = false;
                }



                else if (Request.QueryString.Keys.Count > 0)
                {
                    if (Request.QueryString.GetValues(0)[0].Equals("Y"))
                    {
                        resetPass.Visible = true;
                        loginStatus.Visible = false;
                        idPass.Visible = false;
                        btnLogin.Visible = false;
                        lblForgetPass.Visible = false;
                        lblLogin.Visible = false;
                        lblReset.Visible = true;
                        ResetSuccess.Visible = false;
                        RegisterSuccess.Visible = false;
                        lblChange.Visible = false;
                        ChangePwdSuccess.Visible = false;
                        changePass.Visible = false;
                        //lblRegister.Visible = false;
                    }
                    else if (Request.QueryString.GetValues(0)[0].Equals("Social"))
                    {
                        resetPass.Visible = false;
                        loginStatus.Visible = false;
                        idPass.Visible = true;
                        btnLogin.Visible = true;
                        lblForgetPass.Visible = true;
                        lblLogin.Visible = true;
                        lblReset.Visible = false;
                        ResetSuccess.Visible = false;
                        RegisterSuccess.Visible = false;
                        lblChange.Visible = false;
                        ChangePwdSuccess.Visible = false;
                        changePass.Visible = false;
                        //lblRegister.Visible = false;
                   
                    }
                    else if (Request.QueryString["login"].ToUpper() == Constants.REGISTER)
                    {
                        loginStatus.Visible = false;
                        resetPass.Visible = false;
                        lblLogin.Visible = true;
                        lblReset.Visible = false;
                        ResetStatus.Visible = false;
                        ResetSuccess.Visible = false;
                        RegisterSuccess.Visible = true;
                        lblChange.Visible = false;
                        ChangePwdSuccess.Visible = false;
                        changePass.Visible = false;
                        //lblRegister.Visible = true;
                        txtEmail.Text = ApplicationSession.Current.user.Email.ToString();
                        ApplicationSession.Current.user = null;
                    }
                    else if (Request.QueryString["login"].ToUpper() == Constants.CHANGEPWD)
                    {
                        loginStatus.Visible = false;
                        resetPass.Visible = false;
                        lblLogin.Visible = false;
                        lblReset.Visible = false;
                        ResetStatus.Visible = false;
                        ResetSuccess.Visible = false;
                        RegisterSuccess.Visible = false;
                        lblChange.Visible = true;
                        ChangePwdSuccess.Visible = false;
                        btnLogin.Visible = false;
                        changePass.Visible = true;
                        idEmail.Visible = false;
                        //lblRegister.Visible = true;
                        //txtEmail.Text = ApplicationSession.Current.user.Email.ToString();
                        
                    }
                }
                else
                {
                    loginStatus.Visible = false;
                    resetPass.Visible = false;
                    lblLogin.Visible = true;
                    lblReset.Visible = false;
                    ResetStatus.Visible = false;
                    ResetSuccess.Visible = false;
                    RegisterSuccess.Visible = false;
                    lblChange.Visible = false;
                    ChangePwdSuccess.Visible = false;
                    changePass.Visible = false;
                    //lblRegister.Visible = false;
                }
            }            
        }

        bool ValidateUser(User user)
        {            
            return UserBO.ValidateUser(user);
            
        }
        bool ResetPass(User user, string userMessage, string adminMessage, string mailSubject)
        {
            return UserBO.ResetPass(user, userMessage, adminMessage, mailSubject);
        }

        bool ChangePass(User user)
        {
            return UserBO.ChangePass(user);
        }

        protected void ChangePwd_Click(object sender, EventArgs e)
        {
            string userId = ApplicationSession.Current.user.Email;
            string pass = txtUserPaswd.Value;
            User user = new User(userId, pass);
            if (ChangePass(user))
            {
                ApplicationSession.Current.user.Email = userId;
                //SendEmail.SendUserResetMail(ApplicationSession.Current.user);
                loginStatus.Visible = false;
                resetPass.Visible = false;
                lblLogin.Visible = false;
                lblReset.Visible = false;
                ResetStatus.Visible = false;
                ResetSuccess.Visible = false;
                RegisterSuccess.Visible = false;
                lblChange.Visible = true;
                ChangePwdSuccess.Visible = true;
                btnLogin.Visible = false;
                changePass.Visible = true;
                idEmail.Visible = false;
                txtUserPaswd.Value = string.Empty;
            }
            else
            {
                loginStatus.Visible = false;
                resetPass.Visible = false;
                lblLogin.Visible = false;
                lblReset.Visible = false;
                ResetStatus.Visible = false;
                ResetSuccess.Visible = false;
                RegisterSuccess.Visible = false;
                lblChange.Visible = true;
                ChangePwdSuccess.Visible = false;
                btnLogin.Visible = false;
                changePass.Visible = true;
                idEmail.Visible = false;
            }
            

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string userId = txtEmail.Text.ToString();
            string pass = txtUserPaswd.Value.ToString();
            User user = new User(userId, pass);
            if (ValidateUser(user))
                //Response.Redirect("MyAccount.aspx");
                if (ApplicationSession.Current.user.UserType == Constants.STUDENT)
                    Response.Redirect("~/student-dashboard");
            else
                Response.Redirect("~/my-dashboard");
            else
            {
                loginStatus.Visible = true;
                ResetStatus.Visible = false;
                ResetSuccess.Visible = false;
                RegisterSuccess.Visible = false;
                lblChange.Visible = false;
                ChangePwdSuccess.Visible = false;
                changePass.Visible = false;
            }
                
           
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            string userId = txtEmail.Text.ToString();
            string pass = string.Empty;
            User user = new User(userId, pass);
            string userMessage = SendEmail.BuildUserResetMail(user);
            if (ResetPass(user, userMessage, string.Empty, Constants.MailSubject))
            {
                ApplicationSession.Current.user.Email = userId;
                //Mailing Windows Service
                //SendEmail.SendUserResetMail(ApplicationSession.Current.user);                
                ResetSuccess.Visible = true;
                loginStatus.Visible = false;
                ResetStatus.Visible = false;
                lblLogin.Visible = true;
                lblReset.Visible = false;
                RegisterSuccess.Visible = false;
                lblChange.Visible = false;
                txtEmail.Text = string.Empty;
                ChangePwdSuccess.Visible = false;
                changePass.Visible = false;
            }                
            else
            {
                loginStatus.Visible = false;
                ResetStatus.Visible = true;
                ResetSuccess.Visible = false;
                RegisterSuccess.Visible = false;
                lblChange.Visible = false;
                ChangePwdSuccess.Visible = false;
                changePass.Visible = false;
            }
            ApplicationSession.Current.user = null;

        }

        [WebMethod]
        [ScriptMethod]
        public static bool RegisterUser(string email, string name, string location, string company, string joinDate)
        {
            bool result=false;
            User user = new User();
            user.Email = email;           
            //UserBAL.GetUserDetail(email);
            //if (string.IsNullOrEmpty(ApplicationSession.Current.user.Name))
            //{
            //    user.Name = name;
            //}
            //if (string.IsNullOrEmpty(ApplicationSession.Current.user.Add.Location))            
            //{
            //    user.Add.Location = location;
            //}
            //if (string.IsNullOrEmpty(ApplicationSession.Current.user.Company))
            //{
            //    user.Company = company;
            //}
            //if (string.IsNullOrEmpty(ApplicationSession.Current.user.Experience))
            //{              
            //    user.Experience = (DateTime.Now.Year - Convert.ToInt32(joinDate)).ToString();                
            //}
            string exp = (DateTime.Now.Year - Convert.ToInt32(joinDate)).ToString();  
            result = UserBAL.LoginLinkedInUser(email, name, location, company, exp);
            if (result)
            {
                ApplicationSession.Current.user = new User(user);
                ApplicationSession.Current.user.Email = email;                
                //ApplicationSession.Current.user.Email = email;
                //ApplicationSession.Current.UserName = name;
                //ApplicationSession.Current.user.Add.City = location;
                //ApplicationSession.Current.user.Company = company;
                //ApplicationSession.Current.user.Experience = exp;
            }
            return result;

        }
    }
}