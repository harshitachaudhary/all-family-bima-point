using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.IO;

public partial class frontmainmaster : System.Web.UI.MasterPage
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = all.showpagecontentP("address");
            if (dt.Rows.Count > 0)
            {
                lbladdress.Text = dt.Rows[0]["content"].ToString();
                //lbladdress1.Text = dt.Rows[0]["content"].ToString();
                lblphone.Text = dt.Rows[0]["heading1"].ToString();
                lblphone1.Text = dt.Rows[0]["heading1"].ToString();
                lblemail.Text = dt.Rows[0]["heading2"].ToString();
                lblemail1.Text = dt.Rows[0]["heading2"].ToString();
            }
        }
    }
    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    SqlCommand cmd = new SqlCommand("insert into tblquery(name,email,phone,comment)values(@name,@email,@phone,@comment)", con);
    //    cmd.CommandType = CommandType.Text;
    //    cmd.Parameters.AddWithValue("@name", txtname.Value);
    //    cmd.Parameters.AddWithValue("@email", txtemail.Value);

    //    cmd.Parameters.AddWithValue("@phone", txtsubject.Value);

    //    cmd.Parameters.AddWithValue("@comment", txtcomment.Value);

    //    try
    //    {
    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        if (i > 0)
    //        {
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Submited');", true);
    //        }
    //    }
    //    catch { }
    //    finally { con.Close(); con.Dispose(); }



    //}
}
