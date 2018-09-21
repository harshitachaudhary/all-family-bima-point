using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.IO;

public partial class nyksi_panel_Upload_Main_Product : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = all.showpagecontentP("address");
            if(dt.Rows.Count >0)
            {
                txtaddress.Content = dt.Rows[0]["content"].ToString();
                txtmobileno.Content = dt.Rows[0]["heading1"].ToString();
                txtemailid.Content = dt.Rows[0]["heading2"].ToString();
            }
            
        }
    }
  
    protected void Button1x_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_tblallpages", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@typee", "address");
            cmd.Parameters.AddWithValue("@heading1", txtmobileno.Content);
            cmd.Parameters.AddWithValue("@heading2", txtemailid.Content);
            cmd.Parameters.AddWithValue("@content", txtaddress.Content);
            int i = cmd.ExecuteNonQuery();
            if(i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Updated');", true);
            }
        }
    catch { }
      finally { 
    con.Close();
}
    }


   
} 