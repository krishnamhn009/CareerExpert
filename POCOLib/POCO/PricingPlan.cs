using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POCOLib
{
    public class PricingPlan
    {
         private string _planId;
        private string _planName;
        private string _planPrice;
        private string _planDuration;
        private string _planDesc;
        private string _planJobs;
        public PricingPlan()
        { }
        public PricingPlan(string planId, string planName, string planPrice, string planDuration, string planDesc, string planJobs)
       {
           this.PlanId = planId;
           this.PlanName = planName;
           this.PlanPrice = planPrice;
           this.PlanDuration = planDuration;
            this.PlanDesc = planDesc;
            this.PlanJobs = planJobs;
       }
       
        public string PlanExpireDate
        { set; get; }
        public Int32 ReferralsLeft
        { set; get; }
        public string JobsAppliedCount
        { set; get; }
       
        public string PlanId
        {
            get
            {
                if (_planId != null)
                    return _planId;
                else
                    return string.Empty;

            }
            set { _planId = value; }
        }
        public string PlanName
        {
            get
            {
                if (_planName != null)
                    return _planName;
                else
                    return string.Empty;

            }
            set { _planName = value; }
        }
        public string PlanPrice
        {
            get
            {
                if (_planPrice != null)
                    return _planPrice;
                else
                    return string.Empty;

            }
            set { _planPrice = value; }
        }
        public string PlanDuration
        {
            get
            {
                if (_planDuration != null)
                    return _planDuration;
                else
                    return string.Empty;

            }
            set { _planDuration = value; }
        }
        public string PlanDesc
        {
            get
            {
                if (_planDesc != null)
                    return _planDesc;
                else
                    return string.Empty;

            }
            set { _planDesc = value; }
        }
        public string PlanJobs
        {
            get
            {
                if (_planJobs != null)
                    return _planJobs;
                else
                    return string.Empty;

            }
            set { _planJobs = value; }
        }
       
    }
}
