using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AllCodes
/// </summary>
public class AllCodes
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
	public AllCodes()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable show_user_info(string email)
    {
        SqlCommand cmd = new SqlCommand("proc_tblUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@var", 4);
        cmd.Parameters.AddWithValue("@flag", "");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

 

  
 

    public DataTable bind_Subcat_withimage()
    {
        SqlCommand cmd = new SqlCommand("select distinct catcode,catname,image from tblshopmenu where id in(3,4)", con);
        cmd.CommandType = CommandType.Text;
        // cmd.Parameters.AddWithValue("@status", "active");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind_Subcat_withimagelookbook()
    {
        SqlCommand cmd = new SqlCommand("select distinct catcode,catname,image from tblshopmenu where id in(5,6,7)", con);
        cmd.CommandType = CommandType.Text;
        // cmd.Parameters.AddWithValue("@status", "active");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind_admin_user(string userid)
    {
        SqlCommand cmd = new SqlCommand("select *from nasty_admin where userid=@userid", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@userid", userid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public string showpagecontent(string typee)
    {
        SqlCommand cmd = new SqlCommand("select content from tblallpages where typee=@typee", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@typee", typee);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return dt.Rows[0][0].ToString();
        else return "";
    }
    public DataTable showpagecontentP(string typee)
    {
        SqlCommand cmd = new SqlCommand("select heading1,heading2,content from tblallpages where typee=@typee", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@typee", typee);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

 
   
  
    public DataTable bind1st_tesart()
    {
        SqlDataAdapter da = new SqlDataAdapter("select *from tbltestimo where id=1 and status='approve'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind1st_tesart_all()
    {
        SqlDataAdapter da = new SqlDataAdapter("select *from tbltestimo where status='approve'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public string name(string emailid)
    {
        SqlCommand cmd = new SqlCommand("select nickname from tblUser where email=@email", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@email", emailid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string strcatcode = dt.Rows[0][0].ToString();
            string[] fname = strcatcode.Split(' ');
            string str = fname[0].ToString();
            return str;
        }
        else { return ""; }
    }

    public void delete(string transid)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from tblcomplete_orderBefore where trans_id=@trans_id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@trans_id", transid);
        cmd.ExecuteNonQuery();
        con.Close();
    }
  
    public DataTable show_pro_adver(int id)
    {
        SqlCommand cmd = new SqlCommand("select *from tblshowproduct_Adver where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bid_address(string email)
    {
        SqlCommand cmd = new SqlCommand("proc_tbladdress", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "select");
        cmd.Parameters.AddWithValue("@email_userid", email);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
   
    public DataTable bind_Ship_Bill_Address(string id)
    {
        SqlCommand cmd = new SqlCommand("select *from tbladdress where id=@id", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable frmaddressship(string email)
    {
        con.Close();
        SqlCommand cmd = new SqlCommand("select *from tbladdress where email_userid=@email_userid", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@email_userid", email);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public double Wallet_Amount(string emailid)
    {
        SqlCommand xcmd = new SqlCommand("select (sum(amountcr) - sum(amountdb)) as total from tblpayout where email=@email", con);
        xcmd.CommandType = CommandType.Text;
        xcmd.Parameters.AddWithValue("@email", emailid);
        SqlDataAdapter da = new SqlDataAdapter(xcmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            return double.Parse(dt.Rows[0]["total"].ToString());
        }
        else { return 0.0; }
    }
    public double tot_order(string emailid)
    {
        SqlCommand cmd = new SqlCommand("select isnull(count(trans_id),1) as tot from tblcomplete_order where email_userid=@email_userid",con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@email_userid",emailid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            return double.Parse(dt.Rows[0]["tot"].ToString());
        }
        else return 0;
    }

    
  

  
    public DataTable Events()
    {
        SqlCommand cmd = new SqlCommand("proc_tblevents", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel6");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable EventsAll()
    {
        SqlCommand cmd = new SqlCommand("proc_tblevents", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable EventsAll_byCatcode(string catcode)
    {
        SqlCommand cmd = new SqlCommand("select *from tblEvents_Entry where catcode=@catcode", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@catcode", catcode);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable EventsAll_Cat()
    {
        SqlCommand cmd = new SqlCommand("select distinct ce.catcode,ce.catname,ct.image from tblEvents_Entry ce left join tblEvent_Caregory ct on ce.catcode=ct.code", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable EventsAll_Banner()
    {
        SqlCommand cmd = new SqlCommand("proc_tbleventsBanner", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable StudentWork()
    {
        SqlCommand cmd = new SqlCommand("proc_tblstudentWorks", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable Testimonial()
    {
        SqlCommand cmd = new SqlCommand("proc_tbltesti", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }


    public DataTable aboutservices()
    {
        SqlCommand cmd = new SqlCommand("proc_tblaboutsrvc", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }






    public DataTable Award()
    {
        SqlCommand cmd = new SqlCommand("proc_tblaward", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable gallery()
    {
        SqlCommand cmd = new SqlCommand("proc_tblgallery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }


    public DataTable prtner()
    {
        SqlCommand cmd = new SqlCommand("proc_tblprtnr", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }







    public DataTable homeservices()
    {
        SqlCommand cmd = new SqlCommand("proc_tblhomeservices", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }



    public DataTable aboutsrve()
    {
        SqlCommand cmd = new SqlCommand("proc_tblaboutsrve", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }  









    public DataTable Team()
    {
        SqlCommand cmd = new SqlCommand("proc_tblteam", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable Affiliation()
    {
        SqlCommand cmd = new SqlCommand("proc_tblaffliation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bindblog()
    {

        if (con.State != ConnectionState.Open)
            con.Open();
        string q = "select top 3 id,heading1,image,SUBSTRING(descr,0,300)as subcom,date from tblblog";
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable dt1 = new DataTable();
        sda.Fill(dt1);

        DataTable final = new DataTable();
        final.Columns.Add("id", typeof(string));
        final.Columns.Add("heading1", typeof(string));
        final.Columns.Add("image", typeof(string));
        final.Columns.Add("subcom", typeof(string));
        final.Columns.Add("date", typeof(string));
        final.Columns.Add("Commentcount", typeof(int));

        foreach (DataRow dr in dt1.Rows)
        {
            string id = dr["id"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select ISNULL(count(*),0)as totcom from tblcomment where comment_id='" + id + "' and status='Approved'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string head1 = dr["heading1"].ToString();
                string image = dr["image"].ToString();
                string subcom = dr["subcom"].ToString();
                string date = dr["date"].ToString();
                string com_count = dt.Rows[0][0].ToString();
                final.Rows.Add(new object[] { id, head1, image, subcom, date, com_count });
            }
        }
        return final;
    }
    public DataTable bindblogAll()
    {

        if (con.State != ConnectionState.Open)
            con.Open();
        string q = "select id,heading1,image,SUBSTRING(descr,0,840)as subcom,date from tblblog";
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable dt1 = new DataTable();
        sda.Fill(dt1);

        DataTable final = new DataTable();
        final.Columns.Add("id", typeof(string));
        final.Columns.Add("heading1", typeof(string));
        final.Columns.Add("image", typeof(string));
        final.Columns.Add("subcom", typeof(string));
        final.Columns.Add("date", typeof(string));
        final.Columns.Add("Commentcount", typeof(int));

        foreach (DataRow dr in dt1.Rows)
        {
            string id = dr["id"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select ISNULL(count(*),0)as totcom from tblcomment where comment_id='" + id + "' and status='Approved'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string head1 = dr["heading1"].ToString();
                string image = dr["image"].ToString();
                string subcom = dr["subcom"].ToString();
                string date = dr["date"].ToString();
                string com_count = dt.Rows[0][0].ToString();
                final.Rows.Add(new object[] { id, head1, image, subcom, date, com_count });
            }
        }
        return final;
    }
    public DataTable bindblogAll_Comment(string idd)
    {

        if (con.State != ConnectionState.Open)
            con.Open();
        string q = "select id,heading1,image,descr,date from tblblog where id='"+idd+"'";
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable dt1 = new DataTable();
        sda.Fill(dt1);

        DataTable final = new DataTable();
        final.Columns.Add("id", typeof(string));
        final.Columns.Add("heading1", typeof(string));
        final.Columns.Add("image", typeof(string));
        final.Columns.Add("descr", typeof(string));
        final.Columns.Add("date", typeof(string));
        final.Columns.Add("Commentcount", typeof(int));

        foreach (DataRow dr in dt1.Rows)
        {
            string id = dr["id"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select ISNULL(count(*),0)as totcom from tblcomment where comment_id='" + id + "' and status='Approved'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string head1 = dr["heading1"].ToString();
                string image = dr["image"].ToString();
                string subcom = dr["descr"].ToString();
                string date = dr["date"].ToString();
                string com_count = dt.Rows[0][0].ToString();
                final.Rows.Add(new object[] { id, head1, image, subcom, date, com_count });
            }
        }
        return final;
    }
    public DataTable Placementsss()
    {
        SqlCommand cmd = new SqlCommand("proc_tblplacements", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@var", "sel");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable Teammember(string location, string ins)
    {
        SqlCommand cmd = new SqlCommand("select *from tblTeammeber where location=@location and id !=1 and instruct=@instruct", con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@instruct", ins);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable Instructor(string ins)
    {
        SqlCommand cmd = new SqlCommand("select *from tblTeammeber where  id !=1 and instruct=@instruct", con);
        cmd.CommandType = CommandType.Text;
       // cmd.Parameters.AddWithValue("@location", location);
        cmd.Parameters.AddWithValue("@instruct", ins);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind_SirviceMenu()
    {
        SqlCommand cmd = new SqlCommand("select  id,cat from tblservices", con);
        cmd.CommandType = CommandType.Text;
        // cmd.Parameters.AddWithValue("@status", "active");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind_Services(string id)
    {
        SqlCommand cmd = new SqlCommand("select * from tblservices where id=@id", con);
        cmd.CommandType = CommandType.Text;
         cmd.Parameters.AddWithValue("@id", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable bind_CoursesFooter()
    {
        SqlCommand cmd = new SqlCommand("select top 6 id,course_name from tblcourse ", con);
        cmd.CommandType = CommandType.Text;
        // cmd.Parameters.AddWithValue("@status", "active");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
 
}