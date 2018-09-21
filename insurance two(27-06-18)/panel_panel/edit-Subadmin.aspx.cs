using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class nyksi_panel_edit_Subadmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["natul"] != null)
            {
                showddlsesson();
                show(Session["natul"].ToString());
                txtuserid.ReadOnly = true;
            }
            else { Response.Redirect("../login/Default.aspx"); }
        }
    }
    public void show(string usysy)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_nasty_admin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", usysy);
            cmd.Parameters.AddWithValue("@v", 4);
            SqlDataReader drr = cmd.ExecuteReader();
            if (drr.Read())
            {
                txtuserid.Text = drr["userid"].ToString();
                txtpassword.Value = drr["password"].ToString();
                txtconfirmpass.Value = drr["password"].ToString();
                txtname.Value = drr["name"].ToString();
                txtfathername.Value = drr["father"].ToString();

                txtmobile.Value = drr["mobile"].ToString();
                txtlandline.Value = drr["landlineno"].ToString();
                txtlandstdcode.Value = drr["landstd"].ToString();
                txtemailid.Value = drr["email"].ToString();

                string gen = drr["gender"].ToString();
                if (gen == "Male") { gendermale.Checked = true; }
                else if (gen == "Female") { genderfemale.Checked = true; }

                string[] strdob = drr["dob"].ToString().Split('-');
                ddlyrs.Items.Insert(0, strdob[0].ToString());
                ddlmonth.Items.Insert(0, strdob[1].ToString());
                ddlday.Items.Insert(0, strdob[2].ToString());

                txtdesignation.Value = drr["designation"].ToString();

                txtaddress.Value = drr["address"].ToString();
                txtcity.Value = drr["city"].ToString();
                txtstate.Value = drr["state"].ToString();
                txtcountry.Value = drr["country"].ToString();
                txtzipcode.Value = drr["pin"].ToString();

            }
        }
        catch { }
        finally { con.Close(); }
    }
    public void showddlsesson()
    {
        for (int j = 1; j <= 31; j++) { ddlday.Items.Add(j.ToString()); }
        for (int k = 1; k <= 12; k++) { ddlmonth.Items.Add(k.ToString()); }
        for (int l = 1970; l <= 2050; l++) { ddlyrs.Items.Add(l.ToString()); }
        // ddlday.Items.Insert(0, "Day"); ddlday.SelectedIndex = 0;
        // ddlmonth.Items.Insert(0, "Month"); ddlmonth.SelectedIndex = 0;
        // ddlyrs.Items.Insert(0, "Year"); ddlyrs.SelectedIndex = 0;
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnupdate_Click(object sender, EventArgs e)
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
            xcmd.Parameters.AddWithValue("@v", 2);
            int i = xcmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Profile Successfully Updated');", true);
            }
        }
        catch { }
        finally { con.Close(); }

    }
}