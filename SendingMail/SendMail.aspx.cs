using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Net;

namespace SendingMail
{
    public partial class SendMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendMailTest(string emailAddress,string emailName,)
        {
            var fromAddress = "krishnamhn009@gmail.com";// Gmail Address from where you send the mail
            var toAddress = YourEmail.Text.ToString();
            const string fromPassword = "993434766m";//Password of your gmail address
            string subject = YourSubject.Text.ToString();
            string body = "From: " + YourName.Text + "\n";
            body += "Email: " + YourEmail.Text + "\n";
            body += "Subject: " + YourSubject.Text + "\n";
            body += "Question: \n" + Comments.Text + "\n";
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            smtp.Send(fromAddress, toAddress, subject, body);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SendMailTest();
                lblMsgSend.Text = "Your Comments after sending the mail";
                lblMsgSend.Visible = true;
                YourSubject.Text = "";
                YourEmail.Text = "";
                YourName.Text = "";
                Comments.Text = "";
            }
            catch (Exception) { }
        }

    }
}