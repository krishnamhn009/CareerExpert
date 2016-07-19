using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
namespace MySqlHelper
{
    public class MySqlConnect
    {
        private MySqlDataAdapter myAdapter;
        private MySqlConnection connection;

        public MySqlConnect()
        {
            myAdapter = new MySqlDataAdapter();
            connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
        }

        /// <method>
        /// Open Database Connection if Closed or Broken
        /// </method>
        private MySqlConnection openConnection()
        {
            try
            {
                if (connection.State == ConnectionState.Closed || connection.State == ConnectionState.Broken)
                {
                    connection.Open();
                   
                }
                return connection;
            }
            catch (Exception ex)

            {
                throw ex;
            }
            
        }

        public DataTable executeSelectQuery(String _query, MySqlParameter[] sqlParameter)
        {
            MySqlCommand myCommand = new MySqlCommand();
            DataTable dataTable = new DataTable();
            dataTable = null;
            DataSet ds = new DataSet();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.SelectCommand = myCommand;
              //  myCommand.ExecuteNonQuery();
              
                myAdapter.Fill(ds);
                dataTable = ds.Tables[0];
            }
            catch (MySqlException e)
            {
                Console.Write("Error - Connection.executeSelectQuery - Query: " + _query + " \nException: " + e.StackTrace.ToString());

                return null;
            }
            finally
            {

            }
            return dataTable;
        }

        public DataSet executeSelectMultipleQuery(String _query, MySqlParameter[] sqlParameter)
        {
            MySqlCommand myCommand = new MySqlCommand();
            //DataTable dataTable = new DataTable();
            //dataTable = null;
            DataSet ds = new DataSet();          
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.SelectCommand = myCommand;
                //  myCommand.ExecuteNonQuery();
                myAdapter.Fill(ds);                
            }
            catch (MySqlException e)
            {
                Console.Write("Error - Connection.executeSelectQuery - Query: " + _query + " \nException: " + e.StackTrace.ToString());

                return null;
            }
            finally
            {

            }
            return ds;
        }

        /// <method>
        /// Insert Query
        /// </method>
        public bool executeInsertQuery(String _query, MySqlParameter[] sqlParameter)
        {
            MySqlCommand myCommand = new MySqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.InsertCommand = myCommand;
                
                if (myCommand.ExecuteNonQuery() > 0)
                    return true;
                else
                    return false;
            }
            catch (MySqlException e)
            {
                Console.Write("Error - Connection.executeInsertQuery - Query: " + _query + " \nException: \n" + e.StackTrace.ToString());

                return false;
            }
            //finally
            //{
            //}


        }

        /// <method>
        /// Update Query
        /// </method>
        public bool executeUpdateQuery(String _query, MySqlParameter[] sqlParameter)
        {
            MySqlCommand myCommand = new MySqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.UpdateCommand = myCommand;
                myCommand.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.Write("Error - Connection.executeUpdateQuery - Query:" + _query + " \nException: " + e.StackTrace.ToString());
                return false;
            }
            finally
            {
            }
            return true;
        }

        /// <method>
        /// dELETE Query
        /// </method>
        public bool executeDeleteQuery(String _query, MySqlParameter[] sqlParameter)
        {
            MySqlCommand myCommand = new MySqlCommand();
            try
            {
                myCommand.Connection = openConnection();
                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = _query;
                myCommand.Parameters.AddRange(sqlParameter);
                myAdapter.DeleteCommand = myCommand;
                myCommand.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.Write("Error - Connection.executeUpdateQuery - Query:" + _query + " \nException: " + e.StackTrace.ToString());
                return false;
            }
            finally
            {
            }
            return true;
        }
    }
}
