﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class nyksi_panel_banner : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    string strfile1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["insurance"] != null)
            {
              

                grdcategory.DataSource = bind_grid();
                grdcategory.DataBind();
                
            }
            else { Response.Redirect("../login/Default.aspx"); }
        }
    }
    public DataTable bind_grid()
    {
        SqlCommand cmd = new SqlCommand("select *from tblService_Plan", con);
        cmd.CommandType = CommandType.Text;
       // cmd.Parameters.AddWithValue("@var", 2);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
  
    protected void lb_Edit_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string str = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();
       
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblService_Plan where id=@id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", str);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Deleted');location.href='plan-list.aspx'", true);
            }

        }
        catch { }
        finally { con.Close(); }
        // this.ModalPopupExtender1.Show();

    }
   
}