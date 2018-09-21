using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class awards : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dt = all.showpagecontentP("AboutUs");
            if (dt.Rows.Count > 0)
            {


            }






            rptrawrd.DataSource = all.Award();
            rptrawrd.DataBind();

        }
    }
    public DataTable bind_Banner()
    {
        SqlCommand cmd = new SqlCommand("select *from tblbanner", con);
        cmd.CommandType = CommandType.Text;

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}