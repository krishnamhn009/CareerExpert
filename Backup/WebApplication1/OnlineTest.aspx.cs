using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using BALLib;

namespace WebApplication1
{
    public partial class OnlineTest : System.Web.UI.Page
    {
        private UserBAL userBO = null;
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
        //SqlCommand comm = new SqlCommand();
        DataSet ds = new DataSet();
        MySqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CountdownTimer"] == null)
            {
                Session["CountdownTimer"] = new CountDown(TimeSpan.Parse("00:00:50"));
                (Session["CountdownTimer"] as CountDown).Start();
            }


            //if (str.checkSpace((string)Session["que"]))
            //{
                if (!Page.IsPostBack)
                {
                    MultiView1.ActiveViewIndex = 0;
                    string sss = (string)Session["que"];


                    //comm = new SqlCommand("select top 10 ques, option1, option2, option3, option4, correctans from [dbo].[" + (string)Session["que"] + "] order by newid()", conn);
                    ////comm = new SqlCommand("select ", conn);

                    //da = new SqlDataAdapter(comm.CommandText, conn);

                    //...........................................................................................................................................//
                    userBO = new UserBAL();
                    da = userBO.getAllQuestions();
                    DataColumn Id = new DataColumn("Id", typeof(int));
                    Id.ReadOnly = true;
                    Id.Caption = "ID";
                    Id.AllowDBNull = false;
                    Id.Unique = true;
                    Id.AutoIncrement = true;
                    Id.AutoIncrementSeed = 1;
                    Id.AutoIncrementStep = 1;

                    DataColumn ques = new DataColumn("question_desc", typeof(string));
                    DataColumn option1 = new DataColumn("answer1_desc", typeof(string));
                    DataColumn option2 = new DataColumn("answer2_desc", typeof(string));
                    DataColumn option3 = new DataColumn("answer3_desc", typeof(string));
                    DataColumn option4 = new DataColumn("answer4_desc", typeof(string));
                    DataColumn correctans = new DataColumn("correct_ans_id", typeof(string));

                    dt = new DataTable("tabb");
                    dt.Columns.AddRange(new DataColumn[] 
                {
                    Id, ques, option1, option2, option3, option4, correctans 
                });

                    da.Fill(dt);                   
                    Session["datatable"] = dt;
                    dt = ((DataTable)Session["datatable"]);                    
                    GridView1.DataSource = Session["datatable"];
                    GridView1.DataBind();
                }
            //}
            //else
            //{
            //    Server.Transfer("selCat.aspx");

            //}
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            dt = new DataTable();
            dt = ((DataTable)Session["datatable"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = GridView1.PageIndex;
            Dictionary<Int32, string> res = new Dictionary<Int32, string>();
            Label l1 = (Label)GridView1.Rows[0].FindControl("Label1");
            RadioButtonList rbl = (RadioButtonList)GridView1.Rows[0].FindControl("RadioButtonList1");
            ((Dictionary<Int32, string>)res)[Int32.Parse(l1.Text.TrimEnd('.'))] = rbl.SelectedValue;

            try
            {
                Label l2 = (Label)GridView1.Rows[1].FindControl("Label1");

                RadioButtonList rbl2 = (RadioButtonList)GridView1.Rows[1].FindControl("RadioButtonList1");
                ((Dictionary<Int32, string>)res)[Int32.Parse(l2.Text.TrimEnd('.'))] = rbl2.SelectedValue;

                Label l3 = (Label)GridView1.Rows[2].FindControl("Label1");
                RadioButtonList rbl3 = (RadioButtonList)GridView1.Rows[2].FindControl("RadioButtonList1");
                ((Dictionary<Int32, string>)res)[Int32.Parse(l3.Text.TrimEnd('.'))] = rbl3.SelectedValue;
            }
            catch (ArgumentOutOfRangeException) { }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {


            if (Session["CountdownTimer"] != null)
            {
                if (TimeSpan.Compare((Session["CountdownTimer"] as CountDown).TimeLeft, TimeSpan.Zero) > 0)
                {
                    Label3.ForeColor = System.Drawing.Color.Black;
                    Label3.Text = (Session["CountdownTimer"] as CountDown).TimeLeft.ToString();
                }
                else
                {
                    Session["CountdownTimer"] = null;
                    Response.Redirect("rEport.aspx");
                }
            }
        }


        protected string GetID(object ob)
        {
            return DataBinder.Eval(ob, "Id").ToString() + ".";
        }


        public class CountDown
        {
            public TimeSpan TimeLeft;
            System.Threading.Thread thread;
            public CountDown(TimeSpan original)
            {
                this.TimeLeft = original;
            }
            public void Start()
            {
                System.Threading.ThreadStart threadDelegate = delegate
                {
                    while (true)
                    {
                        System.Threading.Thread.Sleep(1000);
                        TimeLeft = TimeLeft.Subtract(TimeSpan.Parse("00:00:01"));
                    }

                };
                thread = new System.Threading.Thread(threadDelegate);
                thread.Start();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = Session["datatable"];
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();// row created->rowdatabound

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (GridView1.PageIndex == GridView1.PageCount - 1)
            {
                if (e.Row.RowType == DataControlRowType.Pager)
                {
                    Button b = (Button)(e.Row.FindControl("Button1"));

                    b.Click += delegate
                    {
                        Session["CountdownTimer"] = null;
                        Response.Redirect("OnlineResult.aspx");
                    };
                    b.Text = "Submit";
                    b.CommandArgument = "";
                    b.CommandName = "";
                }
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rbl = (RadioButtonList)e.Row.FindControl("RadioButtonList1");

                int i = e.Row.DataItemIndex;
                rbl.Items.Add(dt.Rows[i][2].ToString());
                rbl.Items.Add(dt.Rows[i][3].ToString());
                rbl.Items.Add(dt.Rows[i][4].ToString());
                rbl.Items.Add(dt.Rows[i][5].ToString());

            }

        }
    
    }
}