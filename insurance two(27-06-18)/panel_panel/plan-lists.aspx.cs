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

public partial class nyksi_panel_product_list : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }
    }
    public void BindCategory()
    {
        try
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            string q = "select * from tblPortfolio order by id desc ";
            SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grdsubcategory.DataSource = dt;
            grdsubcategory.DataBind();
        }
        catch
        {
        }
        finally
        {
            con.Close();
        }
    }
    protected void grdsubcategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdsubcategory.PageIndex = e.NewPageIndex;
       this.BindCategory();
    }
    protected void grdcategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "DELETE FROM tblPortfolio WHERE id=@id";
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = grdsubcategory.Rows[e.RowIndex].Cells[1].Text;
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        BindCategory();
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string s = "select * from tblPortfolio where catname like '%" + txtsearch.Text + "%'";
        SqlCommand cmd = new SqlCommand(s, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        grdsubcategory.DataSource = dt;
        grdsubcategory.DataBind();
    }
 
    protected void lb_Edit_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string str = grdsubcategory.DataKeys[gvrow.RowIndex].Value.ToString();
        

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from tblPortfolio where id=@id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", str);
            cmd.Parameters.AddWithValue("@var", 3);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Deleted');location.href='plan-lists.aspx'", true);
            }

        }
        catch { }
        finally { con.Close(); }
        // this.ModalPopupExtender1.Show();

    }
    protected void grdsubcategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#0071b6';this.style.color='White'");
            //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;this.style.color=this.originalstyle;");
            //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdsubcategory, "Select$" + e.Row.RowIndex);
            //e.Row.Attributes["style"] = "cursor:pointer";
        }  
    }
}