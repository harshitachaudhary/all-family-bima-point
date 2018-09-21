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

public partial class panel_panel_aboutfeatures : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    DataTable dt = new DataTable();
    string strfile1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["insurance"] != null)
            {
                topic();

            }
            else { Response.Redirect("../login/Default.aspx"); }


        }
    }
    public void Show_Feature(string topic)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select icon,heading,content from tblfeatures where topic=@topic", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@topic", topic);
        SqlDataReader drr = cmd.ExecuteReader();
        if (drr.Read())
        {
            Txticon.Text = drr["icon"].ToString();
            txtheading.Text = drr["heading"].ToString();
            Editor1.Content = drr["content"].ToString();
        }
        con.Close();
    }
    public void topic()
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select id,topic from tblfeatures", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddltopic.DataSource = dt;
        ddltopic.DataTextField = "topic";
        ddltopic.DataValueField = "id";
        ddltopic.DataBind();
        ddltopic.Items.Insert(0, "----Pls. Choose Topic Here---");

    }

    protected void Button1x_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblfeatures set icon=@icon,content=@content,heading=@heading where topic=@topic", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@topic", ddltopic.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@icon", Txticon.Text);
            cmd.Parameters.AddWithValue("@heading", txtheading.Text);
            cmd.Parameters.AddWithValue("@content", Editor1.Content);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Updated');", true);
            }
        }
        catch { }
        finally { con.Close(); }
    }





    protected void ddltopic_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddltopic.SelectedIndex > 0)
        {
            Show_Feature(ddltopic.SelectedItem.ToString());
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Choose Topic First');", true);
        }
    }
}