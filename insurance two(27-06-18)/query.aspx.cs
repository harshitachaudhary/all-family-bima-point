using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.IO;

public partial class query : System.Web.UI.Page

{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    AllCodes all = new AllCodes();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        DateTime dd = DateTime.UtcNow.AddHours(5).AddMinutes(30);
        SqlCommand cmd = new SqlCommand("insert into tblqueryform(name,email,phone,typeofinsurance,comment,date)values(@name,@email,@phone,@typeofinsurance,@comment,@date)", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@name", txtname.Value);
        cmd.Parameters.AddWithValue("@email", txtemail.Value);

        cmd.Parameters.AddWithValue("@phone", txtphone.Value);
        cmd.Parameters.AddWithValue("@typeofinsurance", ddlqueryfrom.SelectedItem.ToString());

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
                txtphone.Value = "";
                ddlqueryfrom.SelectedValue = "0";
                txtcomment.Value = "";
            }
        }
        catch { }
        finally { con.Close(); con.Dispose(); }



    }
}