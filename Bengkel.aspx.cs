using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class Bengkel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NotifRmdr"] == null && Session["NotifExp"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["NotifRmdr"] != null && Session["NotifExp"] != null)
        {
            string TotalRMdr = Session["NotifRmdr"].ToString();
            string TotalExp = Session["NotifExp"].ToString();
            Label_TipRmdr.Text = TotalRMdr;
            Label_TipExp.Text = TotalExp;
            Label_NotifRmdr.Text = TotalRMdr;
            Label_NotifExp.Text = TotalExp;
        }

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
                addbkl.Visible = false;
                GridView_Bkl.Columns[7].Visible = (Session["New"] == "admin");
                ManageUserTab.Visible = false;
            }
        }

        if (!IsPostBack)
        {
            BindGridView_Bkl();
        }
    }

    protected void Save_Bkl_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("Images/");
        if (UploadPP_Bkl.HasFile)
        {
            int filesize = UploadPP_Bkl.PostedFile.ContentLength;
            if (filesize > 2097152)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Ukuran file gambar maksimal 2 Megabyte.');</script>");
            }
            else
            {
                UploadPP_Bkl.SaveAs(path + UploadPP_Bkl.FileName);
                string name = "~/Images/" + UploadPP_Bkl.FileName;
                string s = "INSERT INTO bkl(no_vendor_bkl, anneal_bkl, produk_bkl, nama_bkl, alamat1_bkl, alamat2_bkl, kota_bkl, provinsi_bkl, rayon_bkl, status_bkl, email_bkl, telp_bkl, koor_bkl, jmltruk_bkl, kaptruk_bkl, jmltabung_bkl, imgpp_bkl, retest_bkl, repaint_bkl, retp_bkl, repair_bkl, total_bkl) VALUES('" + TextBox_vendor_bkl.Text + "','" + TextBox_anneal_bkl.Text + "','" + TextBox_produk_bkl.Text + "','" + TextBox_nama_bkl.Text + "','" + TextBox_alamat1_bkl.Text + "','" + TextBox_alamat2_bkl.Text + "','" + TextBox_kota_bkl.Text + "','" + TextBox_provinsi_bkl.Text + "','" + TextBox_rayon_bkl.Text + "','" + TextBox_status_bkl.Text + "','" + TextBox_email_bkl.Text + "','" + TextBox_telp_bkl.Text + "','" + TextBox_koor_bkl.Text + "','" + TextBox_jmltruk_bkl.Text + "','" + TextBox_kaptruk_bkl.Text + "','" + TextBox_jmltabung_bkl.Text + "','" + name + "','" + TextBox_retest_bkl.Text + "','" + TextBox_repaint_bkl.Text + "','" + TextBox_rtp_bkl.Text + "','" + TextBox_repair_bkl.Text + "','" + TextBox_total_bkl.Text + "')";

                SqlCommand cmd = new SqlCommand(s, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
            string s = "INSERT INTO bkl(no_vendor_bkl, anneal_bkl, produk_bkl, nama_bkl, alamat1_bkl, alamat2_bkl, kota_bkl, provinsi_bkl, rayon_bkl, status_bkl, email_bkl, telp_bkl, koor_bkl, jmltruk_bkl, kaptruk_bkl, jmltabung_bkl, retest_bkl, repaint_bkl, retp_bkl, repair_bkl, total_bkl) VALUES('" + TextBox_vendor_bkl.Text + "','" + TextBox_anneal_bkl.Text + "','" + TextBox_produk_bkl.Text + "','" + TextBox_nama_bkl.Text + "','" + TextBox_alamat1_bkl.Text + "','" + TextBox_alamat2_bkl.Text + "','" + TextBox_kota_bkl.Text + "','" + TextBox_provinsi_bkl.Text + "','" + TextBox_rayon_bkl.Text + "','" + TextBox_status_bkl.Text + "','" + TextBox_email_bkl.Text + "','" + TextBox_telp_bkl.Text + "','" + TextBox_koor_bkl.Text + "','" + TextBox_jmltruk_bkl.Text + "','" + TextBox_kaptruk_bkl.Text + "','" + TextBox_jmltabung_bkl.Text + "','" + TextBox_retest_bkl.Text + "','" + TextBox_repaint_bkl.Text + "','" + TextBox_rtp_bkl.Text + "','" + TextBox_repair_bkl.Text + "','" + TextBox_total_bkl.Text + "')";

            SqlCommand cmd = new SqlCommand(s, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void BindGridView_Bkl()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[bkl]", con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_Bkl.DataSource = dt;
            GridView_Bkl.DataBind();
        }
    }
    protected void GridView_Bkl_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_Bkl.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("delete from [dokumen_bkl] where [dokumen_bkl].[id_vendor_bkl]=" + id, con);
        SqlCommand cmd2 = new SqlCommand("delete from [histori_bkl] where [histori_bkl].[id_vendor_bkl]=" + id, con);
        SqlCommand cmd3 = new SqlCommand("delete from [image_bkl] where [image_bkl].[id_vendor_bkl]=" + id, con);
        SqlCommand cmd1 = new SqlCommand("delete from [bkl] where [id_vendor_bkl] =" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();

        BindGridView_Bkl();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView_Bkl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id_vendor_bkl = GridView_Bkl.SelectedValue.ToString().Trim();
        Response.Redirect("~/Profil_Bengkel.aspx?bengkel=" + id_vendor_bkl);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}