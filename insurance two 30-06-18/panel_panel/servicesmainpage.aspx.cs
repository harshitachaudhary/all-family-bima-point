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
    DataTable dt = new DataTable();
    string strfile1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["insurance"] != null)
            {



                bind_insurance_category();


                //Editor1.Content = all.showpagecontent("serices");

                //Image1.ImageUrl = all.showpagecontent("sericesimg");

                //dt = all.showpagecontentP("serices");
                //if(dt.Rows.Count > 0)
                //{
                //    txtheading1.Text = dt.Rows[0]["heading1"].ToString();
                //    txtheading2.Text = dt.Rows[0]["heading2"].ToString();
                //}
            }
            else { Response.Redirect("../login/Default.aspx"); }
            
          
        }
    }
    public void bind_insurance_category()
    {
        SqlCommand cmd = new SqlCommand("proc_tblservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "ChooseByInsuranceCategory");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count > 0)
        {
            ddlChooseInsuranceCategory.DataSource = dt;
            ddlChooseInsuranceCategory.DataTextField = "heading";
            ddlChooseInsuranceCategory.DataValueField = "id";
            ddlChooseInsuranceCategory.DataBind();
            ddlChooseInsuranceCategory.Items.Insert(0, "------Pls. Choose Insurance Category------");
        }
    }
    protected void Button1x_Click(object sender, EventArgs e)
    {
        try
        {
            ClassDate s = new ClassDate();
            string datee = s.date();
            if (FileUpload1.HasFile)
            {
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
                string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile1 = Image1.ImageUrl; }



            con.Open();
            SqlCommand cmd = new SqlCommand("proc_tblservices", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@var", "Update");
            cmd.Parameters.AddWithValue("@content", Editor1.Content);
            cmd.Parameters.AddWithValue("@img", strfile1);
            cmd.Parameters.AddWithValue("@heading",ddlChooseInsuranceCategory.SelectedItem.ToString());
            int i = cmd.ExecuteNonQuery();
            if(i > 0)
            {
                
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Updated');", true);
            }
        }
        catch { }
        finally { con.Close(); }
    }


    protected void ddlChooseInsuranceCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlChooseInsuranceCategory.SelectedIndex > 0)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_tblservices", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@var", "Select");
            cmd.Parameters.AddWithValue("@heading", ddlChooseInsuranceCategory.SelectedItem.ToString());
            SqlDataReader drr = cmd.ExecuteReader();
            if (drr.Read())
            {
                Editor1.Content = drr["content"].ToString();
                Image1.ImageUrl = drr["img"].ToString();
            }
            con.Close();
           
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Pls. Choose Iinsurance Category first');", true);
        }
    }
} 