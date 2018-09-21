﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.IO;

public partial class nyksi_panel_Upload_Main_Product : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    DataTable dt = new DataTable();
    string strfile1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["insurance"] != null)
            {
                bind_insurance_category();
                if(Request.QueryString["id_x"] !=null)
                {
                    bind_(Request.QueryString["id_x"].ToString());
                }
                else { Response.Redirect("plan-list.aspx"); }
            }
            else { Response.Redirect("../login/Default.aspx"); }
        }
    }
    public void bind_(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select id,service_id,service_heading,plan_name,plan_detail,download_plan from tblService_Plan where id='" + id + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count > 0)
        {
            ddlChooseInsuranceCategory.SelectedValue = dt.Rows[0]["service_id"].ToString();
            txtplan.Text = dt.Rows[0]["plan_name"].ToString();
            Editor1.Content = dt.Rows[0]["plan_detail"].ToString();
            lblfilePath.Text = dt.Rows[0]["download_plan"].ToString();
        }
    }
    public void bind_insurance_category()
    {
        SqlCommand cmd = new SqlCommand("proc_tblservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "ChooseByInsuranceCategory");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count > 0)
        {
            ddlChooseInsuranceCategory.DataSource = dt;
            ddlChooseInsuranceCategory.DataTextField = "heading";
            ddlChooseInsuranceCategory.DataValueField = "id";
            ddlChooseInsuranceCategory.DataBind();
            ddlChooseInsuranceCategory.Items.Insert(0, "------Pls. Choose Insurance Category------");
        }
    }
    protected void Button1x_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            ClassDate clsdat = new ClassDate();
            string datee = clsdat.date();
            //==== Get file name without its extension.
            string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
            string fileExtension1 = Path.GetExtension(FileUpload1.FileName);
            fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
            strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
        }
        else
        {
            strfile1 = lblfilePath.Text; 
        }



        try
        {
           
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_tblService_Plan", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@var", "Update");
            cmd.Parameters.AddWithValue("@service_id", ddlChooseInsuranceCategory.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@service_heading", ddlChooseInsuranceCategory.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@plan_name", txtplan.Text);
            cmd.Parameters.AddWithValue("@plan_detail",Editor1.Content);
            cmd.Parameters.AddWithValue("@download_plan", strfile1);
            cmd.Parameters.AddWithValue("@id",Request.QueryString["id_x"].ToString());
            int i = cmd.ExecuteNonQuery();
            if(i > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Successfully Updated');", true);
            }
        }
        catch { }
        finally { con.Close(); }
    }



} 