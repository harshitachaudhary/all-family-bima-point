using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class nyksi_panel_subadmin_list : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["insurance"] != null)
            {
                BindEmployeeDetails(Session["insurance"].ToString());
            }
            else { Response.Redirect("../login/Default.aspx"); }
        }
    }
    protected void BindEmployeeDetails(string userid)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select *from nasty_admin", con);
            cmd.CommandType = CommandType.Text;
            //  cmd.Parameters.AddWithValue("@userid", userid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvDetails.DataSource = dt;
            gvDetails.DataBind();
        }
        catch (Exception ex) { string script = "<script>alert('" + ex.Message + "');</script>"; }
        finally { }
    }

    protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["UserId"].ToString());
        string userid = gvDetails.DataKeys[e.RowIndex].Values["userid"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from nasty_admin where userid=@userid", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@userid", userid);
        int i = cmd.ExecuteNonQuery();
        con.Close();

        BindEmployeeDetails(Session["opti"].ToString());
        lblresult.ForeColor = Color.Red;
        lblresult.Text = userid.ToUpper() + " details deleted successfully";
    }
}