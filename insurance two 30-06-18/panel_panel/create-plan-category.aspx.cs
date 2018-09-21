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

public partial class nyksi_panel_add_category : System.Web.UI.Page
{
    string strr = ConfigurationManager.ConnectionStrings["conn"].ToString();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }
    }
    protected void ntnAddCategory_Click(object sender, EventArgs e)
    {
       
        int j = 0;
        SqlDataAdapter da = new SqlDataAdapter("select isnull(max(id),0)as id from tblplancat ", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows[0][0].ToString() != "")

            j = int.Parse(dt.Rows[0][0].ToString());

        else j = 0;



        string q = "Insert into tblplancat(code,cat) values(@code,@cat)";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@code", code());
            cmd.Parameters.AddWithValue("@cat", txtCategory.Text.Trim().ToUpper());
            if (con.State == ConnectionState.Open)
                con.Close();
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                BindCategory();
                txtCategory.Text = "";
            }
     
        con.Close(); 

    }
    public void BindCategory()
    {
        try
        {
            if (con.State == ConnectionState.Open)
                con.Close();
            con.Open();
            string q = "select id,code,cat from tblplancat order by id desc "; SqlDataAdapter sda = new SqlDataAdapter(q, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grdcategory.DataSource = dt;
            grdcategory.DataBind();
        }
        catch
        {
        }
        finally
        {
            con.Close();
        }
    }
    private string code()
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        string q = "select '" + pos() + "'+ isnull(cast(count(id)+1 as nvarchar) ,1 ) from tblplancat";
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();
        return dt.Rows[0][0].ToString();
    }
    public void deletecat(string catcode)
    {
        try
        {
            string q = "Delete from tblplancat where catcode=@catcode";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@catcode", catcode);

            if (con.State == ConnectionState.Open)
                con.Close();
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                BindCategory();
            }
        }
        catch
        {
        }
        finally { con.Close(); }

    }
    public string pos()
    {
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        string q = "select isnull( cast(count(id)+1 as nvarchar) ,1 ) from tblplancat";
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int x = Convert.ToInt32(dt.Rows[0][0].ToString());
        if (x < 10)
            return "C0";
        else
            return "C";
    }
    protected void grdcategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "DELETE FROM category WHERE code=@code"; 
        //cmd.Parameters.Add("@code", SqlDbType.VarChar).Value = grdcategory.Rows[e.RowIndex].Cells[0].Text;
        //cmd.Connection = con;
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();
        //BindCategory();
    }
    protected void grdcategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdcategory.EditIndex = e.NewEditIndex;
        BindCategory();
    }
    protected void grdcategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (((LinkButton)grdcategory.Rows[0].Cells[3].Controls[0]).Text == "Insert")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO tblplancat(catname) VALUES(@cat_name)"; cmd.Parameters.Add("@cat_name", SqlDbType.VarChar).Value = ((TextBox)grdcategory.Rows[0].Cells[2].Controls[0]).Text;
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            TextBox tb = (TextBox)grdcategory.Rows[e.RowIndex].Cells[1].Controls[0];
            string s = tb.Text.Trim();
            cmd.CommandText = "UPDATE tblplancat SET catname=@cat_name WHERE catcode=@cat_id";
            cmd.Parameters.Add("@cat_name", SqlDbType.VarChar).Value = s;
            cmd.Parameters.Add("@cat_id", SqlDbType.VarChar).Value = grdcategory.Rows[e.RowIndex].Cells[0].Text;
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindCategory();
        }
        grdcategory.EditIndex = -1;
        BindCategory();
    }
    protected void grdcategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdcategory.EditIndex = -1;
        BindCategory();
    }
    protected void grdcategory_RowCreated(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grdcategory_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void grdcategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdcategory.PageIndex = e.NewPageIndex;
        this.BindCategory();
    }

    protected void lb_Edit_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string str = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();
        lblcatcode.Text = str;

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select cat from tblplancat where code=@code", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@code", lblcatcode.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtCategory.Text = dr["cat"].ToString();
                btnUpdate.Visible = true;
                ntnAddCategory.Visible = false;
            }
        }
        catch { }
        finally { con.Close(); }
        // this.ModalPopupExtender1.Show();

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE tblplancat SET cat=@cat WHERE code=@code", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@cat", txtCategory.Text.Trim().ToUpper());
            cmd.Parameters.AddWithValue("@code", lblcatcode.Text.Trim());
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                BindCategory();
                btnUpdate.Visible = false;
                ntnAddCategory.Visible = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('successfully Updated!');", true);
                txtCategory.Text = "";
            }
        }
        catch { }
        finally { con.Close(); }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string s = "select code,cat from tblplancat where code like '%" + txtsearch.Text + "%'";
        SqlCommand cmd = new SqlCommand(s, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        grdcategory.DataSource = dt;
        grdcategory.DataBind();


    }
    protected void lbtnDel_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        //getting particular row linkbutton
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        //getting userid of particular row
        string userid = grdcategory.DataKeys[gvrow.RowIndex].Value.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from tblplancat where code='" + userid + "'", con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            BindCategory();
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Category Successfully Deleted')", true);
        }

    }
}