using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using POCOLib;

namespace BALLib
{
    class AppSessions
    {
        private List<Address> _cities = null;
        public List<Address> Cities
        {
            get
            { return this._cities; }
          

            set { this._cities = value; }
        }
    }
}
