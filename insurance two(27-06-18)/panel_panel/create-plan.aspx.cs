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

        bindpro();
       
       

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
              //==== Get file name without its extension.
              string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
              string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
              fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
              FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
              strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            

              con.Open();
              SqlCommand cmd = new SqlCommand("insert into tblPortfolio(catcode,catname,plan_name,heading,image)values(@catcode,@catname,@plan_name,@heading,@image)", con);
              cmd.CommandType = CommandType.Text;
              cmd.Parameters.AddWithValue("@catcode", ddlcat.SelectedValue.ToString());
              cmd.Parameters.AddWithValue("@catname", ddlcat.SelectedItem.ToString());
              cmd.Parameters.AddWithValue("@plan_name", txtplanName.Text.Trim());
              cmd.Parameters.AddWithValue("@heading", Textplanheading.Text);
              cmd.Parameters.AddWithValue("@image", strfile1);

              int i = cmd.ExecuteNonQuery();
              if (i > 0)
              {
                  ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Successfully Submitted')", true);
              }
          }
          catch { }
          finally { con.Close(); }
          
      }
    }

   
}