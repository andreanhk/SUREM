using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            return;
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);
        DataSet ds = new DataSet();

        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);
            conn.Open();
            string checkuser = "SELECT COUNT(*) FROM [user_list] where nama_user ='" + Txt_Username.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            Int32 temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            Response.Write(temp);
            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string checkpass = "SELECT pass_user FROM [user_list] where nama_user ='" + Txt_Username.Text + "'";
                SqlCommand comm = new SqlCommand(checkpass, conn);
                string pass = comm.ExecuteScalar().ToString().Replace(" ", "");

                if (pass == Txt_Password.Text)
                {
                    string checkstatus = "SELECT status_user FROM [user_list] WHERE nama_user ='" + Txt_Username.Text + "'";
                    SqlCommand commm = new SqlCommand(checkstatus, conn);
                    string statuser = commm.ExecuteScalar().ToString().Replace(" ", "");

                    if (statuser == "Aktif")
                    {
                        Session["New"] = Txt_Username.Text;
                        Response.Redirect("Default.aspx");
                    }
                    else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Akun Anda Belum Aktif, Silahkan Menghubungi Admin.');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Password Tidak Tepat');</script>");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Username Tidak Tepat');</script>");
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
