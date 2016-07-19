using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mail;
using System.Net;
using System.Configuration;
using POCOLib;
namespace UtilLib
{
   public class SendEmail
    {
       static string careerMailId = System.Configuration.ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
       static string careerMailPassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
         public static bool SendUserMail(User user)
        {
            string fromAddress = System.Configuration.ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
            string fromPassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
            var toAddress = System.Configuration.ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
            var UserAddress = user.Email;
            string subject = Constants.MailSubject;
            List<string> mailBody = new List<string>();
            string bodyAdmin=BuildAdminMail(user);
            string userBody= BuildUserMail(user);

            SendUser(fromAddress, fromPassword, toAddress, subject, bodyAdmin);
            SendUser(fromAddress, fromPassword, UserAddress, subject, userBody);
            return true;
        }

         private static void SendUser(string fromAddress, string fromPassword, string UserAddress, string subject, string body)
         {
             var smtp = new System.Net.Mail.SmtpClient();
             {
                 smtp.Host = System.Configuration.ConfigurationManager.AppSettings["HostAddress"].ToString();
                 smtp.Port = 587;
                 smtp.EnableSsl = true;
                 smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                 smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                 smtp.Timeout = 20000;
             }
             smtp.Send(fromAddress, UserAddress, subject, body);
         }

         public static void ReceiveJobEmail(User user,Jobs job)
         {

             string fromAddress = System.Configuration.ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
             string fromPassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
             var toAddress = System.Configuration.ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
             string subject = Constants.JobMailSubject;
             List<string> mailBody = new List<string>();
             string bodyAdmin = BuildPostedJobAdminMail(user, job);             
             var smtp = new System.Net.Mail.SmtpClient();
             {
                 smtp.Host = System.Configuration.ConfigurationManager.AppSettings["HostAddress"].ToString();
                 smtp.Port = 587;
                 smtp.EnableSsl = true;
                 smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                 smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                 smtp.Timeout = 20000;
             }
             smtp.Send(fromAddress, toAddress, subject, bodyAdmin);
             
         }

         public static void SendOTP(string OTP, string ToMail)
        {
             string body="Your OTP is : "+OTP+"/n ";
             body += "Dont share with anyone";
                  body += Constants.THANKSIGN;
             SendUser(careerMailId, careerMailPassword, ToMail, Constants.MailSubject, body);
        }

         public static string BuildPostedJobAdminMail(User user, Jobs job)
         {

             string body = Constants.HI + " Admins" + "\n";
             body += "Name: " + user.Name + "\n";
             body += "Ph no: " + user.Mobile + "\n";
             body += "Email: " + user.Email + "\n";
             body += "Job Title: " + job.JobTitle + "\n";
             body += "Job Experience: " + job.JobExperience + "\n";
             body += "Job Location: " + job.Location + "\n";
             body += "Job Company: " + job.Company + "\n";
             body += "Job Desc: " + job.JobDesc + "\n";             
             body += Constants.THANKSIGN;
             return body;

         }

         public static string BuildAdminMail(User user)
         {
           
             string body = Constants.HI + " Admins" +  "\n";
             body +="Name: "+ user.Name  + "\n";
             body += "Email: " + user.Email + "\n";
             body += "Ph no: "+user.Mobile + "\n";
             body += "Address: "+user.Add.City + "\n";
             if (!string.IsNullOrEmpty(user.CareerField))
             { body += "Career: " + user.CareerField + "\n"; }
             body += "Qualification: "+user.Qualification + "\n";
             body += "Query: "+user.Query + "\n";
             body += Constants.THANKSIGN;
             return body;
           
         }

         public static string BuildUserMail( User user)
         {

             string body = Constants.HI + " " + user.Name + "\n";
             body += Constants.QUERY + "\n";
             body += Constants.THANKSIGN;
             return body;

         }

        public static string BuildAppliedUserJobMail(String UserName)
        {

            string body = Constants.HI + " " + UserName + "\n";
            body += Constants.APPLIEDUSERJOB + "\n";
            body += Constants.THANKSIGN;
            return body;

        }

        public static string BuildAppliedJobAdminMail(String emailId, String UserName, String JobTitle)
        {

            string body = Constants.HI + " Admins" + "\n";
            body += "Name: " + UserName + "\n";
            body += "Email: " + emailId + "\n";
            body += "Has applied for Job Title: " + JobTitle + "\n";                     
            body += Constants.THANKSIGN;
            return body;

        }

        public static bool SendUserResetMail(User user)
         {
             string fromAddress = System.Configuration.ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
             string fromPassword = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString();
             var toAddress = System.Configuration.ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
             var UserAddress = user.Email;
             string subject = Constants.MailSubject;
             List<string> mailBody = new List<string>();             
             string userBody = BuildUserResetMail(user);

             SendUser(fromAddress, fromPassword, UserAddress, subject, userBody);
             return true;
         }

         public static string BuildUserResetMail(User user)
         {

             string body = Constants.HI + " " + user.Name + "\n";
             body += Constants.RESETQUERY + " " + user.Password  + "\n";
             body += Constants.LINKQUERY + "\n";
             body += Constants.THANKSIGN;
             return body;

         }

    }
}
