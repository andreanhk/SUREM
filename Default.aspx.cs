using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.IO;



public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["New"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["New"] != null)
        {
            string strses = Convert.ToString(Session["New"]);

            if (strses == "admin")
                LabelUser.Text = "Admin ";
            else
            {
                LabelUser.Text = "" + strses;
                ManageUserTab.Visible = false;
            }
        }
        string s = "UPDATE [dokumen_spbe] SET [dif_dokumen_spbe] = DATEDIFF(day, GETDATE(), [exp_dokumen_spbe])";
        string s1 = "UPDATE [dokumen_agen] SET [dif_dokumen_agen] = DATEDIFF(day, GETDATE(), [exp_dokumen_agen])";
        string s2 = "UPDATE [dokumen_bkl] SET [dif_dokumen_bkl] = DATEDIFF(day, GETDATE(), [exp_dokumen_bkl])";
        SqlCommand cmd2 = new SqlCommand(s, con);
        SqlCommand cmd3 = new SqlCommand(s1, con);
        SqlCommand cmd4 = new SqlCommand(s2, con);
        con.Open();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        cmd4.ExecuteNonQuery();
        con.Close();

        int Rmdr1 = GridView_SpbeRmdr.Rows.Count;
        int Rmdr2 = GridView_AgenRmdr.Rows.Count;
        int Rmdr3 = GridView_BklRmdr.Rows.Count;
        int Exp1 = GridView_SpbeExp.Rows.Count;
        int Exp2 = GridView_AgenExp.Rows.Count;
        int Exp3 = GridView_BklExp.Rows.Count;

        int TotalRmdr = Rmdr1 + Rmdr2 + Rmdr3;
        int TotalExp = Exp1 + Exp2 + Exp3;

        Label_TipRmdr.Text = TotalRmdr.ToString();
        Label_TipExp.Text = TotalExp.ToString();
        Label_NotifRmdr.Text = TotalRmdr.ToString();
        Label_NotifExp.Text = TotalExp.ToString();

        Session["NotifRmdr"] = TotalRmdr;
        Session["NotifExp"] = TotalExp;
    }

    protected void Update()
    {
        
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}