using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
namespace MySqlHelper
{
    public class MySqlConnect
    {
        private MySqlConnection connection;

        public MySqlConnect()
        {
            connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
        }
    }
}
