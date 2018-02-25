using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);

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
    protected void Register_Click(object sender, EventArgs e)
    {    
        con.Open();
        try
        {
            string checkuser = "SELECT COUNT(nama_user) FROM [user_list] WHERE '"+TextBox_User.Text+"' NOT IN (SELECT nama_user FROM user_list)";
            SqlCommand cmd = new SqlCommand(checkuser,con);
            Int32 tmp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (tmp == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Username telah digunakan, silahkan gunakan username lain');</script>");
                TextBox_User.Text="";
                TextBox_Pass.Text="";
                TextBox_RePass.Text="";
            }
            else if (TextBox_User.Text == "" || TextBox_Pass.Text == "" || TextBox_RePass.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Username atau Password belum terisi');</script>");
            }
            else if (TextBox_Pass.Text != TextBox_RePass.Text)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Pengulangan Password tidak sama');</script>");
                TextBox_User.Text = "";
                TextBox_Pass.Text = "";
                TextBox_RePass.Text = "";
            }
            else if (TextBox_User.Text != checkuser && TextBox_Pass.Text == TextBox_RePass.Text)
            {
                string QueryReg = "INSERT INTO [user_list] (nama_user,pass_user) VALUES ('" + TextBox_User.Text + "','" + TextBox_Pass.Text + "')";
                SqlCommand cmd1 = new SqlCommand(QueryReg, con);
                cmd1.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Registrasi Berhasil');</script>");

                con.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}