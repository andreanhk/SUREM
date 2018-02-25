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

public partial class SPBE : System.Web.UI.Page
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
                addspbe.Visible = false;
                GridView_Spbe.Columns[9].Visible = (Session["New"] == "admin");
                ManageUserTab.Visible = false;
            }
        }

        if (!IsPostBack)
        {
            BindGridView_Spbe();
        }
    }

    protected void Save_Spbe_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("Images/");
        if (UploadPP_Spbe.HasFile)
        {
            int filesize = UploadPP_Spbe.PostedFile.ContentLength;
            if (filesize > 2097152)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Ukuran file gambar maksimal 2 Megabyte.');</script>");
            }
            else
            {
                UploadPP_Spbe.SaveAs(path + UploadPP_Spbe.FileName);
                string name = "~/Images/" + UploadPP_Spbe.FileName;
                string s = "INSERT INTO spbe(no_vendor_spbe, id_spbe, tipe_spbe, produk_spbe, nama_spbe, alamat1_spbe, alamat2_spbe, kota_spbe, prov_spbe, rayon_spbe, status_spbe, email_spbe, telp_spbe, koor_spbe, jmlsalur_spbe, jmltruk_spbe, kaptruk_spbe, jmlfill_spbe, jmltimbun_spbe, kaptimbun_spbe, jmltabung_spbe, imgpp_spbe) VALUES('" + TextBox_vendor_spbe.Text + "','" + TextBox_kode_spbe.Text + "','" + TextBox_tipe_spbe.Text + "','" + TextBox_produk_spbe.Text + "','" + TextBox_nama_spbe.Text + "','" + TextBox_alamat1_spbe.Text + "','" + TextBox_alamat2_spbe.Text + "','" + TextBox_kota_spbe.Text + "','" + TextBox_provinsi_spbe.Text + "','" + TextBox_rayon_spbe.Text + "','" + TextBox_status_spbe.Text + "','" + TextBox_email_spbe.Text + "','" + TextBox_telp_spbe.Text + "','" + TextBox_koor_spbe.Text + "','" + TextBox_jmlsalur_spbe.Text + "','" + TextBox_jmltruk_spbe.Text + "','" + TextBox_kaptruk_spbe.Text + "','" + TextBox_jmlfill_spbe.Text + "','" + TextBox_jmltimbun_spbe.Text + "','" + TextBox_kaptimbun_spbe.Text + "','" + TextBox_jmltabung_spbe.Text + "','" + name + "')";

                SqlCommand cmd = new SqlCommand(s, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }   
        else
        {
            string s = "INSERT INTO spbe(no_vendor_spbe, id_spbe, tipe_spbe, produk_spbe, nama_spbe, alamat1_spbe, alamat2_spbe, kota_spbe, prov_spbe, rayon_spbe, status_spbe, email_spbe, telp_spbe, koor_spbe, jmlsalur_spbe, jmltruk_spbe, kaptruk_spbe, jmlfill_spbe, jmltimbun_spbe, kaptimbun_spbe, jmltabung_spbe) VALUES('" + TextBox_vendor_spbe.Text + "','" + TextBox_kode_spbe.Text + "','" + TextBox_tipe_spbe.Text + "','" + TextBox_produk_spbe.Text + "','" + TextBox_nama_spbe.Text + "','" + TextBox_alamat1_spbe.Text + "','" + TextBox_alamat2_spbe.Text + "','" + TextBox_kota_spbe.Text + "','" + TextBox_provinsi_spbe.Text + "','" + TextBox_rayon_spbe.Text + "','" + TextBox_status_spbe.Text + "','" + TextBox_email_spbe.Text + "','" + TextBox_telp_spbe.Text + "','" + TextBox_koor_spbe.Text + "','" + TextBox_jmlsalur_spbe.Text + "','" + TextBox_jmltruk_spbe.Text + "','" + TextBox_kaptruk_spbe.Text + "','" + TextBox_jmlfill_spbe.Text + "','" + TextBox_jmltimbun_spbe.Text + "','" + TextBox_kaptimbun_spbe.Text + "','" + TextBox_jmltabung_spbe.Text + "')";
            
            SqlCommand cmd = new SqlCommand(s, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void BindGridView_Spbe()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[spbe]",con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_Spbe.DataSource = dt;
            GridView_Spbe.DataBind();
        }
    }
    protected void GridView_Spbe_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_Spbe.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("delete from [dokumen_spbe] where [dokumen_spbe].[id_vendor_spbe]=" + id, con);
        SqlCommand cmd2 = new SqlCommand("delete from [histori_spbe] where [histori_spbe].[id_vendor_spbe]=" + id, con);
        SqlCommand cmd3 = new SqlCommand("delete from [image_spbe] where [image_spbe].[id_vendor_spbe]=" + id, con);
        SqlCommand cmd1 = new SqlCommand("delete from [spbe] where [id_vendor_spbe] =" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();

        BindGridView_Spbe();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView_Spbe_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id_vendor_spbe = GridView_Spbe.SelectedValue.ToString().Trim();
        Response.Redirect("~/Profil_Spbe.aspx?spbe=" + id_vendor_spbe);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}