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
    string str = ConfigurationManager.ConnectionStrings["conn"].ToString();
    AllCodes all = new AllCodes();
    static int id;
    ClassDate s = new ClassDate();
    string colr = "";
    string strfile1 = ""; string strfile2 = ""; string strfile3 = ""; string strfile4 = ""; string strfile5 = ""; string strfile6 = ""; string lens_color = ""; string lens_color_Text = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                bindpro();
                if (Request.QueryString["id_x"] != "")
                {
                    show(Request.QueryString["id_x"].ToString());
                }
            }
            catch (NullReferenceException) { Response.Redirect("plan-lists.aspx"); }
       

        }
    }
    public void show(string id)
    {

        SqlCommand cmd = new SqlCommand("Select *from tblPortfolio where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            ddlcat.SelectedValue = dt.Rows[0]["catcode"].ToString();
            txtplan.Text = dt.Rows[0]["plan_name"].ToString();
            Textheading.Text = dt.Rows[0]["heading"].ToString();
            Image1.ImageUrl = dt.Rows[0]["image"].ToString();

         
        }
    }
    private void bindpro()
    {
        try
        {
            string q = "select * from tblplancat ";
            SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (con.State != ConnectionState.Open)
                con.Open();
            if (dt.Rows.Count > 0)
            {
                ddlcat.DataSource = dt;
                ddlcat.DataTextField = "cat";
                ddlcat.DataValueField = "code";

                ddlcat.DataBind();
                ddlcat.Items.Insert(0, new ListItem("--- Select Category ---"));
                ddlcat.SelectedIndex = 0;
               
            }
        }
        catch
        { con.Close(); }
        finally { }

    }

   
    protected void Button1x_Click(object sender, EventArgs e)
    {
      using(SqlConnection con=new SqlConnection(str))
      {
          try
          {
              string datee = s.date();
            
              if (FileUpload1.HasFile == true)
              {

                  //==== Get file name without its extension.
                  string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
                  string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
                  fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                  FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                  strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
              }
              else
              {
                  strfile1 = Image1.ImageUrl;
              }

              con.Open();
              SqlCommand cmd = new SqlCommand("update tblPortfolio set catcode=@catcode,catname=@catname,plan_name=@plan_name,heading=@heading,image=@image where id=@id", con);
              cmd.CommandType = CommandType.Text;
              cmd.Parameters.AddWithValue("@catcode", ddlcat.SelectedValue.ToString());
              cmd.Parameters.AddWithValue("@catname", ddlcat.SelectedItem.ToString());
              cmd.Parameters.AddWithValue("@plan_name", txtplan.Text.Trim());
              cmd.Parameters.AddWithValue("@heading",Textheading.Text);
              cmd.Parameters.AddWithValue("@image", strfile1);
              cmd.Parameters.AddWithValue("@id",Request.QueryString["id_x"].ToString());
              int i = cmd.ExecuteNonQuery();
              if (i > 0)
              {
                  ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Successfully Updated')", true);
                  show(Request.QueryString["id_x"].ToString());
              }
          }
          catch { }
          finally { con.Close(); }
          
      }
    }

   
}