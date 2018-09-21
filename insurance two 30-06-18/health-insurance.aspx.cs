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

public partial class healthinsurance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            show("Health Insurance");


            Rpt1Insu.DataSource = Bind_("Mutual Funds");
            Rpt1Insu.DataBind();

            Rpt2Insu.DataSource = Bind_("General Insurance");
            Rpt2Insu.DataBind();

            Rpt3Insu.DataSource = Bind_("Health Insurance");
            Rpt3Insu.DataBind();

            Rpt4Insu.DataSource = Bind_("Life Insurance");
            Rpt4Insu.DataBind();

        }
    }

    public void show(string type)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("proc_tblservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "Select");
        cmd.Parameters.AddWithValue("@heading", type);
        SqlDataReader drr = cmd.ExecuteReader();
        if (drr.Read())
        {
            lblcontent.Text = drr["content"].ToString();
            Image1.ImageUrl = drr["img"].ToString();
            lblheading.Text = type;
        }
        con.Close();
    }

    public DataTable Bind_(string heading)
    {
        SqlDataAdapter da = new SqlDataAdapter("select heading,substring(content,0,210)as contentA from tblservices where heading='" + heading + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    protected void BtnViewPlan_Click(object sender, EventArgs e)
    {
        Response.Redirect("plan.aspx?insutype=" + lblheading.Text);
    }
}