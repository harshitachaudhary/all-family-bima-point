using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Default2: System.Web.UI.Page
{
    //SqlConnection con =new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dt = all.showpagecontentP("homecontent");
            if (dt.Rows.Count > 0)
            {
                //lblwhoamiHead1.Text = dt.Rows[0]["heading1"].ToString();
                //lblwhoamiHead2.Text = dt.Rows[0]["heading2"].ToString();
                //lblwhoamidesc.Text = dt.Rows[0]["content"].ToString();
                //lblabouthome.Text = dt.Rows[0]["content"].ToString();
                lblhd1.Text = dt.Rows[0]["heading1"].ToString();
                lblhd2.Text = dt.Rows[0]["heading2"].ToString();
                lblhd3.Text = dt.Rows[0]["content"].ToString();

               
            }

         
            RptImage.DataSource = all.showpagecontentP("homecontentimg");
            RptImage.DataBind();

            RptBanner.DataSource = bind_Banner();
            RptBanner.DataBind();


            Repeatsrvc.DataSource = all.homeservices();
            Repeatsrvc.DataBind();


            rptrprtnt.DataSource = all.prtner();
            rptrprtnt.DataBind();
            rptrteam.DataSource = all.Team();
            rptrteam.DataBind();
            Rpttesti.DataSource = all.Testimonial();
            Rpttesti.DataBind();



        }
    }
    public DataTable bind_Banner()
    {
        SqlCommand cmd = new SqlCommand("select *from tblbanner", con);
        cmd.CommandType = CommandType.Text;
        // cmd.Parameters.AddWithValue("@var", 2);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        DateTime dd = DateTime.UtcNow.AddHours(5).AddMinutes(30);
        SqlCommand cmd = new SqlCommand("insert into tblquery(name,email,phone,comment,date)values(@name,@email,@phone,@comment,@date)", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@name", txtname.Value);
        cmd.Parameters.AddWithValue("@email", txtemail.Value);

        cmd.Parameters.AddWithValue("@phone", txtsubject.Value);
       
        cmd.Parameters.AddWithValue("@comment", txtcomment.Value);
        cmd.Parameters.AddWithValue("@date", dd);
        try
        {
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Submited');", true);

                txtname.Value = "";
                txtemail.Value = "";
                txtsubject.Value = "";

                txtcomment.Value = "";

            }
        }
        catch { }
        finally { con.Close(); con.Dispose(); }

    }
}