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

public partial class nyksi_panel_change_passowrd : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    string str = null;
    SqlCommand com;
    byte up;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }
    }
    protected void bTnStudentRegist_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strr))
        {
            try
            {
                con.Open();
                str = "select *from nasty_admin";
                com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                while (reader.Read())
                {
                    if (txt_cpassword.Text == reader["password"].ToString())
                    {
                        up = 1;
                    }
                }
                reader.Close();
                con.Close();
                if (up == 1)
                {
                    con.Open();
                    str = "update nasty_admin set password=@password where userid='" + Session["insurance"].ToString() + "'";
                    com = new SqlCommand(str, con);
                    com.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 50));
                    com.Parameters["@password"].Value = txt_npassword.Text;
                    com.ExecuteNonQuery();
                    con.Close();
                    lbl_msg.Text = "Password changed Successfully";
                    lbl_msg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbl_msg.Text = "Please enter correct Current password";
                    lbl_msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex) { throw ex; }
            finally { }
        }


    }
}