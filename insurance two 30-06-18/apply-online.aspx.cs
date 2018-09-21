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

public partial class documents : System.Web.UI.Page
{
     string str = ConfigurationManager.ConnectionStrings["conn"].ToString();
    string strfile1 = "";
    string strfile2 = "";
    string strfile3 = "";
    string strfile4 = "";
    string strfile5 = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(str))
        {
            if (idprof.HasFile)
            {
                string datee = "111";
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(idprof.FileName);
                string fileExtension1 = Path.GetExtension(idprof.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                idprof.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile1 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile1 = "~/productimg/notavailable.jpg"; }

            if (addrsproof.HasFile)
            {
                string datee = "112";
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(addrsproof.FileName);
                string fileExtension1 = Path.GetExtension(addrsproof.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                addrsproof.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile2 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile2 = "~/productimg/notavailable.jpg"; }

            if (dobproof.HasFile)
            {
                string datee = "113";
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(dobproof.FileName);
                string fileExtension1 = Path.GetExtension(dobproof.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                dobproof.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile3 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile3 = "~/productimg/notavailable.jpg"; }

            if (photu.HasFile)
            {
                string datee = "114";
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(photu.FileName);
                string fileExtension1 = Path.GetExtension(photu.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                photu.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile4 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile4 = "~/productimg/notavailable.jpg"; }

            if (otherdoc.HasFile)
            {
                string datee = "115";
                //==== Get file name without its extension.
                string fileNameWithoutExtension1 = Path.GetFileNameWithoutExtension(otherdoc.FileName);
                string fileExtension1 = Path.GetExtension(otherdoc.FileName);
                fileNameWithoutExtension1 = datee + fileNameWithoutExtension1;
                otherdoc.PostedFile.SaveAs(Server.MapPath("~/productimg/" + fileNameWithoutExtension1 + fileExtension1));
                strfile5 = "~/productimg/" + fileNameWithoutExtension1 + fileExtension1;
            }
            else
            { strfile5 = "~/productimg/notavailable.jpg"; }






            DateTime dd = DateTime.UtcNow.AddHours(5).AddMinutes(30);

            SqlCommand cmd = new SqlCommand("insert into tbldocument(name,email,address,phone,document_for,idproof_,addressproof_,dobproof_,photu_,otherdocument_,comment,date)values(@name,@email,@address,@phone,@document_for,@idproof_,@addressproof_,@dobproof_,@photu_,@otherdocument_,@comment,@date)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@name", txtname.Value);
            cmd.Parameters.AddWithValue("@email", txtemail.Value);
            cmd.Parameters.AddWithValue("@address", txtaddress.Value);
            cmd.Parameters.AddWithValue("@phone", txtphone.Value);
            cmd.Parameters.AddWithValue("@document_for", ddldocumentfrom.SelectedItem.ToString());

            cmd.Parameters.AddWithValue("@idproof_", strfile1);
            cmd.Parameters.AddWithValue("@addressproof_", strfile2);
            cmd.Parameters.AddWithValue("@dobproof_", strfile3);
            cmd.Parameters.AddWithValue("@photu_", strfile4);
            cmd.Parameters.AddWithValue("@otherdocument_", strfile5);


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
                    txtaddress.Value = "";
                    txtphone.Value = "";
                    txtcomment.Value = "";
                    ddldocumentfrom.SelectedValue = "0";
                }
            }
            catch { }
            finally { con.Close(); con.Dispose(); }
        }
    }
}