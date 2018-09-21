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
using System.Drawing;

public partial class nyksi_panel_Upload_Main_Product : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    string strfile1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            txtheading.Text = all.showpagecontent("homeservices");
            BindEmployeeDetails();
        }
    }
  
  

    protected void BindEmployeeDetails()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from tblhomeservices", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvDetails.DataSource = ds;
            gvDetails.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gvDetails.DataSource = ds;
            gvDetails.DataBind();
            int columncount = gvDetails.Rows[0].Cells.Count;
            gvDetails.Rows[0].Cells.Clear();
            gvDetails.Rows[0].Cells.Add(new TableCell());
            gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
            gvDetails.Rows[0].Cells[0].Text = "No Records Found";
        }
    }
    protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDetails.EditIndex = e.NewEditIndex;
        BindEmployeeDetails();
    }
    protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());
       // string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();

        TextBox txtheading = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txteditheading");
        TextBox txtdesig = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txteditdegisnation");
        TextBox txtcity = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtcity");
        //Label lblimg1 = (Label)gvDetails.Rows[e.RowIndex].FindControl("lblimg");

        //FileUpload FileUpload1 = (FileUpload)gvDetails.Rows[e.RowIndex].FindControl("fileuploadedit");

        ClassDate s = new ClassDate();

       
        //string datee = s.date();
        //if (FileUpload1.HasFile == true)
        //{
        //    //==== Get file name without its extension.
        //    string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
        //    string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
        //    fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
        //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
        //    strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
        //}
        //else { strfile1 = lblimg1.Text; }


        
        con.Open();
        SqlCommand cmd = new SqlCommand("proc_tblhomeservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@icon", txtheading.Text);
        cmd.Parameters.AddWithValue("@servicename", txtdesig.Text);
        cmd.Parameters.AddWithValue("@desc_", txtcity.Text);
        //cmd.Parameters.AddWithValue("@img", strfile1);
        cmd.Parameters.AddWithValue("@id", userid);
        cmd.Parameters.AddWithValue("@var", "upda");
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.ForeColor = Color.Green;
        lblresult.Text = userid + " Details Updated successfully";
        gvDetails.EditIndex = -1;
        BindEmployeeDetails();
    }
    protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDetails.EditIndex = -1;
        BindEmployeeDetails();
    }
    protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["id"].ToString());
       // string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("proc_tblhomeservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@id", userid);
        cmd.Parameters.AddWithValue("@var", "del");
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            BindEmployeeDetails();
            lblresult.ForeColor = Color.Red;
            lblresult.Text = userid + " details deleted successfully";
        }
    }
    protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtUsrname = (TextBox)gvDetails.FooterRow.FindControl("txtftrusrname");
            TextBox txtdesig = (TextBox)gvDetails.FooterRow.FindControl("txtftdegisnation");
            TextBox txtCity = (TextBox)gvDetails.FooterRow.FindControl("txtftrcity");
            
            //FileUpload FileUpload1 = (FileUpload)gvDetails.FooterRow.FindControl("fileuploadfooter");


            ClassDate s = new ClassDate();
            //string datee = s.date();
            ////==== Get file name without its extension.
            //string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
            //string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
            //fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
            //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
            //strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;


            con.Open();
            SqlCommand cmd = new SqlCommand("proc_tblhomeservices", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@icon", txtUsrname.Text);
            cmd.Parameters.AddWithValue("@servicename", txtdesig.Text);
            cmd.Parameters.AddWithValue("@desc_", txtCity.Text);
            //cmd.Parameters.AddWithValue("@img",strfile1);
            cmd.Parameters.AddWithValue("@var","ins");
           
            
            
            
            
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                BindEmployeeDetails();
                lblresult.ForeColor = Color.Green;
                lblresult.Text = txtUsrname.Text + " Details inserted successfully";
            }
            else
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = txtUsrname.Text + " Details not inserted";
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
            cmd.Parameters.AddWithValue("@typee", "homeservices");
            cmd.Parameters.AddWithValue("@heading1", "");
            cmd.Parameters.AddWithValue("@content", txtheading.Text);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Updated');", true);
            }
        }
        catch { }
        finally { con.Close(); }
    }
}