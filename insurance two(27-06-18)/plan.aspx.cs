using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class plan : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["insutype"] != null)
            {
                Bind_(Request.QueryString["insutype"].ToString());
                lblplans.Text = Request.QueryString["insutype"].ToString();
            }
            else
                Response.Redirect("life-insurance.aspx");
        }
    }
    public void Bind_(string servicehead)
    {
        SqlDataAdapter da = new SqlDataAdapter("select plan_name,plan_detail,download_plan from tblService_Plan where service_heading='" + servicehead + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            RptPlans.DataSource = dt;
            RptPlans.DataBind();
        }
        else
            lblmessage.Visible = true;
        lblmessage.Text = "Data Not Found...";

    }

 
    protected void LnKBTNDownload_Click(object sender, EventArgs e)
    {
        
        SqlDataAdapter da = new SqlDataAdapter(" select  download_plan from tblService_Plan where service_heading='" + Request.QueryString["insutype"].ToString() + "' and plan_name='@plan_name'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count >0)
        {
            string filename = dt.Rows[0]["download_plan"].ToString();
            if (filename != "")
            {
                string path = Server.MapPath(filename);
                System.IO.FileInfo file = new System.IO.FileInfo(path);
                if (file.Exists)
                {
                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream";
                    Response.WriteFile(file.FullName);
                    Response.End();
                }
                else
                {
                    Response.Write("This file does not exist.");
                }
            }
        }
        
    }
}