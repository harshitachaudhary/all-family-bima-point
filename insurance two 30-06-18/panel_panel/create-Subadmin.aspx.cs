using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class nyksi_panel_create_Subadmin : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showddlsesson();
        }
    }
    public void showddlsesson()
    {
        for (int j = 1; j <= 31; j++) { ddlday.Items.Add(j.ToString()); }
        for (int k = 1; k <= 12; k++) { ddlmonth.Items.Add(k.ToString()); }
        for (int l = 1970; l <= 2050; l++) { ddlyrs.Items.Add(l.ToString()); }
        ddlday.Items.Insert(0, "Day"); ddlday.SelectedIndex = 0;
        ddlmonth.Items.Insert(0, "Month"); ddlmonth.SelectedIndex = 0;
        ddlyrs.Items.Insert(0, "Year"); ddlyrs.SelectedIndex = 0;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string strgender = "";
            if (gendermale.Checked == true) { strgender = "Male"; }
            else if (genderfemale.Checked == true) { strgender = "Female"; }
            con.Open();
            SqlCommand xcmd = new SqlCommand("proc_nasty_admin", con);
            xcmd.CommandType = CommandType.StoredProcedure;
            xcmd.Parameters.AddWithValue("@userid", txtuserid.Text.Trim());
            xcmd.Parameters.AddWithValue("@password", txtpassword.Value.Trim());
            xcmd.Parameters.AddWithValue("@name", txtname.Value.Trim());
            xcmd.Parameters.AddWithValue("@father", txtfathername.Value.Trim());
            xcmd.Parameters.AddWithValue("@mobile", txtmobile.Value.Trim());
            xcmd.Parameters.AddWithValue("@email", txtemailid.Value.Trim());
            xcmd.Parameters.AddWithValue("@dob", ddlyrs.SelectedItem.ToString() + "-" + ddlmonth.SelectedItem.ToString() + "-" + ddlday.SelectedItem.ToString());
            xcmd.Parameters.AddWithValue("@gender", strgender);
            xcmd.Parameters.AddWithValue("@address", txtaddress.Value.Trim());
            xcmd.Parameters.AddWithValue("@city", txtcity.Value.Trim());
            xcmd.Parameters.AddWithValue("@state", txtstate.Value.Trim());
            xcmd.Parameters.AddWithValue("@country", txtcountry.Value.Trim());
            xcmd.Parameters.AddWithValue("@pin", txtzipcode.Value.Trim());
            xcmd.Parameters.AddWithValue("@designation", txtdesignation.Value.Trim());
            xcmd.Parameters.AddWithValue("@landstd", txtlandstdcode.Value.Trim());
            xcmd.Parameters.AddWithValue("@landlineno", txtlandline.Value.Trim());
            xcmd.Parameters.AddWithValue("@v", 1);
            int i = xcmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("success.aspx?name=" + txtname.Value + "&userid=" + txtuserid.Text + "&pass=" + txtpassword.Value);
            }
        }
        catch { }
        finally { con.Close(); }

    }

    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

    }
}