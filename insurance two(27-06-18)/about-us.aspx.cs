using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class aboutus : System.Web.UI.Page
{

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





            rptfeatures.DataSource = bind_features();
            rptfeatures.DataBind();

            Rptabotsrvc.DataSource = all.aboutservices();
            Rptabotsrvc.DataBind();

            rptrteam.DataSource = all.Team();
            rptrteam.DataBind();
            Rpttesti.DataSource = all.Testimonial();
            Rpttesti.DataBind();
            rptrprtnt.DataSource = all.prtner();
            rptrprtnt.DataBind();

            RptImage.DataSource = all.showpagecontentP("homecontentimg");
            RptImage.DataBind();
        
        }
    }


    public DataTable bind_features()
    { 
        SqlCommand cmd =new SqlCommand("select * from tblfeatures",con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;




    }
}