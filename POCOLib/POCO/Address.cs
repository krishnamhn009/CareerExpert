using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POCOLib
{
   public  class Address
    {
       public Address()
       {
          // this.City = "bokaro";
           //this.State = "JHARKHAND";
           //this.Country = "INDIA";
       }

       public Address(string cityId,string city,string location)
       {
           this.Locality = cityId;
           this.City = city;
           this.Location = location;
           //this.State = state;
           //this.Country = "INDIA";
       }
        public string Locality
        { set; get; }
        public string Location
        { set; get; }
        public string City
        { set; get; }
        //public string State
        //{ set; get; }
        //public string Country
        //{ set; get; }

    }
}
