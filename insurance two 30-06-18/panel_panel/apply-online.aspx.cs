using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class panel_panel_contact : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT *FROM tbldocument order by id desc", con);
        cmd.CommandType = CommandType.Text;
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
            SqlCommand cmd = new SqlCommand("delete from tbldocument where id=@id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", str);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Successfully Deleted');location.href='apply-online.aspx'", true);
            }

        }
        catch { }
        finally { con.Close(); }
        // this.ModalPopupExtender1.Show();

    }
    protected void grdcategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#cbd1db';this.style.color='White'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;this.style.color=this.originalstyle;");
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdcategory, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }
    protected void lnkIdProof_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string id = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("Select idproof_ from tbldocument where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Download(dt.Rows[0]["idproof_"].ToString());
        }
    }
    protected void lnkAddressProof_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string id = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("Select addressproof_ from tbldocument where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Download(dt.Rows[0]["addressproof_"].ToString());
        }
    }
    protected void lnkDOBProof_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string id = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("Select dobproof_ from tbldocument where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Download(dt.Rows[0]["dobproof_"].ToString());
        }
    }
    protected void lnkPhotoProof_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string id = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("Select photu_ from tbldocument where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Download(dt.Rows[0]["photu_"].ToString());
        }
    }
    protected void lnkOtherDocumentProof_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string id = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("Select otherdocument_ from tbldocument where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Download(dt.Rows[0]["otherdocument_"].ToString());
        }
    }

    public void Download(string downloadPath)
    {
        string filename = downloadPath;
        if (filename != "")
        {
            string path = Server.MapPath(filename);
            System.IO.FileInfo file = new System.IO.FileInfo(path);
            if (file.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }
            else
            {
                Response.Write("This file does not exist.");
            }
        }
    }
}