using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class college_admin_admin_master : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    string str = ConfigurationManager.ConnectionStrings["conn"].ToString();
    AllCodes all = new AllCodes();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["insurance"] != null)
            {
                DataTable dd = new DataTable();
                dd = all.bind_admin_user(Session["insurance"].ToString());
                if (dd.Rows.Count > 0)
                {
                    lbluserid.Text = dd.Rows[0]["name"].ToString();
                }
            }
            else { Response.Redirect("../login/Default.aspx"); }
        }
    }

   
}
